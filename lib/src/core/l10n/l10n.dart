import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'tk_cupertino_localization.dart';
import 'tk_material_localization.dart';

class L10n {
  static const List<LocalizationsDelegate> appDelegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    TkMaterialLocalization.delegate,
    TkCupertinoLocalization.delegate
  ];

  // Supported locales list
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ru'),
    // Locale('en'),
    Locale('tk'),
    // Locale('en')
  ];

  static const Map<String, String> supportedLocaleNames = {
    // 'en': 'English',
    'ru': 'Русский',
    'tk': 'Türkmen',
  };
}
