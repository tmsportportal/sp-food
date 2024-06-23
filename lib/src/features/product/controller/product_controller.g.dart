// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductController on _ProductControllerBase, Store {
  late final _$productResponseAtom =
      Atom(name: '_ProductControllerBase.productResponse', context: context);

  @override
  ObservableFuture<ProductDetailDto?> get productResponse {
    _$productResponseAtom.reportRead();
    return super.productResponse;
  }

  @override
  set productResponse(ObservableFuture<ProductDetailDto?> value) {
    _$productResponseAtom.reportWrite(value, super.productResponse, () {
      super.productResponse = value;
    });
  }

  late final _$_ProductControllerBaseActionController =
      ActionController(name: '_ProductControllerBase', context: context);

  @override
  void fetchProduct(String? slug) {
    final _$actionInfo = _$_ProductControllerBaseActionController.startAction(
        name: '_ProductControllerBase.fetchProduct');
    try {
      return super.fetchProduct(slug);
    } finally {
      _$_ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
productResponse: ${productResponse}
    ''';
  }
}
