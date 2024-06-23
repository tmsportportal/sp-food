import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sportportal_food/src/features/orders/data/dto/order_dto.dart';
import 'package:sportportal_food/src/features/orders/data/repository/orders_repository.dart';

part 'order_controller.g.dart';

class OrderController = _OrderControllerBase with _$OrderController;

abstract class _OrderControllerBase with Store {
  final _repository = GetIt.instance<OrdersRepository>();

  @observable
  var orderResponse = ObservableFuture<OrderDto?>.value(null);

  @computed
  bool get isLoading => orderResponse.status == FutureStatus.pending;

  @computed
  bool get isError => orderResponse.status == FutureStatus.rejected;

  int? id;

  void setupId(int id) {
    this.id = id;
  }

  @action
  void fetchOrder() {
    try {
      final future = _repository.getOrder(id);
      orderResponse = ObservableFuture(future);
    } catch (e) {
      log(e.toString());
      orderResponse = ObservableFuture.error(e);
    }
  }
}
