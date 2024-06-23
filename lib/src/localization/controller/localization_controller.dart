// ignore_for_file: library_private_types_in_public_api

import 'dart:ui';

import 'package:mobx/mobx.dart';

import '../localizations_use_case/localizations_use_case.dart';

part 'localization_controller.g.dart';

class LocalizationsController extends _LocalizationsControllerBase
    with _$LocalizationsController {
  LocalizationsController(super.localizationsUseCase);
}

abstract class _LocalizationsControllerBase with Store {
  final LocalizationsUseCaseImpl _localizationsUseCase;

  _LocalizationsControllerBase(this._localizationsUseCase);

  @readonly
  Locale? _locale;

  @action
  Future<Locale> fetchLocale() async {
    _locale = await _localizationsUseCase.getLocale();
    return _locale!;
  }

  String? getLocaleName() {
    return _locale?.languageCode == 'tk' ? 'Tm' : 'Ru';
  }

  /// Returns locale if locale was changed, see [LocalizationsUseCase] updateLocale() method,
  /// returns null if locale wasn't changed
  @action
  Future<Locale?> updateLocale(Locale locale) async {
    final Locale? updatedLocale =
        await _localizationsUseCase.updateLocale(locale);
    if (updatedLocale != null) {
      _locale = updatedLocale;
    }
    return updatedLocale;
  }
}
