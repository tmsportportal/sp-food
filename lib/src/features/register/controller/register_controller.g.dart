// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterController on _RegisterControllerBase, Store {
  late final _$registerResponseAtom =
      Atom(name: '_RegisterControllerBase.registerResponse', context: context);

  @override
  ObservableFuture<String?> get registerResponse {
    _$registerResponseAtom.reportRead();
    return super.registerResponse;
  }

  @override
  set registerResponse(ObservableFuture<String?> value) {
    _$registerResponseAtom.reportWrite(value, super.registerResponse, () {
      super.registerResponse = value;
    });
  }

  late final _$obscuredAtom =
      Atom(name: '_RegisterControllerBase.obscured', context: context);

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

  late final _$_RegisterControllerBaseActionController =
      ActionController(name: '_RegisterControllerBase', context: context);

  @override
  void onEyeTapped() {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.onEyeTapped');
    try {
      return super.onEyeTapped();
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void register(GlobalKey<FormState> key, VoidCallback onSuccess) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.register');
    try {
      return super.register(key, onSuccess);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
registerResponse: ${registerResponse},
obscured: ${obscured}
    ''';
  }
}
