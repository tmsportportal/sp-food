import 'dart:developer';
import 'dart:ui';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sportportal_food/src/core/local/key_value_storage_service.dart';
import 'package:sportportal_food/src/features/auth/controller/account_status_controller.dart';

import '../data/dto/address_dto.dart';
import '../data/repository/address_repository.dart';

part 'address_controller.g.dart';

class AddressController = _AddressControllerBase with _$AddressController;

abstract class _AddressControllerBase with Store {
  final _repository = GetIt.instance<AddressRepository>();
  final _accountStatusController = GetIt.instance<AccountStatusController>();

  final _keyValueStorageService = KeyValueStorageService();

  @observable
  var addressesResponse = ObservableFuture<void>.value(null);

  @observable
  var addressList = ObservableList<AddressDto>.of([]);

  @observable
  var postAddressResponse = ObservableFuture<AddressDto?>.value(null);
  @observable
  var deleteAddressResponse = ObservableFuture<void>.value(null);

  @observable
  String? currentAddress;

  ReactionDisposer? _reactionDisposer;

  void dispose() {
    _reactionDisposer?.reaction.dispose();
  }

  void initController() {
    fetchAddresses();
    addAccountAction();
  }

  void addAccountAction() {
    _reactionDisposer ??=
        reaction((p0) => _accountStatusController.accountLoginStatus, (p0) {
      if (p0 == AccountLoginStatus.loggedIn) {
        fetchAddresses();
      }
    });
  }

  @action
  void fetchAddresses() {
    if (_accountStatusController.accountLoginStatus ==
        AccountLoginStatus.loggedIn) {
      try {
        final future = _repository.getAddresses();
        addressesResponse = ObservableFuture(future).then((value) {
          addressList = ObservableList.of(value);
          getCurrentMainAddress();
        });
      } catch (e) {
        log(e.toString());
        addressesResponse = ObservableFuture.error(e);
      }
    }
  }

  @action
  void postAddress(
      String address, VoidCallback onSuccess, VoidCallback onError) {
    final future = _repository.postAddress(address);
    postAddressResponse = ObservableFuture(future).then((value) {
      addressList.add(value);
      onSuccess();
    }).catchError((e) {
      log(e.toString());
      postAddressResponse = ObservableFuture.error(e);
      onError();
    });
  }

  @action
  void deleteAddress(int id, VoidCallback onSuccess, VoidCallback onError) {
    final future = _repository.deleteAddress('$id');
    deleteAddressResponse = ObservableFuture(future).then((value) {
      final index = addressList.indexWhere((element) => element.id == id);
      if (currentAddress == addressList[index].address) {
        currentAddress = null;
        _keyValueStorageService.deleteAddress();
      }
      addressList.removeAt(index);
      onSuccess();
    }).catchError((e) {
      log(e.toString());
      deleteAddressResponse = ObservableFuture.error(e);
      onError();
    });
  }

  @action
  void changeAddress(int index, String address) {
    if (currentAddress == addressList[index].address) {
      currentAddress = address;
      _keyValueStorageService.setMainAddress(address);
    }
    addressList[index].address = address;
  }

  @action
  void changeCurrentAddress(
      String address, VoidCallback onSuccess, VoidCallback onError) {
    if (currentAddress != address) {
      _keyValueStorageService.setMainAddress(address).then((value) {
        currentAddress = address;
        onSuccess();
      }).catchError((e) {
        onError();
      });
    }
  }

  @action
  void getCurrentMainAddress() {
    _keyValueStorageService.getMainAddress().then((value) {
      currentAddress = value;
    });
  }
}
