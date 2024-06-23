import 'package:flutter/material.dart';
import 'package:sportportal_food/src/core/l10n/app_localizations_context.dart';
import 'package:sportportal_food/src/utils/consts/app_constants.dart';

class ElevatedButtonWithState extends StatelessWidget {
  final bool isLoading;
  final bool isError;
  final Widget child;
  final VoidCallback onPressed;
  final ButtonStyle? style;
  const ElevatedButtonWithState(
      {super.key,
      required this.isLoading,
      required this.isError,
      required this.child,
      required this.onPressed,
      this.style});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppConstants.elevatedButtonHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: style ??
            ElevatedButton.styleFrom(
                backgroundColor:
                    isError ? Theme.of(context).colorScheme.error : null),
        child: _getState(context),
      ),
    );
  }

  Widget _getState(BuildContext context) {
    if (isLoading) {
      return const CircularProgressIndicator.adaptive(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    }
    if (isError) {
      return Text(context.loc.error);
    }
    return child;
  }
}
