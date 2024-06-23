import 'package:async/async.dart' show CancelableOperation;

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sportportal_food/src/features/product/data/repository/products_repository.dart';

import '../../product/data/dto/product_list_dto.dart';

part 'search_controller.g.dart';

class SearchStoreController = _SearchStoreControllerBase with _$SearchStoreController;

abstract class _SearchStoreControllerBase with Store {
  final _repository = GetIt.instance<ProductsRepository>();
  @observable
  var searchProducts = ObservableList<ProductListDto>();

  static ObservableFuture<List<ProductListDto>> emptyResponse =
      ObservableFuture.value([]);

  @observable
  ObservableFuture<List<ProductListDto>> productsResponse = emptyResponse;

  CancelableOperation<List<ProductListDto>>? productsRequest;

  @action
  void getSearchProducts(String key) {
    productsRequest?.cancel();

    searchProducts = ObservableList<ProductListDto>();
    if (key.trim().isNotEmpty) {
      try {
        final future = _repository.getProducts(key);
        productsResponse = ObservableFuture(future);
        productsRequest = CancelableOperation.fromFuture(future);
        productsResponse.then((products) {
          searchProducts = ObservableList.of(products);
        });
      } catch (e) {
        productsResponse = ObservableFuture.error(e);
      }
    }
  }
}
