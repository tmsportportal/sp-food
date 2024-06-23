// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brands_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BrandsController on _BrandsControllerBase, Store {
  late final _$brandsResponseAtom =
      Atom(name: '_BrandsControllerBase.brandsResponse', context: context);

  @override
  ObservableFuture<List<BrandDto>> get brandsResponse {
    _$brandsResponseAtom.reportRead();
    return super.brandsResponse;
  }

  @override
  set brandsResponse(ObservableFuture<List<BrandDto>> value) {
    _$brandsResponseAtom.reportWrite(value, super.brandsResponse, () {
      super.brandsResponse = value;
    });
  }

  late final _$_BrandsControllerBaseActionController =
      ActionController(name: '_BrandsControllerBase', context: context);

  @override
  void fetchBrands() {
    final _$actionInfo = _$_BrandsControllerBaseActionController.startAction(
        name: '_BrandsControllerBase.fetchBrands');
    try {
      return super.fetchBrands();
    } finally {
      _$_BrandsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
brandsResponse: ${brandsResponse}
    ''';
  }
}
