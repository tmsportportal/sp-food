import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sportportal_food/src/features/auth/controller/account_status_controller.dart';
import 'package:sportportal_food/src/features/favorites/data/repository/favorites_repository.dart';
import 'package:sportportal_food/src/features/product/data/dto/product_list_dto.dart';

part 'favorites_controller.g.dart';

class FavoritesController = _FavoritesControllerBase with _$FavoritesController;

abstract class _FavoritesControllerBase with Store {
  final _repository = GetIt.instance<FavoritesRepository>();
  final _accountStatusController = GetIt.instance<AccountStatusController>();

  @observable
  var favoritesResponse = ObservableFuture<List<ProductListDto>?>.value(null);

  @observable
  var favoriteProducts = ObservableMap<int?, ProductListDto>.of({});

  @observable
  var _syncResponse = ObservableFuture<void>.value(null);

  ReactionDisposer? _disposer;

  void initController() {
    _disposer ??=
        reaction((p0) => _accountStatusController.accountLoginStatus, (p0) {
      favoriteProducts.clear();
      if (p0 == AccountLoginStatus.loggedIn) {
        fetchFavorites();
      }
    });
  }

  void dispose() {
    if (_disposer != null) {
      _disposer!();
    }
  }

  @action
  void fetchFavorites() {
    try {
      final future = _repository.getFavorites();
      favoritesResponse = ObservableFuture(future).then((value) {
        for (final el in value) {
          favoriteProducts.addAll({el.id: el});
        }
        return value;
      });
    } catch (e) {
      // debugPrint(e.toString());
      log(e.toString());
      favoritesResponse = ObservableFuture.error(e);
    }
  }

  @action
  void addToFavorites(int? productId, ProductListDto productDto,
      {VoidCallback? unauthorizedCallback,
      VoidCallback? successCallback,
      VoidCallback? errorCallback}) {
    if (_accountStatusController.accountLoginStatus ==
        AccountLoginStatus.notLoggedIn) {
      if (unauthorizedCallback != null) {
        unauthorizedCallback();
      }
    } else if (_accountStatusController.accountLoginStatus ==
        AccountLoginStatus.loggedIn) {
      if (_syncResponse.status != FutureStatus.pending) {
        favoriteProducts[productId] = productDto;
        final future = _repository.addToFavorites(productId ?? 1);
        _syncResponse = ObservableFuture(future).then((value) {
          if (successCallback != null) {
            successCallback();
          }
        }).catchError((e) {
          _syncResponse = ObservableFuture.error(e);
          favoriteProducts.remove(productId);
        });
      }
    }
  }

  @action
  void removeFromFavorites(int? productId,
      {VoidCallback? unauthorizedCallback,
      VoidCallback? successCallback,
      VoidCallback? errorCallback}) {
    if (_accountStatusController.accountLoginStatus ==
        AccountLoginStatus.notLoggedIn) {
      if (unauthorizedCallback != null) {
        unauthorizedCallback();
      }
    } else if (_accountStatusController.accountLoginStatus ==
        AccountLoginStatus.loggedIn) {
      if (_syncResponse.status != FutureStatus.pending) {
        final product = favoriteProducts[productId];
        favoriteProducts.remove(productId);

        final future = _repository.removeFromFavorites(productId ?? 1);
        _syncResponse = ObservableFuture(future).then((value) {
          if (successCallback != null) {
            successCallback();
          }
        }).catchError((e) {
          _syncResponse = ObservableFuture.error(e);
          favoriteProducts
              .addAll({productId: product ?? const ProductListDto()});
          if (errorCallback != null) {
            errorCallback();
          }
        });
      }
    }
  }
}
