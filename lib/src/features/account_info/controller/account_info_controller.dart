import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sportportal_food/src/core/local/key_value_storage_service.dart';
import 'package:sportportal_food/src/features/auth/controller/account_status_controller.dart';
import 'package:sportportal_food/src/features/auth/data/repository/auth_repository.dart';

import '../data/account_info.dart';

part 'account_info_controller.g.dart';

class AccountInfoController = _AccountInfoControllerBase
    with _$AccountInfoController;

abstract class _AccountInfoControllerBase with Store {
  final _keyValueStorageService = KeyValueStorageService();
  final _repository = GetIt.instance<AuthRepository>();

  final _accountStatusController = GetIt.instance<AccountStatusController>();

  @observable
  AccountInfo? accountInfo;

  @observable
  var accountInfoResponse = ObservableFuture<AccountInfo?>.value(null);

  @computed
  bool get isLoading => accountInfoResponse.status == FutureStatus.pending;

  @computed
  bool get isError => accountInfoResponse.status == FutureStatus.rejected;

  ReactionDisposer? _reaction;


  /// [fetchAccountInfo]
  @action
  void initAccountInfo() {
    fetchAccountInfo();
    addReactionForAccount();
  }

  @action
  void addReactionForAccount() {
    _reaction =
        reaction((p0) => _accountStatusController.accountLoginStatus, (p0) {
      if (p0 == AccountLoginStatus.loggedIn) {
        fetchAccountInfo();
      }
    });
  }

  @action
  void fetchAccountInfo() {
    if (_accountStatusController.accountLoginStatus ==
        AccountLoginStatus.loggedIn) {
      try {
        final future = _repository.getAccountInfo();
        accountInfoResponse = ObservableFuture(future);
        accountInfoResponse.then((value) {
          accountInfo = value;
        });
      } on Exception catch (e) {
        accountInfoResponse = ObservableFuture.error(e);
        log(e.toString());
      }
    }
  }

  @action
  void updateAccountInfo(
      bool validate,
      String firstName,
      String lastName,
      String phoneNumber,
      String email,
      VoidCallback successCallback,
      void Function(dynamic e) errorCallback) {
    if (validate) {
      accountInfo = AccountInfo(
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        email: email,
      );
      final future = _repository.putAccountInfo(accountInfo);
      accountInfoResponse = ObservableFuture(future);
      accountInfoResponse.then((value) {
        if (value != null) {
          _keyValueStorageService.setAuthUserInfo(value);
          successCallback();
        }
      }).catchError((e) {
        accountInfoResponse = ObservableFuture.error(e);
        log(e.toString());
        errorCallback(e);
      });
    }
  }

  void dispose() {
    _reaction?.reaction.dispose();
  }

  @action
  void logout() {
    accountInfo = null;
  }
}
