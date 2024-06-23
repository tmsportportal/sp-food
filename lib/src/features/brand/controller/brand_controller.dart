import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sportportal_food/src/features/brand/data/repository/brand_repository.dart';

import '../../product/data/dto/product_list_dto.dart';

part 'brand_controller.g.dart';

class BrandController = _BrandControllerBase with _$BrandController;

abstract class _BrandControllerBase with Store {
  final _productsRepository = GetIt.instance<BrandRepository>();

  @observable
  var productsResponse = ObservableFuture<List<ProductListDto>>.value([]);

  @action
  void fetchProducts(String? slug) {
    try {
      final future = _productsRepository.getBrandProducts(slug);
      productsResponse = ObservableFuture(future);
    } on Exception catch (e) {
      productsResponse = ObservableFuture.error(e);
      log(e.toString());
    }
  }
}
