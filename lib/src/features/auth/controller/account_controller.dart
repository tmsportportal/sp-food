import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../core/local/key_value_storage_service.dart';
import '../../../core/network/custom_exception.dart';
import '../data/dto/account_dto.dart';
import 'account_status_controller.dart';

part 'account_controller.g.dart';

class AccountController = _AccountControllerBase with _$AccountController;

abstract class _AccountControllerBase with Store {
  @readonly
  AccountDto _account = const AccountDto();

  final _keyValueStorageService = KeyValueStorageService();
  final _accountLoginStatusController =
      GetIt.instance<AccountStatusController>();

  // final _authRepository = GetIt.instance<AuthRepository>();

  @readonly
  ObservableFuture<AccountDto> _observableAccount =
      ObservableFuture.value(const AccountDto());

  ReactionDisposer? _disposer;

  @action
  Future<void> onAccountUpdate(AccountDto account) async {
    _observableAccount = ObservableFuture.value(account);
    _account = account;
    await _keyValueStorageService.setAuthUser(account);
    await _keyValueStorageService.setAuthPassword(account.password ?? '');
    _accountLoginStatusController.getAccountStatus(_observableAccount);
  }

  // @action
  // Future<void> getGuestToken() async {
  //   try {
  //     final token = await _authRepository.getGuestToken();
  //     _keyValueStorageService.setAuthToken(token);
  //     _accountLoginStatusController.getAccountStatus(
  //       ObservableFuture.error(ExceptionType.UnauthorizedException),
  //     );
  //   } on Exception catch (e) {
  //     _observableAccount = ObservableFuture.error(Exception(e));
  //     _accountLoginStatusController.getAccountStatus(_observableAccount);
  //   }
  // }

  @action
  Future<void> getAccount() async {
    if ((_keyValueStorageService.getAuthUser()).isEmpty ||
        (await _keyValueStorageService.getAuthToken()).isEmpty) {
      _accountLoginStatusController.getAccountStatus(
          ObservableFuture.error(ExceptionType.UnauthorizedException));
    } else {
      try {
        _observableAccount =
            ObservableFuture.value(_keyValueStorageService.getAuthUser());
        _accountLoginStatusController.getAccountStatus(_observableAccount);
      } on Exception catch (e) {
        log(e.toString());
        _observableAccount = ObservableFuture.error(Exception(e));
        _accountLoginStatusController.getAccountStatus(_observableAccount);
      }
    }
  }

  @action
  void logout() {
    _keyValueStorageService.resetKeys();
    _accountLoginStatusController.getAccountStatus(
      ObservableFuture.error(ExceptionType.UnauthorizedException),
    );
  }

  Future<void> initController() async {
    _disposer ??= reaction((p0) => _observableAccount.value, (p0) {
      _accountLoginStatusController.getAccountStatus(_observableAccount);
    });
    getAccount();
  }
}
