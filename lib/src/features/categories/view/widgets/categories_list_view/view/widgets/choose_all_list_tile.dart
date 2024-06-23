import 'package:flutter/material.dart';
import 'package:sportportal_food/src/core/l10n/app_localizations_context.dart';

class ChooseAllListTile extends StatelessWidget {
  final VoidCallback onTap;
  const ChooseAllListTile({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      title: Text(
        context.loc.chooseAll,
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      dense: true,
      onTap: onTap,
      visualDensity: const VisualDensity(vertical: -2),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
    );
  }
}
