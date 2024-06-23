// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DashboardController on _DashboardControllerBase, Store {
  late final _$currentIndexAtom =
      Atom(name: '_DashboardControllerBase.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$currentRouteAtom =
      Atom(name: '_DashboardControllerBase.currentRoute', context: context);

  @override
  String get currentRoute {
    _$currentRouteAtom.reportRead();
    return super.currentRoute;
  }

  @override
  set currentRoute(String value) {
    _$currentRouteAtom.reportWrite(value, super.currentRoute, () {
      super.currentRoute = value;
    });
  }

  late final _$_DashboardControllerBaseActionController =
      ActionController(name: '_DashboardControllerBase', context: context);

  @override
  void updateCurrentIndex(int value) {
    final _$actionInfo = _$_DashboardControllerBaseActionController.startAction(
        name: '_DashboardControllerBase.updateCurrentIndex');
    try {
      return super.updateCurrentIndex(value);
    } finally {
      _$_DashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool popScope() {
    final _$actionInfo = _$_DashboardControllerBaseActionController.startAction(
        name: '_DashboardControllerBase.popScope');
    try {
      return super.popScope();
    } finally {
      _$_DashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex},
currentRoute: ${currentRoute}
    ''';
  }
}
