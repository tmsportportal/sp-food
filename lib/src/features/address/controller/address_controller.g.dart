// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddressController on _AddressControllerBase, Store {
  late final _$addressesResponseAtom =
      Atom(name: '_AddressControllerBase.addressesResponse', context: context);

  @override
  ObservableFuture<void> get addressesResponse {
    _$addressesResponseAtom.reportRead();
    return super.addressesResponse;
  }

  @override
  set addressesResponse(ObservableFuture<void> value) {
    _$addressesResponseAtom.reportWrite(value, super.addressesResponse, () {
      super.addressesResponse = value;
    });
  }

  late final _$addressListAtom =
      Atom(name: '_AddressControllerBase.addressList', context: context);

  @override
  ObservableList<AddressDto> get addressList {
    _$addressListAtom.reportRead();
    return super.addressList;
  }

  @override
  set addressList(ObservableList<AddressDto> value) {
    _$addressListAtom.reportWrite(value, super.addressList, () {
      super.addressList = value;
    });
  }

  late final _$postAddressResponseAtom = Atom(
      name: '_AddressControllerBase.postAddressResponse', context: context);

  @override
  ObservableFuture<AddressDto?> get postAddressResponse {
    _$postAddressResponseAtom.reportRead();
    return super.postAddressResponse;
  }

  @override
  set postAddressResponse(ObservableFuture<AddressDto?> value) {
    _$postAddressResponseAtom.reportWrite(value, super.postAddressResponse, () {
      super.postAddressResponse = value;
    });
  }

  late final _$deleteAddressResponseAtom = Atom(
      name: '_AddressControllerBase.deleteAddressResponse', context: context);

  @override
  ObservableFuture<void> get deleteAddressResponse {
    _$deleteAddressResponseAtom.reportRead();
    return super.deleteAddressResponse;
  }

  @override
  set deleteAddressResponse(ObservableFuture<void> value) {
    _$deleteAddressResponseAtom.reportWrite(value, super.deleteAddressResponse,
        () {
      super.deleteAddressResponse = value;
    });
  }

  late final _$currentAddressAtom =
      Atom(name: '_AddressControllerBase.currentAddress', context: context);

  @override
  String? get currentAddress {
    _$currentAddressAtom.reportRead();
    return super.currentAddress;
  }

  @override
  set currentAddress(String? value) {
    _$currentAddressAtom.reportWrite(value, super.currentAddress, () {
      super.currentAddress = value;
    });
  }

  late final _$_AddressControllerBaseActionController =
      ActionController(name: '_AddressControllerBase', context: context);

  @override
  void fetchAddresses() {
    final _$actionInfo = _$_AddressControllerBaseActionController.startAction(
        name: '_AddressControllerBase.fetchAddresses');
    try {
      return super.fetchAddresses();
    } finally {
      _$_AddressControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void postAddress(
      String address, VoidCallback onSuccess, VoidCallback onError) {
    final _$actionInfo = _$_AddressControllerBaseActionController.startAction(
        name: '_AddressControllerBase.postAddress');
    try {
      return super.postAddress(address, onSuccess, onError);
    } finally {
      _$_AddressControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteAddress(int id, VoidCallback onSuccess, VoidCallback onError) {
    final _$actionInfo = _$_AddressControllerBaseActionController.startAction(
        name: '_AddressControllerBase.deleteAddress');
    try {
      return super.deleteAddress(id, onSuccess, onError);
    } finally {
      _$_AddressControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeAddress(int index, String address) {
    final _$actionInfo = _$_AddressControllerBaseActionController.startAction(
        name: '_AddressControllerBase.changeAddress');
    try {
      return super.changeAddress(index, address);
    } finally {
      _$_AddressControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCurrentAddress(
      String address, VoidCallback onSuccess, VoidCallback onError) {
    final _$actionInfo = _$_AddressControllerBaseActionController.startAction(
        name: '_AddressControllerBase.changeCurrentAddress');
    try {
      return super.changeCurrentAddress(address, onSuccess, onError);
    } finally {
      _$_AddressControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getCurrentMainAddress() {
    final _$actionInfo = _$_AddressControllerBaseActionController.startAction(
        name: '_AddressControllerBase.getCurrentMainAddress');
    try {
      return super.getCurrentMainAddress();
    } finally {
      _$_AddressControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
addressesResponse: ${addressesResponse},
addressList: ${addressList},
postAddressResponse: ${postAddressResponse},
deleteAddressResponse: ${deleteAddressResponse},
currentAddress: ${currentAddress}
    ''';
  }
}
