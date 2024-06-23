import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sportportal_food/src/features/address/controller/address_controller.dart';
import 'package:sportportal_food/src/features/cart/controller/cart_controller.dart';
import 'package:sportportal_food/src/features/checkout/data/dto/checkout_dto.dart';
import 'package:sportportal_food/src/features/checkout/data/dto/checkout_types_dto.dart';

import '../../account_info/controller/account_info_controller.dart';
import '../data/repository/checkout_repository.dart';

part 'checkout_controller.g.dart';

class CheckoutController = _CheckoutControllerBase with _$CheckoutController;

abstract class _CheckoutControllerBase with Store {
  final _repository = GetIt.instance<CheckoutRepository>();
  final accountInfoController = GetIt.instance<AccountInfoController>();

  @observable
  var checkoutTypesResponse = ObservableFuture<CheckoutTypesDto?>.value(null);

  @observable
  var checkoutResponse = ObservableFuture<void>.value(null);

  @observable
  Delivery? delivery;

  @observable
  int? payment;

  @observable
  String? address;

  ReactionDisposer? accountInfoDisposer;

  final cartController = GetIt.instance<CartController>();
  final addressController = GetIt.instance<AddressController>();

  final fullNameTextController = TextEditingController();
  final phoneNumberTextController = TextEditingController();
  final noteTextController = TextEditingController();
  final addressDetailTextController = TextEditingController();

  @action
  void initController() {
    address = addressController.currentAddress;
    _addAddressReaction();
    _initTextControllers();
    getCheckoutTypes();
  }

  @action
  void _addAddressReaction() {
    accountInfoDisposer =
        reaction((p0) => accountInfoController.accountInfo, (p0) {
      _initTextControllers();
    });
  }

  @action
  void changeAddress(String? address) {
    this.address = address;
  }

  @action
  void changeDeliveryType(Delivery? type) {
    delivery = type;
  }

  @action
  void changePaymentType(int? type) {
    payment = type;
  }

  @action
  void getCheckoutTypes() {
    try {
      final future = _repository.getCheckoutTypes();
      checkoutTypesResponse = ObservableFuture(future);
    } on Exception catch (e) {
      checkoutTypesResponse = ObservableFuture.error(e);
      log(e.toString());
    }
  }

  @action
  void checkout(bool validate,
      {VoidCallback? successCallback, VoidCallback? errorCallback}) {
    if (validate) {
      final checkoutDto = CheckoutDto(
        basket: cartController.cartResponse.value?.id,
        address: address,
        addressDetail: addressDetailTextController.text,
        note: noteTextController.text,
        delivery: delivery?.id,
        payment: payment,
        fullName: fullNameTextController.text,
        phoneNumber: phoneNumberTextController.text,
      );
      _makeOrder(
        checkoutDto,
        successCallback: successCallback,
        errorCallback: errorCallback,
      );
    }
  }

  @action
  void _makeOrder(CheckoutDto checkoutDto,
      {VoidCallback? successCallback, VoidCallback? errorCallback}) {
    final future = _repository.checkout(checkoutDto);
    checkoutResponse = ObservableFuture(future).then((value) {
      if (successCallback != null) {
        successCallback();
      }
    }).catchError((e) {
      if (errorCallback != null) {
        errorCallback();
      }
      checkoutResponse = ObservableFuture.error(e);
      log(e.toString());
    });
  }

  @action
  void _initTextControllers() {
    final accountInfo = accountInfoController.accountInfo;
    if (accountInfo != null) {
      fullNameTextController.text =
          '${accountInfo.firstName} ${accountInfo.lastName}';
      phoneNumberTextController.text = accountInfo.phoneNumber ?? '';
    } else {
      fullNameTextController.clear();
      phoneNumberTextController.clear();
    }
  }

  void dispose() {
    addressDetailTextController.dispose();
    noteTextController.dispose();
    fullNameTextController.dispose();
    phoneNumberTextController.dispose();
  }
}
