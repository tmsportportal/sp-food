// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LocalizationsController on _LocalizationsControllerBase, Store {
  late final _$_localeAtom =
      Atom(name: '_LocalizationsControllerBase._locale', context: context);

  Locale? get locale {
    _$_localeAtom.reportRead();
    return super._locale;
  }

  @override
  Locale? get _locale => locale;

  @override
  set _locale(Locale? value) {
    _$_localeAtom.reportWrite(value, super._locale, () {
      super._locale = value;
    });
  }

  late final _$fetchLocaleAsyncAction =
      AsyncAction('_LocalizationsControllerBase.fetchLocale', context: context);

  @override
  Future<Locale> fetchLocale() {
    return _$fetchLocaleAsyncAction.run(() => super.fetchLocale());
  }

  late final _$updateLocaleAsyncAction = AsyncAction(
      '_LocalizationsControllerBase.updateLocale',
      context: context);

  @override
  Future<Locale?> updateLocale(Locale locale) {
    return _$updateLocaleAsyncAction.run(() => super.updateLocale(locale));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
