// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchStoreController on _SearchStoreControllerBase, Store {
  late final _$searchProductsAtom =
      Atom(name: '_SearchStoreControllerBase.searchProducts', context: context);

  @override
  ObservableList<ProductListDto> get searchProducts {
    _$searchProductsAtom.reportRead();
    return super.searchProducts;
  }

  @override
  set searchProducts(ObservableList<ProductListDto> value) {
    _$searchProductsAtom.reportWrite(value, super.searchProducts, () {
      super.searchProducts = value;
    });
  }

  late final _$productsResponseAtom = Atom(
      name: '_SearchStoreControllerBase.productsResponse', context: context);

  @override
  ObservableFuture<List<ProductListDto>> get productsResponse {
    _$productsResponseAtom.reportRead();
    return super.productsResponse;
  }

  @override
  set productsResponse(ObservableFuture<List<ProductListDto>> value) {
    _$productsResponseAtom.reportWrite(value, super.productsResponse, () {
      super.productsResponse = value;
    });
  }

  late final _$_SearchStoreControllerBaseActionController =
      ActionController(name: '_SearchStoreControllerBase', context: context);

  @override
  void getSearchProducts(String key) {
    final _$actionInfo = _$_SearchStoreControllerBaseActionController
        .startAction(name: '_SearchStoreControllerBase.getSearchProducts');
    try {
      return super.getSearchProducts(key);
    } finally {
      _$_SearchStoreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchProducts: ${searchProducts},
productsResponse: ${productsResponse}
    ''';
  }
}
