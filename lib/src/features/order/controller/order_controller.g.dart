// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrderController on _OrderControllerBase, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_OrderControllerBase.isLoading'))
          .value;
  Computed<bool>? _$isErrorComputed;

  @override
  bool get isError => (_$isErrorComputed ??= Computed<bool>(() => super.isError,
          name: '_OrderControllerBase.isError'))
      .value;

  late final _$orderResponseAtom =
      Atom(name: '_OrderControllerBase.orderResponse', context: context);

  @override
  ObservableFuture<OrderDto?> get orderResponse {
    _$orderResponseAtom.reportRead();
    return super.orderResponse;
  }

  @override
  set orderResponse(ObservableFuture<OrderDto?> value) {
    _$orderResponseAtom.reportWrite(value, super.orderResponse, () {
      super.orderResponse = value;
    });
  }

  late final _$_OrderControllerBaseActionController =
      ActionController(name: '_OrderControllerBase', context: context);

  @override
  void fetchOrder() {
    final _$actionInfo = _$_OrderControllerBaseActionController.startAction(
        name: '_OrderControllerBase.fetchOrder');
    try {
      return super.fetchOrder();
    } finally {
      _$_OrderControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
orderResponse: ${orderResponse},
isLoading: ${isLoading},
isError: ${isError}
    ''';
  }
}
