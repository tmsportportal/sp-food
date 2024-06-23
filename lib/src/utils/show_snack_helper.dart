import 'package:flutter/material.dart';
import 'package:sportportal_food/src/core/l10n/app_localizations_context.dart';

enum SnackStatus { success, warning, error, message }

class ShowSnackHelper {
  static void showSnack(
      BuildContext context, SnackStatus snackStatus, String content) {
    Color color = Colors.green;
    String title = '';
    final theme = Theme.of(context);
    switch (snackStatus) {
      case SnackStatus.success:
        title = context.loc.success;
        break;
      case SnackStatus.warning:
        color = Colors.orangeAccent;
        title = context.loc.warning;
        break;
      case SnackStatus.error:
        color = theme.colorScheme.error;
        title = context.loc.error;
        break;
      case SnackStatus.message:
        color = theme.colorScheme.primary;
        title = context.loc.message;
        break;
    }

    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.titleMedium
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.w700),
            ),
            Text(content),
          ],
        ),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
