// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoritesController on _FavoritesControllerBase, Store {
  late final _$favoritesResponseAtom = Atom(
      name: '_FavoritesControllerBase.favoritesResponse', context: context);

  @override
  ObservableFuture<List<ProductListDto>?> get favoritesResponse {
    _$favoritesResponseAtom.reportRead();
    return super.favoritesResponse;
  }

  @override
  set favoritesResponse(ObservableFuture<List<ProductListDto>?> value) {
    _$favoritesResponseAtom.reportWrite(value, super.favoritesResponse, () {
      super.favoritesResponse = value;
    });
  }

  late final _$favoriteProductsAtom =
      Atom(name: '_FavoritesControllerBase.favoriteProducts', context: context);

  @override
  ObservableMap<int?, ProductListDto> get favoriteProducts {
    _$favoriteProductsAtom.reportRead();
    return super.favoriteProducts;
  }

  @override
  set favoriteProducts(ObservableMap<int?, ProductListDto> value) {
    _$favoriteProductsAtom.reportWrite(value, super.favoriteProducts, () {
      super.favoriteProducts = value;
    });
  }

  late final _$_syncResponseAtom =
      Atom(name: '_FavoritesControllerBase._syncResponse', context: context);

  @override
  ObservableFuture<void> get _syncResponse {
    _$_syncResponseAtom.reportRead();
    return super._syncResponse;
  }

  @override
  set _syncResponse(ObservableFuture<void> value) {
    _$_syncResponseAtom.reportWrite(value, super._syncResponse, () {
      super._syncResponse = value;
    });
  }

  late final _$_FavoritesControllerBaseActionController =
      ActionController(name: '_FavoritesControllerBase', context: context);

  @override
  void fetchFavorites() {
    final _$actionInfo = _$_FavoritesControllerBaseActionController.startAction(
        name: '_FavoritesControllerBase.fetchFavorites');
    try {
      return super.fetchFavorites();
    } finally {
      _$_FavoritesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addToFavorites(int? productId, ProductListDto productDto,
      {VoidCallback? unauthorizedCallback,
      VoidCallback? successCallback,
      VoidCallback? errorCallback}) {
    final _$actionInfo = _$_FavoritesControllerBaseActionController.startAction(
        name: '_FavoritesControllerBase.addToFavorites');
    try {
      return super.addToFavorites(productId, productDto,
          unauthorizedCallback: unauthorizedCallback,
          successCallback: successCallback,
          errorCallback: errorCallback);
    } finally {
      _$_FavoritesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFromFavorites(int? productId,
      {VoidCallback? unauthorizedCallback,
      VoidCallback? successCallback,
      VoidCallback? errorCallback}) {
    final _$actionInfo = _$_FavoritesControllerBaseActionController.startAction(
        name: '_FavoritesControllerBase.removeFromFavorites');
    try {
      return super.removeFromFavorites(productId,
          unauthorizedCallback: unauthorizedCallback,
          successCallback: successCallback,
          errorCallback: errorCallback);
    } finally {
      _$_FavoritesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favoritesResponse: ${favoritesResponse},
favoriteProducts: ${favoriteProducts}
    ''';
  }
}
