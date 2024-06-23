// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on _LoginControllerBase, Store {
  late final _$loginResponseAtom =
      Atom(name: '_LoginControllerBase.loginResponse', context: context);

  @override
  ObservableFuture<void> get loginResponse {
    _$loginResponseAtom.reportRead();
    return super.loginResponse;
  }

  @override
  set loginResponse(ObservableFuture<void> value) {
    _$loginResponseAtom.reportWrite(value, super.loginResponse, () {
      super.loginResponse = value;
    });
  }

  late final _$obscuredAtom =
      Atom(name: '_LoginControllerBase.obscured', context: context);

  @override
  bool get obscured {
    _$obscuredAtom.reportRead();
    return super.obscured;
  }

  @override
  set obscured(bool value) {
    _$obscuredAtom.reportWrite(value, super.obscured, () {
      super.obscured = value;
    });
  }

  late final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase', context: context);

  @override
  void onEyeTapped() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.onEyeTapped');
    try {
      return super.onEyeTapped();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void login(GlobalKey<FormState> key, VoidCallback onSuccess) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.login');
    try {
      return super.login(key, onSuccess);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loginResponse: ${loginResponse},
obscured: ${obscured}
    ''';
  }
}
