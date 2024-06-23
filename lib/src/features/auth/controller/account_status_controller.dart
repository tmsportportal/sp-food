import 'package:mobx/mobx.dart';

import '../../../core/network/custom_exception.dart';

part 'account_status_controller.g.dart';

enum AccountLoginStatus { error, loggedIn, notLoggedIn, loading, empty }

class AccountStatusController = _AccountStatusControllerBase
    with _$AccountStatusController;

abstract class _AccountStatusControllerBase with Store {
  @observable
  AccountLoginStatus accountLoginStatus = AccountLoginStatus.loading;

  @action
  void getAccountStatus(ObservableFuture accountResponse) {
    final status = accountResponse.status;
    AccountLoginStatus updateLoginStatus;
    switch (status) {
      case FutureStatus.fulfilled:
        updateLoginStatus = AccountLoginStatus.loggedIn;
        break;
      case FutureStatus.pending:
        updateLoginStatus = AccountLoginStatus.loading;
        break;
      case FutureStatus.rejected:
        if (accountResponse.error == ExceptionType.UnauthorizedException) {
          updateLoginStatus = AccountLoginStatus.notLoggedIn;
        } else {
          updateLoginStatus = AccountLoginStatus.error;
        }
        break;
      default:
        updateLoginStatus = AccountLoginStatus.empty;
        break;
    }
    if (accountLoginStatus != updateLoginStatus) {
      accountLoginStatus = updateLoginStatus;
    }

    // debugPrint(accountLoginStatus.toString());
  }
}
