import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../use_case/theme_use_case.dart';

part 'theme_controller.g.dart';

class ThemeController extends _ThemeControllerBase with _$ThemeController {
  ThemeController(super.themeUseCase);
}

abstract class _ThemeControllerBase with Store {
  final ThemeUseCaseImpl _themeUseCase;

  _ThemeControllerBase(this._themeUseCase);

  @readonly
  ThemeMode? _themeMode;

  /// Getting [ThemeMode] from string, parsed from [ThemeUseCase]
  ///
  /// Be careful, this method throws [ArgumentError] if nothing was found.
  @action
  Future<void> getThemeMode() async {
    // Getting String themeMode from useCase
    final themeModeString = await _themeUseCase.getThemeMode();
    // Updates current ThemeMode
    _themeMode = ThemeMode.values.byName(themeModeString);
  }

  /// Inverts ThemeMode depending on [Brightness]
  @action
  Future<void> switchThemeMode(Brightness currentBrightness) async {
    // Updating _themeMode with inverted value
    _themeMode = _getInvertedThemeMode(currentBrightness);
    // Updating value in local storage
    _themeUseCase.updateThemeMode(_themeMode!.name);
  }

  /// Gets inverted ThemeMode depending on [Brightness]
  ///
  /// If brightness is [Brightness.dark] then it returns [ThemeMode.light]
  ThemeMode _getInvertedThemeMode(Brightness currentBrightness) {
    if (currentBrightness == Brightness.light) {
      return ThemeMode.dark;
    }
    return ThemeMode.light;
  }
}
