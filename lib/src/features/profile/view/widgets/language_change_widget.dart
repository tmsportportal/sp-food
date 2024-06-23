
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sportportal_food/src/core/l10n/app_localizations_context.dart';

import '../../../../core/l10n/l10n.dart';
import '../../../../localization/controller/localization_controller.dart';

class LanguageChangeWidget extends StatefulWidget {
  const LanguageChangeWidget({super.key});

  @override
  State<LanguageChangeWidget> createState() => _LanguageChangeWidgetState();
}

class _LanguageChangeWidgetState extends State<LanguageChangeWidget> {
  final _localizationsController = GetIt.instance<LocalizationsController>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              height: 5.0,
              constraints: const BoxConstraints(maxWidth: 80.0),
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary,
                borderRadius: const BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
            ),
          ),
          Observer(
            builder: (context) => ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15.0)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (var locale in L10n.supportedLocales)
                    RadioListTile.adaptive(
                      value: locale,
                      onChanged: (value) {
                        _localizationsController
                            .updateLocale(value ?? const Locale('ru'));
                        Navigator.pop(context);
                      },
                      groupValue: _localizationsController.locale,
                      title: Text(context.loc.locale(locale.languageCode)),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
