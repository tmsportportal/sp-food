// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartController on _CartControllerBase, Store {
  Computed<double?>? _$totalComputed;

  @override
  double? get total => (_$totalComputed ??= Computed<double?>(() => super.total,
          name: '_CartControllerBase.total'))
      .value;

  late final _$cartProductsAtom =
      Atom(name: '_CartControllerBase.cartProducts', context: context);

  @override
  ObservableMap<int?, CartProductDto?> get cartProducts {
    _$cartProductsAtom.reportRead();
    return super.cartProducts;
  }

  @override
  set cartProducts(ObservableMap<int?, CartProductDto?> value) {
    _$cartProductsAtom.reportWrite(value, super.cartProducts, () {
      super.cartProducts = value;
    });
  }

  late final _$cartResponseAtom =
      Atom(name: '_CartControllerBase.cartResponse', context: context);

  @override
  ObservableFuture<CartDto?> get cartResponse {
    _$cartResponseAtom.reportRead();
    return super.cartResponse;
  }

  @override
  set cartResponse(ObservableFuture<CartDto?> value) {
    _$cartResponseAtom.reportWrite(value, super.cartResponse, () {
      super.cartResponse = value;
    });
  }

  late final _$syncResponseAtom =
      Atom(name: '_CartControllerBase.syncResponse', context: context);

  @override
  ObservableFuture<dynamic> get syncResponse {
    _$syncResponseAtom.reportRead();
    return super.syncResponse;
  }

  @override
  set syncResponse(ObservableFuture<dynamic> value) {
    _$syncResponseAtom.reportWrite(value, super.syncResponse, () {
      super.syncResponse = value;
    });
  }

  late final _$_createCartAsyncAction =
      AsyncAction('_CartControllerBase._createCart', context: context);

  @override
  Future<void> _createCart(int? productId, ProductListDto? productListDto,
      {VoidCallback? onSuccess, VoidCallback? onError}) {
    return _$_createCartAsyncAction.run(() => super._createCart(
        productId, productListDto,
        onSuccess: onSuccess, onError: onError));
  }

  late final _$initControllerAsyncAction =
      AsyncAction('_CartControllerBase.initController', context: context);

  @override
  Future<void> initController() {
    return _$initControllerAsyncAction.run(() => super.initController());
  }

  late final _$_CartControllerBaseActionController =
      ActionController(name: '_CartControllerBase', context: context);

  @override
  void addToCart(int? productId, ProductListDto? productListDto,
      {VoidCallback? onSuccess, VoidCallback? onError}) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase.addToCart');
    try {
      return super.addToCart(productId, productListDto,
          onSuccess: onSuccess, onError: onError);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incrementProductQuantity(int? productId) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase.incrementProductQuantity');
    try {
      return super.incrementProductQuantity(productId);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrementProductQuantity(int? productId) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase.decrementProductQuantity');
    try {
      return super.decrementProductQuantity(productId);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _updateCartProductQuantity(int? productId, int quantity) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase._updateCartProductQuantity');
    try {
      return super._updateCartProductQuantity(productId, quantity);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _updateProductQuantity(
      int? productId, int quantity, int prevQuantity, int? productKey) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase._updateProductQuantity');
    try {
      return super._updateProductQuantity(
          productId, quantity, prevQuantity, productKey);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeProduct(int? productId,
      {VoidCallback? onSuccess, VoidCallback? onError}) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase.removeProduct');
    try {
      return super
          .removeProduct(productId, onSuccess: onSuccess, onError: onError);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _addToCart(int? productId, ProductListDto? productListDto,
      {VoidCallback? onSuccess, VoidCallback? onError}) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase._addToCart');
    try {
      return super._addToCart(productId, productListDto,
          onSuccess: onSuccess, onError: onError);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetchCartProducts() {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase.fetchCartProducts');
    try {
      return super.fetchCartProducts();
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cartProducts: ${cartProducts},
cartResponse: ${cartResponse},
syncResponse: ${syncResponse},
total: ${total}
    ''';
  }
}
