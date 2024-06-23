import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportportal_food/src/core/l10n/app_localizations_context.dart';

import '../../../login/view/login_widget.dart';
import '../../../register/view/register_widget.dart';

class ProfileNotLoggedInWidget extends StatelessWidget {
  const ProfileNotLoggedInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const LoginWidget(),
            );
          },
          leading: const Icon(CupertinoIcons.person),
          title: Text(context.loc.login),
        ),
        ListTile(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const RegisterWidget(),
            );
          },
          leading: const Icon(CupertinoIcons.person),
          title: Text(context.loc.register),
        ),
      ],
    );
  }
}
