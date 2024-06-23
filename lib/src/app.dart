import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sportportal_food/src/localization/controller/localization_controller.dart';
import 'package:sportportal_food/src/theme/controller/theme_controller.dart';

import 'core/l10n/l10n.dart';
import 'core/navigation/app_router_config.dart';
import 'theme/presentation/app_theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _rootKey = GlobalKey<NavigatorState>();
  final _shellKey = GlobalKey<NavigatorState>();

  final themeController = GetIt.instance<ThemeController>();
  final localizationController = GetIt.instance<LocalizationsController>();

  AppRouterConfig? _appRouterConfig;

  @override
  void initState() {
    _appRouterConfig = AppRouterConfig(_rootKey, _shellKey);
    super.initState();
  }

  @override
  void dispose() {
    _rootKey.currentState?.dispose();
    _shellKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return MaterialApp.router(
          title: 'N-FOOD',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          themeMode: themeController.themeMode,
          locale: localizationController.locale,
          localizationsDelegates: L10n.appDelegates,
          supportedLocales: L10n.supportedLocales,
          routerConfig: _appRouterConfig?.router,
        );
      },
    );
  }
}
