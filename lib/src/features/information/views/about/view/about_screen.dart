import 'package:flutter/material.dart';
import 'package:sportportal_food/src/core/l10n/app_localizations_context.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(context.loc.about),
        ),
      ],
    );
  }
}
