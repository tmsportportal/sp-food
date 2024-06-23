import 'package:hive/hive.dart';

class AppLocalizationsGatewayHive {
  AppLocalizationsGatewayHive(this.localizationsBox);

  static const String _localizationsKey = 'localizationsKey';

  final Box localizationsBox;

  Future<String?> getLocale() async {
    return localizationsBox.get(_localizationsKey);
  }

  Future<void> updateLocale(String newLocale) async {
    localizationsBox.put(_localizationsKey, newLocale);
  }
}
