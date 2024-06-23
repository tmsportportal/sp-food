import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sportportal_food/src/features/categories/data/dto/category_dto.dart';
import 'package:sportportal_food/src/features/categories/data/repository/categories_repository.dart';

part 'categories_controller.g.dart';

class CategoriesController = _CategoriesControllerBase
    with _$CategoriesController;

abstract class _CategoriesControllerBase with Store {
  final _repository = GetIt.instance<CategoriesRepository>();

  @observable
  var categoriesResponse = ObservableFuture<List<CategoryDto>>.value([]);

  @action
  void fetchCategories() {
    try {
      final future = _repository.getCategories();
      categoriesResponse = ObservableFuture(future);
    } catch (e) {
      categoriesResponse = ObservableFuture.error(e);
      debugPrint(e.toString());
    }
  }
}
