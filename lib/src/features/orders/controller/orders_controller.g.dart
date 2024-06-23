// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrdersController on _OrdersControllerBase, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_OrdersControllerBase.isLoading'))
          .value;
  Computed<bool>? _$isErrorComputed;

  @override
  bool get isError => (_$isErrorComputed ??= Computed<bool>(() => super.isError,
          name: '_OrdersControllerBase.isError'))
      .value;

  late final _$ordersResponseAtom =
      Atom(name: '_OrdersControllerBase.ordersResponse', context: context);

  @override
  ObservableFuture<List<OrderDto>?> get ordersResponse {
    _$ordersResponseAtom.reportRead();
    return super.ordersResponse;
  }

  @override
  set ordersResponse(ObservableFuture<List<OrderDto>?> value) {
    _$ordersResponseAtom.reportWrite(value, super.ordersResponse, () {
      super.ordersResponse = value;
    });
  }

  late final _$_OrdersControllerBaseActionController =
      ActionController(name: '_OrdersControllerBase', context: context);

  @override
  void fetchOrders() {
    final _$actionInfo = _$_OrdersControllerBaseActionController.startAction(
        name: '_OrdersControllerBase.fetchOrders');
    try {
      return super.fetchOrders();
    } finally {
      _$_OrdersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
ordersResponse: ${ordersResponse},
isLoading: ${isLoading},
isError: ${isError}
    ''';
  }
}
