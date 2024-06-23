import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sportportal_food/src/core/local/key_value_storage_service.dart';
import 'package:sportportal_food/src/features/cart/data/dto/cart_product_dto.dart';
import 'package:sportportal_food/src/features/cart/data/repository/cart_repository.dart';
import 'package:sportportal_food/src/features/product/data/dto/product_list_dto.dart';

import '../../auth/controller/account_status_controller.dart';
import '../data/dto/cart_dto.dart';

part 'cart_controller.g.dart';

class CartController = _CartControllerBase with _$CartController;

abstract class _CartControllerBase with Store {
  final _repository = GetIt.instance<CartRepository>();
  final _accountStatusController = GetIt.instance<AccountStatusController>();

  @observable
  var cartProducts = ObservableMap<int?, CartProductDto?>();

  @observable
  var cartResponse = ObservableFuture<CartDto?>.value(null);

  @observable
  var syncResponse = ObservableFuture<dynamic>.value(null);

  final _keyValueStorageService = KeyValueStorageService();

  @computed
  double? get total {
    double total = 0.0;
    for (final element in cartProducts.entries) {
      total +=
          (element.value?.product?.price ?? 1) * (element.value?.quantity ?? 1);
    }
    return total;
  }

  String? uuid;

  int? id;

  ReactionDisposer? _disposer;

  void _initReaction() {
    _disposer ??= reaction(
      (p0) => _accountStatusController.accountLoginStatus,
      (p0) {
        cartProducts.clear();
        cartResponse = ObservableFuture.value(null);
        syncResponse = ObservableFuture.value(null);
        if (p0 == AccountLoginStatus.notLoggedIn) {
          uuid = null;
        }
        if (p0 == AccountLoginStatus.loggedIn) {
          _initUUID();
        }
      },
    );
  }

  /// If UUID stored in the SecureStorage is empty
  /// First we have to create cart UUID
  @action
  void addToCart(int? productId, ProductListDto? productListDto,
      {VoidCallback? onSuccess, VoidCallback? onError}) {
    if (uuid?.isEmpty ?? true) {
      // creating cart UUID and then add product to cart
      _createCart(productId, productListDto,
          onSuccess: onSuccess, onError: onError);
    } else {
      _addToCart(productId, productListDto,
          onSuccess: onSuccess, onError: onError);
    }
  }

  @action
  void incrementProductQuantity(int? productId) {
    if (syncResponse.status != FutureStatus.pending) {
      final product = cartProducts[productId];
      final quantity = (product?.quantity ?? 0) + 1;
      if ((product?.product?.stockQuantity ?? 0) > (product?.quantity ?? 0)) {
        _updateProductQuantity(
            productId, quantity, product?.quantity ?? 0, product?.id);
      }
    }
  }

  @action
  void decrementProductQuantity(int? productId) {
    if (syncResponse.status != FutureStatus.pending) {
      final product = cartProducts[productId];
      final quantity = (product?.quantity ?? 1) - 1;
      _updateProductQuantity(
          productId, quantity, (product?.quantity ?? 0), product?.id);
    }
  }

  @action
  void _updateCartProductQuantity(int? productId, int quantity) {
    cartProducts[productId]?.quantity = quantity;
    cartProducts = cartProducts;
  }

  @action
  void _updateProductQuantity(
      int? productId, int quantity, int prevQuantity, int? productKey) {
    if (quantity >= 1) {
      _updateCartProductQuantity(productId, quantity);
      final future = _repository.updateProductCount(
          productKey: productKey, quantity: quantity);
      syncResponse = ObservableFuture(future).catchError((e) {
        syncResponse = ObservableFuture.error(e);
        _updateCartProductQuantity(productId, prevQuantity);

        debugPrint(e.toString());
      });
    } else {
      removeProduct(productId);
    }
  }

  @action
  void removeProduct(int? productId,
      {VoidCallback? onSuccess, VoidCallback? onError}) {
    if (syncResponse.status != FutureStatus.pending) {
      final CartProductDto? product = cartProducts[productId];
      cartProducts.remove(productId);
      final future = _repository.removeProductFromCart(productKey: product?.id);
      syncResponse = ObservableFuture(future).catchError((e) {
        syncResponse = ObservableFuture.error(e);
        cartProducts[productId] = product;
        debugPrint(e.toString());
      });
    }
  }

  @action
  void _addToCart(int? productId, ProductListDto? productListDto,
      {VoidCallback? onSuccess, VoidCallback? onError}) {
    cartProducts[productId] =
        CartProductDto(quantity: 1, product: productListDto);
    try {
      final future = _repository.addProductToCart(
          uuid: uuid, productId: productId, id: id);
      syncResponse = ObservableFuture(future).then((value) {
        cartProducts[productId] = CartProductDto(
          id: value,
          quantity: 1,
          product: productListDto,
        );
        if (onSuccess != null) {
          onSuccess();
        }
      }).catchError((e) {
        if (onError != null) {
          onError();
        }
        log('Error [add product to cart]: $e');
        syncResponse = ObservableFuture.error(e);
        cartProducts.remove(productId);
        return e;
      });
    } on Exception catch (e) {
      log('Error [add product to cart]: $e');
      syncResponse = ObservableFuture.error(e);
    }
  }

  @action
  void fetchCartProducts() {
    try {
      final future = _repository.getCartProducts(uuid);
      cartResponse = ObservableFuture(future).then((value) {
        id = value.id;
        for (final element in value.items ?? <CartProductDto>[]) {
          cartProducts[element.product?.id] = element;
        }
        return value;
      });
    } catch (e) {
      log('Error [fetch cart products]: $e');
      cartResponse = ObservableFuture.error(e);
    }
  }

  @action
  Future<void> _createCart(int? productId, ProductListDto? productListDto,
      {VoidCallback? onSuccess, VoidCallback? onError}) async {
    try {
      final future = _repository.createCart();
      syncResponse = ObservableFuture(future).then((value) async {
        uuid = value?['uuid'];
        id = cartResponse.value?.id;
        await _keyValueStorageService.setBasketUUID(uuid ?? '');
        _addToCart(productId, productListDto,
            onSuccess: onSuccess, onError: onError);
      });
    } catch (e) {
      log('Error [creating cart]: $e');
      syncResponse = ObservableFuture.error(e);
    }
  }

  @action
  Future<void> initController() async {
    _initReaction();
    _initUUID();
  }

  void _initUUID() async {
    uuid = await _keyValueStorageService.getBasketUUID();
    if (uuid?.isNotEmpty ?? false) {
      fetchCartProducts();
    }
  }
}
