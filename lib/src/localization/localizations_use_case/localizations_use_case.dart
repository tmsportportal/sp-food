import 'dart:ui';

import '../app_localizations_gateway_hive/app_localizations_gateway_hive.dart';

class LocalizationsUseCaseImpl {
  const LocalizationsUseCaseImpl(this.localizationsGateway);

  final AppLocalizationsGatewayHive localizationsGateway;

  Future<Locale> getLocale() async {
    String? savedLangCode = await localizationsGateway.getLocale();
    return savedLangCode == null ? const Locale('tk') : Locale(savedLangCode);
  }

  Future<Locale?> updateLocale(Locale newLocale) async {
    String? savedLangCode = await localizationsGateway.getLocale();
    if (savedLangCode != newLocale.languageCode) {
      localizationsGateway.updateLocale(newLocale.languageCode);
      return newLocale;
    }
    return null;
  }
}
