import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sportportal_food/src/features/product/data/dto/product_detail_dto.dart';

import '../data/repository/products_repository.dart';

part 'product_controller.g.dart';

class ProductController = _ProductControllerBase with _$ProductController;

abstract class _ProductControllerBase with Store {
  final _repository = GetIt.instance<ProductsRepository>();

  @observable
  var productResponse = ObservableFuture<ProductDetailDto?>.value(null);

  @action
  void fetchProduct(String? slug) {
    try {
      final future = _repository.getProductBySlug(slug);
      productResponse = ObservableFuture(future);
    } catch (e) {
      productResponse = ObservableFuture.error(e);
      log(e.toString());
    }
  }
}
