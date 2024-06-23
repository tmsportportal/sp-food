// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BrandController on _BrandControllerBase, Store {
  late final _$productsResponseAtom =
      Atom(name: '_BrandControllerBase.productsResponse', context: context);

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

  late final _$_BrandControllerBaseActionController =
      ActionController(name: '_BrandControllerBase', context: context);

  @override
  void fetchProducts(String? slug) {
    final _$actionInfo = _$_BrandControllerBaseActionController.startAction(
        name: '_BrandControllerBase.fetchProducts');
    try {
      return super.fetchProducts(slug);
    } finally {
      _$_BrandControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
productsResponse: ${productsResponse}
    ''';
  }
}
