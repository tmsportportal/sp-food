// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CheckoutController on _CheckoutControllerBase, Store {
  late final _$checkoutTypesResponseAtom = Atom(
      name: '_CheckoutControllerBase.checkoutTypesResponse', context: context);

  @override
  ObservableFuture<CheckoutTypesDto?> get checkoutTypesResponse {
    _$checkoutTypesResponseAtom.reportRead();
    return super.checkoutTypesResponse;
  }

  @override
  set checkoutTypesResponse(ObservableFuture<CheckoutTypesDto?> value) {
    _$checkoutTypesResponseAtom.reportWrite(value, super.checkoutTypesResponse,
        () {
      super.checkoutTypesResponse = value;
    });
  }

  late final _$checkoutResponseAtom =
      Atom(name: '_CheckoutControllerBase.checkoutResponse', context: context);

  @override
  ObservableFuture<void> get checkoutResponse {
    _$checkoutResponseAtom.reportRead();
    return super.checkoutResponse;
  }

  @override
  set checkoutResponse(ObservableFuture<void> value) {
    _$checkoutResponseAtom.reportWrite(value, super.checkoutResponse, () {
      super.checkoutResponse = value;
    });
  }

  late final _$deliveryAtom =
      Atom(name: '_CheckoutControllerBase.delivery', context: context);

  @override
  Delivery? get delivery {
    _$deliveryAtom.reportRead();
    return super.delivery;
  }

  @override
  set delivery(Delivery? value) {
    _$deliveryAtom.reportWrite(value, super.delivery, () {
      super.delivery = value;
    });
  }

  late final _$paymentAtom =
      Atom(name: '_CheckoutControllerBase.payment', context: context);

  @override
  int? get payment {
    _$paymentAtom.reportRead();
    return super.payment;
  }

  @override
  set payment(int? value) {
    _$paymentAtom.reportWrite(value, super.payment, () {
      super.payment = value;
    });
  }

  late final _$addressAtom =
      Atom(name: '_CheckoutControllerBase.address', context: context);

  @override
  String? get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(String? value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  late final _$_CheckoutControllerBaseActionController =
      ActionController(name: '_CheckoutControllerBase', context: context);

  @override
  void initController() {
    final _$actionInfo = _$_CheckoutControllerBaseActionController.startAction(
        name: '_CheckoutControllerBase.initController');
    try {
      return super.initController();
    } finally {
      _$_CheckoutControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _addAddressReaction() {
    final _$actionInfo = _$_CheckoutControllerBaseActionController.startAction(
        name: '_CheckoutControllerBase._addAddressReaction');
    try {
      return super._addAddressReaction();
    } finally {
      _$_CheckoutControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeAddress(String? address) {
    final _$actionInfo = _$_CheckoutControllerBaseActionController.startAction(
        name: '_CheckoutControllerBase.changeAddress');
    try {
      return super.changeAddress(address);
    } finally {
      _$_CheckoutControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeDeliveryType(Delivery? type) {
    final _$actionInfo = _$_CheckoutControllerBaseActionController.startAction(
        name: '_CheckoutControllerBase.changeDeliveryType');
    try {
      return super.changeDeliveryType(type);
    } finally {
      _$_CheckoutControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePaymentType(int? type) {
    final _$actionInfo = _$_CheckoutControllerBaseActionController.startAction(
        name: '_CheckoutControllerBase.changePaymentType');
    try {
      return super.changePaymentType(type);
    } finally {
      _$_CheckoutControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getCheckoutTypes() {
    final _$actionInfo = _$_CheckoutControllerBaseActionController.startAction(
        name: '_CheckoutControllerBase.getCheckoutTypes');
    try {
      return super.getCheckoutTypes();
    } finally {
      _$_CheckoutControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checkout(bool validate,
      {VoidCallback? successCallback, VoidCallback? errorCallback}) {
    final _$actionInfo = _$_CheckoutControllerBaseActionController.startAction(
        name: '_CheckoutControllerBase.checkout');
    try {
      return super.checkout(validate,
          successCallback: successCallback, errorCallback: errorCallback);
    } finally {
      _$_CheckoutControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _makeOrder(CheckoutDto checkoutDto,
      {VoidCallback? successCallback, VoidCallback? errorCallback}) {
    final _$actionInfo = _$_CheckoutControllerBaseActionController.startAction(
        name: '_CheckoutControllerBase._makeOrder');
    try {
      return super._makeOrder(checkoutDto,
          successCallback: successCallback, errorCallback: errorCallback);
    } finally {
      _$_CheckoutControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _initTextControllers() {
    final _$actionInfo = _$_CheckoutControllerBaseActionController.startAction(
        name: '_CheckoutControllerBase._initTextControllers');
    try {
      return super._initTextControllers();
    } finally {
      _$_CheckoutControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
checkoutTypesResponse: ${checkoutTypesResponse},
checkoutResponse: ${checkoutResponse},
delivery: ${delivery},
payment: ${payment},
address: ${address}
    ''';
  }
}
