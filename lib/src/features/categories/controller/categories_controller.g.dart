// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CategoriesController on _CategoriesControllerBase, Store {
  late final _$categoriesResponseAtom = Atom(
      name: '_CategoriesControllerBase.categoriesResponse', context: context);

  @override
  ObservableFuture<List<CategoryDto>> get categoriesResponse {
    _$categoriesResponseAtom.reportRead();
    return super.categoriesResponse;
  }

  @override
  set categoriesResponse(ObservableFuture<List<CategoryDto>> value) {
    _$categoriesResponseAtom.reportWrite(value, super.categoriesResponse, () {
      super.categoriesResponse = value;
    });
  }

  late final _$_CategoriesControllerBaseActionController =
      ActionController(name: '_CategoriesControllerBase', context: context);

  @override
  void fetchCategories() {
    final _$actionInfo = _$_CategoriesControllerBaseActionController
        .startAction(name: '_CategoriesControllerBase.fetchCategories');
    try {
      return super.fetchCategories();
    } finally {
      _$_CategoriesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
categoriesResponse: ${categoriesResponse}
    ''';
  }
}
