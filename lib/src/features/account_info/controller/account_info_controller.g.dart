// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_info_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AccountInfoController on _AccountInfoControllerBase, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_AccountInfoControllerBase.isLoading'))
          .value;
  Computed<bool>? _$isErrorComputed;

  @override
  bool get isError => (_$isErrorComputed ??= Computed<bool>(() => super.isError,
          name: '_AccountInfoControllerBase.isError'))
      .value;

  late final _$accountInfoAtom =
      Atom(name: '_AccountInfoControllerBase.accountInfo', context: context);

  @override
  AccountInfo? get accountInfo {
    _$accountInfoAtom.reportRead();
    return super.accountInfo;
  }

  @override
  set accountInfo(AccountInfo? value) {
    _$accountInfoAtom.reportWrite(value, super.accountInfo, () {
      super.accountInfo = value;
    });
  }

  late final _$accountInfoResponseAtom = Atom(
      name: '_AccountInfoControllerBase.accountInfoResponse', context: context);

  @override
  ObservableFuture<AccountInfo?> get accountInfoResponse {
    _$accountInfoResponseAtom.reportRead();
    return super.accountInfoResponse;
  }

  @override
  set accountInfoResponse(ObservableFuture<AccountInfo?> value) {
    _$accountInfoResponseAtom.reportWrite(value, super.accountInfoResponse, () {
      super.accountInfoResponse = value;
    });
  }

  late final _$_AccountInfoControllerBaseActionController =
      ActionController(name: '_AccountInfoControllerBase', context: context);

  @override
  void initAccountInfo() {
    final _$actionInfo = _$_AccountInfoControllerBaseActionController
        .startAction(name: '_AccountInfoControllerBase.initAccountInfo');
    try {
      return super.initAccountInfo();
    } finally {
      _$_AccountInfoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addReactionForAccount() {
    final _$actionInfo = _$_AccountInfoControllerBaseActionController
        .startAction(name: '_AccountInfoControllerBase.addReactionForAccount');
    try {
      return super.addReactionForAccount();
    } finally {
      _$_AccountInfoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetchAccountInfo() {
    final _$actionInfo = _$_AccountInfoControllerBaseActionController
        .startAction(name: '_AccountInfoControllerBase.fetchAccountInfo');
    try {
      return super.fetchAccountInfo();
    } finally {
      _$_AccountInfoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateAccountInfo(
      bool validate,
      String firstName,
      String lastName,
      String phoneNumber,
      String email,
      VoidCallback successCallback,
      void Function(dynamic) errorCallback) {
    final _$actionInfo = _$_AccountInfoControllerBaseActionController
        .startAction(name: '_AccountInfoControllerBase.updateAccountInfo');
    try {
      return super.updateAccountInfo(validate, firstName, lastName, phoneNumber,
          email, successCallback, errorCallback);
    } finally {
      _$_AccountInfoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void logout() {
    final _$actionInfo = _$_AccountInfoControllerBaseActionController
        .startAction(name: '_AccountInfoControllerBase.logout');
    try {
      return super.logout();
    } finally {
      _$_AccountInfoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
accountInfo: ${accountInfo},
accountInfoResponse: ${accountInfoResponse},
isLoading: ${isLoading},
isError: ${isError}
    ''';
  }
}
