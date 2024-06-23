import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportportal_food/src/core/l10n/app_localizations_context.dart';

class CustomErrorWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const CustomErrorWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          CupertinoIcons.xmark_seal,
          color: theme.colorScheme.error,
          size: 80,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            context.loc.error,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        TextButton.icon(
          onPressed: onPressed,
          icon: const Icon(CupertinoIcons.refresh),
          label: Text(context.loc.retry),
        ),
      ],
    );
  }
}
