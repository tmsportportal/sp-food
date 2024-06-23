// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ThemeController on _ThemeControllerBase, Store {
  late final _$_themeModeAtom =
      Atom(name: '_ThemeControllerBase._themeMode', context: context);

  ThemeMode? get themeMode {
    _$_themeModeAtom.reportRead();
    return super._themeMode;
  }

  @override
  ThemeMode? get _themeMode => themeMode;

  @override
  set _themeMode(ThemeMode? value) {
    _$_themeModeAtom.reportWrite(value, super._themeMode, () {
      super._themeMode = value;
    });
  }

  late final _$getThemeModeAsyncAction =
      AsyncAction('_ThemeControllerBase.getThemeMode', context: context);

  @override
  Future<void> getThemeMode() {
    return _$getThemeModeAsyncAction.run(() => super.getThemeMode());
  }

  late final _$switchThemeModeAsyncAction =
      AsyncAction('_ThemeControllerBase.switchThemeMode', context: context);

  @override
  Future<void> switchThemeMode(Brightness currentBrightness) {
    return _$switchThemeModeAsyncAction
        .run(() => super.switchThemeMode(currentBrightness));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
