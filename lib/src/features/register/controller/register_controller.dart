import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../core/local/key_value_storage_service.dart';
import '../../auth/controller/account_controller.dart';
import '../../auth/data/dto/account_dto.dart';
import '../../auth/data/repository/auth_repository.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final _accountController = GetIt.instance<AccountController>();
  final _keyValueStorageService = KeyValueStorageService();

  final _repository = GetIt.instance<AuthRepository>();

  @observable
  var registerResponse = ObservableFuture<String?>.value(null);

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

  String? validateConfirmPassword(String fill, String passwordNotSame) {
    final value = confirmPasswordController.text;
    if (value.isEmpty) {
      return fill;
    }
    if (passwordController.text != value) {
      return passwordNotSame;
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
  void register(GlobalKey<FormState> key, VoidCallback onSuccess) {
    if ((key.currentState?.validate() ?? false) &&
        registerResponse.status != FutureStatus.pending) {
      final accountDto =
          AccountDto(usernameController.text, passwordController.text);
      final future = _repository
          .register(accountDto)
          .then((value) => _repository.login(accountDto));
      registerResponse = ObservableFuture(future).then((value) async {
        await _keyValueStorageService.setAuthToken(value);
        _accountController.onAccountUpdate(accountDto);

        onSuccess();
      }).catchError((e) {
        registerResponse = ObservableFuture.error(e);
        log(e.toString());
      });
    }
  }

  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}
