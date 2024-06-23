import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sportportal_food/src/app.dart';
import 'package:sportportal_food/src/core/di/app_injections.dart';
import 'package:sportportal_food/src/features/address/controller/address_controller.dart';
import 'package:sportportal_food/src/features/cart/controller/cart_controller.dart';
import 'package:sportportal_food/src/features/favorites/controller/favorites_controller.dart';
import 'package:sportportal_food/src/localization/controller/localization_controller.dart';
import 'package:sportportal_food/src/theme/controller/theme_controller.dart';
import 'package:url_strategy/url_strategy.dart';

import 'src/core/local/key_value_storage_base.dart';
import 'src/features/account_info/controller/account_info_controller.dart';
import 'src/features/auth/controller/account_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  if (kIsWeb) {
    setPathUrlStrategy();
  }
  GoogleFonts.config.allowRuntimeFetching = false;
  await Hive.initFlutter();
  await KeyValueStorageBase.init();
  final configBox = await Hive.openBox('config_box');
  AppInjections.registerInjections(configBox);
  await GetIt.instance<ThemeController>().getThemeMode();
  await GetIt.instance<LocalizationsController>().fetchLocale();
  await GetIt.instance<AccountController>().initController().then((value) {
    GetIt.instance<FavoritesController>().initController();
    GetIt.instance<AccountInfoController>().initAccountInfo();
    GetIt.instance<AddressController>().initController();
  });
  await GetIt.instance<CartController>().initController();

  runApp(const MyApp());
}
