import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';

part 'dashboard_controller.g.dart';

class DashboardController = _DashboardControllerBase with _$DashboardController;

abstract class _DashboardControllerBase with Store {
  StatefulNavigationShell? _navigationShell;

  void initController(StatefulNavigationShell key) {
    _navigationShell = key;
  }

  @observable
  int currentIndex = 0;

  @observable
  String currentRoute = '/';

  final pageController = PageController(initialPage: 0);

  void _goBranch(int index) {
    _navigationShell?.goBranch(
      index,
      initialLocation: index == _navigationShell?.currentIndex,
    );
  }

  @action
  void updateCurrentIndex(int value) {
    currentIndex = value;
    _goBranch(value);
  }

  @action
  bool popScope() {
    if (currentIndex > 0) {
      currentIndex = 0;
      _goBranch(0);

      return false;
    }
    return true;
  }

  void dispose() {
    pageController.dispose();
  }
}
