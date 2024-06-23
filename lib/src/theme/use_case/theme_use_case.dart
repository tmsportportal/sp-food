import '../gateway/theme_gateway_hive.dart';

class ThemeUseCaseImpl {
  final ThemeGatewayHive _themeGateway;

  ThemeUseCaseImpl(this._themeGateway);

  Future<String> getThemeMode() async {
    final String? fetchedTheme = await _themeGateway.getTheme();
    return fetchedTheme ?? 'system';
  }

  Future<void> updateThemeMode(String appThemeMode) async {
    await _themeGateway.updateTheme(appThemeMode);
  }
}