import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sportportal_food/src/features/orders/data/dto/order_dto.dart';
import 'package:sportportal_food/src/features/orders/data/repository/orders_repository.dart';

part 'orders_controller.g.dart';

class OrdersController = _OrdersControllerBase with _$OrdersController;

abstract class _OrdersControllerBase with Store {
  final _repository = GetIt.instance<OrdersRepository>();

  @observable
  var ordersResponse = ObservableFuture<List<OrderDto>?>.value(null);

  @computed
  bool get isLoading => ordersResponse.status == FutureStatus.pending;

  @computed
  bool get isError => ordersResponse.status == FutureStatus.rejected;

  @action
  void fetchOrders() {
    try {
      final future = _repository.getOrders();
      ordersResponse = ObservableFuture(future);
    } catch (e) {
      log(e.toString());
      ordersResponse = ObservableFuture.error(e);
    }
  }
}
