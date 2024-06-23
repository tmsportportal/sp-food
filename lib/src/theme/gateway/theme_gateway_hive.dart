import 'package:hive/hive.dart';

class ThemeGatewayHive {
  static const String _themeKey = 'themeKey';

  ThemeGatewayHive(this._configBox);

  // Hive box, which keeps current config for app
  final Box _configBox;

  Future<String?> getTheme() async {
    return await _configBox.get(_themeKey);
  }

  Future<void> updateTheme(String appThemeMode) async {
    await _configBox.put(_themeKey, appThemeMode);
  }
}
