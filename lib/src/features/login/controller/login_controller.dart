import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../core/local/key_value_storage_service.dart';
import '../../auth/controller/account_controller.dart';
import '../../auth/data/dto/account_dto.dart';
import '../../auth/data/repository/auth_repository.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final _repository = GetIt.instance<AuthRepository>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final _keyValueStorageService = KeyValueStorageService();
  final _accountController = GetIt.instance<AccountController>();

  @observable
  var loginResponse = ObservableFuture<void>.value(null);

  String? validateUsername(String fill) {
    final value = usernameController.text;
    if (value.isEmpty) {
      return fill;
    }
    return null;
  }

  String? validatePassword(String fill) {
    final value = passwordController.text;
    if (value.isEmpty) {
      return fill;
    }
    return null;
  }

  @observable
  bool obscured = true;

  @action
  void onEyeTapped() {
    obscured = !obscured;
  }

  @action
  void login(GlobalKey<FormState> key, VoidCallback onSuccess) {
    if ((key.currentState?.validate() ?? false) &&
        loginResponse.status != FutureStatus.pending) {
      final accountDto =
          AccountDto(usernameController.text, passwordController.text);
      final future = _repository.login(accountDto);
      loginResponse = ObservableFuture(future).then((value) async {
        await _keyValueStorageService.setAuthToken(value);
        _accountController.onAccountUpdate(accountDto);
        onSuccess();
      }).catchError((e) {
        loginResponse = ObservableFuture.error(e);
        log(e.toString());
      });
    }
  }

  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
  }
}
