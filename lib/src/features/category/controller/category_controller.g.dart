// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CategoryController on _CategoryControllerBase, Store {
  late final _$productsResponseAtom =
      Atom(name: '_CategoryControllerBase.productsResponse', context: context);

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

  late final _$categoryResponseAtom =
      Atom(name: '_CategoryControllerBase.categoryResponse', context: context);

  @override
  ObservableFuture<CategoryDto?> get categoryResponse {
    _$categoryResponseAtom.reportRead();
    return super.categoryResponse;
  }

  @override
  set categoryResponse(ObservableFuture<CategoryDto?> value) {
    _$categoryResponseAtom.reportWrite(value, super.categoryResponse, () {
      super.categoryResponse = value;
    });
  }

  late final _$currentCategoryAtom =
      Atom(name: '_CategoryControllerBase.currentCategory', context: context);

  @override
  Observable<CategoryDto?> get currentCategory {
    _$currentCategoryAtom.reportRead();
    return super.currentCategory;
  }

  @override
  set currentCategory(Observable<CategoryDto?> value) {
    _$currentCategoryAtom.reportWrite(value, super.currentCategory, () {
      super.currentCategory = value;
    });
  }

  late final _$breadCrumbsAtom =
      Atom(name: '_CategoryControllerBase.breadCrumbs', context: context);

  @override
  ObservableList<CategoryDto?> get breadCrumbs {
    _$breadCrumbsAtom.reportRead();
    return super.breadCrumbs;
  }

  @override
  set breadCrumbs(ObservableList<CategoryDto?> value) {
    _$breadCrumbsAtom.reportWrite(value, super.breadCrumbs, () {
      super.breadCrumbs = value;
    });
  }

  late final _$subCategoriesAtom =
      Atom(name: '_CategoryControllerBase.subCategories', context: context);

  @override
  ObservableList<CategoryDto?> get subCategories {
    _$subCategoriesAtom.reportRead();
    return super.subCategories;
  }

  @override
  set subCategories(ObservableList<CategoryDto?> value) {
    _$subCategoriesAtom.reportWrite(value, super.subCategories, () {
      super.subCategories = value;
    });
  }

  late final _$_CategoryControllerBaseActionController =
      ActionController(name: '_CategoryControllerBase', context: context);

  @override
  void addToBreadCrumbs(CategoryDto? categoryDto) {
    final _$actionInfo = _$_CategoryControllerBaseActionController.startAction(
        name: '_CategoryControllerBase.addToBreadCrumbs');
    try {
      return super.addToBreadCrumbs(categoryDto);
    } finally {
      _$_CategoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFromBreadCrumbs(CategoryDto? categoryDto) {
    final _$actionInfo = _$_CategoryControllerBaseActionController.startAction(
        name: '_CategoryControllerBase.removeFromBreadCrumbs');
    try {
      return super.removeFromBreadCrumbs(categoryDto);
    } finally {
      _$_CategoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateCurrentCategory(CategoryDto? categoryDto) {
    final _$actionInfo = _$_CategoryControllerBaseActionController.startAction(
        name: '_CategoryControllerBase.updateCurrentCategory');
    try {
      return super.updateCurrentCategory(categoryDto);
    } finally {
      _$_CategoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetchCategory() {
    final _$actionInfo = _$_CategoryControllerBaseActionController.startAction(
        name: '_CategoryControllerBase.fetchCategory');
    try {
      return super.fetchCategory();
    } finally {
      _$_CategoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetchProducts() {
    final _$actionInfo = _$_CategoryControllerBaseActionController.startAction(
        name: '_CategoryControllerBase.fetchProducts');
    try {
      return super.fetchProducts();
    } finally {
      _$_CategoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
productsResponse: ${productsResponse},
categoryResponse: ${categoryResponse},
currentCategory: ${currentCategory},
breadCrumbs: ${breadCrumbs},
subCategories: ${subCategories}
    ''';
  }
}
