// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_status_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AccountStatusController on _AccountStatusControllerBase, Store {
  late final _$accountLoginStatusAtom = Atom(
      name: '_AccountStatusControllerBase.accountLoginStatus',
      context: context);

  @override
  AccountLoginStatus get accountLoginStatus {
    _$accountLoginStatusAtom.reportRead();
    return super.accountLoginStatus;
  }

  @override
  set accountLoginStatus(AccountLoginStatus value) {
    _$accountLoginStatusAtom.reportWrite(value, super.accountLoginStatus, () {
      super.accountLoginStatus = value;
    });
  }

  late final _$_AccountStatusControllerBaseActionController =
      ActionController(name: '_AccountStatusControllerBase', context: context);

  @override
  void getAccountStatus(ObservableFuture<dynamic> accountResponse) {
    final _$actionInfo = _$_AccountStatusControllerBaseActionController
        .startAction(name: '_AccountStatusControllerBase.getAccountStatus');
    try {
      return super.getAccountStatus(accountResponse);
    } finally {
      _$_AccountStatusControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
accountLoginStatus: ${accountLoginStatus}
    ''';
  }
}
