import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sportportal_food/src/features/brands/data/repository/brands_repository.dart';

import '../../brand/data/dto/brand_dto.dart';

part 'brands_controller.g.dart';

class BrandsController = _BrandsControllerBase with _$BrandsController;

abstract class _BrandsControllerBase with Store {
  final _repository = GetIt.instance<BrandsRepository>();

  @observable
  var brandsResponse = ObservableFuture<List<BrandDto>>.value([]);

  @action
  void fetchBrands() {
    try {
      final future = _repository.getBrands();
      brandsResponse = ObservableFuture(future);
    } on Exception catch (e) {
      brandsResponse = ObservableFuture.error(e);
      debugPrint(e.toString());
    }
  }
}
