import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sportportal_food/src/features/category/data/repository/category_repository.dart';
import 'package:sportportal_food/src/features/product/data/dto/product_list_dto.dart';

import '../../categories/data/dto/category_dto.dart';

part 'category_controller.g.dart';

class CategoryController = _CategoryControllerBase with _$CategoryController;

abstract class _CategoryControllerBase with Store {
  final _categoryRepository = GetIt.instance<CategoryRepository>();

  @observable
  var productsResponse = ObservableFuture<List<ProductListDto>>.value([]);

  @observable
  var categoryResponse = ObservableFuture<CategoryDto?>.value(null);

  @observable
  Observable<CategoryDto?> currentCategory = Observable<CategoryDto?>(null);

  CategoryDto? mainCategory;

  String? mainCategorySlug;
  String? categorySlug;

  @observable
  ObservableList<CategoryDto?> breadCrumbs = ObservableList.of([]);

  @observable
  ObservableList<CategoryDto?> subCategories = ObservableList.of([]);

  void setupCategorySlug(String? slug) {
    mainCategorySlug = slug;
    categorySlug = slug;
  }

  @action
  void addToBreadCrumbs(CategoryDto? categoryDto) {
    if (breadCrumbs.isEmpty) {
      breadCrumbs.add(mainCategory);
    }
    breadCrumbs.add(categoryDto);
    updateCurrentCategory(categoryDto);
  }

  @action
  void removeFromBreadCrumbs(CategoryDto? categoryDto) {
    if (categoryDto?.slug == mainCategorySlug) {
      breadCrumbs.clear();
      updateCurrentCategory(mainCategory);
    } else {
      if (categoryDto?.slug != categorySlug) {
        final index = breadCrumbs.indexOf(categoryDto);
        breadCrumbs.removeRange(index + 1, breadCrumbs.length);
        breadCrumbs = breadCrumbs;
        updateCurrentCategory(categoryDto);
      }
    }
  }

  @action
  void updateCurrentCategory(CategoryDto? categoryDto) {
    currentCategory.value = categoryDto;
    fetchProducts();
  }

  @action
  void fetchCategory() {
    try {
      final future = _categoryRepository.getCategory(categorySlug);
      categoryResponse = ObservableFuture(future).then((value) {
        currentCategory.value = value;
        mainCategory = value;
        fetchProducts();
        return value;
      });
    } on Exception catch (e) {
      categoryResponse = ObservableFuture.error(e);
      log(e.toString());
    }
  }

  @action
  void fetchProducts() {
    try {
      final future =
          _categoryRepository.getCategoryProducts(currentCategory.value?.slug);
      productsResponse = ObservableFuture(future);
    } on Exception catch (e) {
      productsResponse = ObservableFuture.error(e);
      log(e.toString());
    }
  }

  void initController() {
    fetchCategory();
  }
}
