import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sportportal_food/src/core/l10n/app_localizations_context.dart';

import '../../../../core/navigation/app_routes.dart';
import 'account_info_widget.dart';

class ProfileLoggedInWidget extends StatelessWidget {
  final VoidCallback onLogoutTap;
  const ProfileLoggedInWidget({super.key, required this.onLogoutTap});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          const AccountInfoWidget(),
          const Divider(
            thickness: 0.5,
            height: 1.0,
          ),
          ListTile(
            onTap: () {
              context.goNamed(AppRoutes.orders.name);
            },
            leading: const Icon(CupertinoIcons.cube_box),
            title: Text(context.loc.orders),
          ),
          ListTile(
            onTap: () {
              context.goNamed(AppRoutes.address.name);
            },
            leading: const Icon(CupertinoIcons.map_pin_ellipse),
            title: Text(context.loc.addresses),
          ),
          const Divider(
            thickness: 0.5,
            height: 1.0,
          ),
          ListTile(
            onTap: () {
              context.goNamed(AppRoutes.about.name);
            },
            leading: const Icon(CupertinoIcons.info),
            title: Text(context.loc.about),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(CupertinoIcons.question_circle),
            title: Text(context.loc.advices),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(CupertinoIcons.cube_box),
            title: Text(context.loc.shipping),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(CupertinoIcons.quote_bubble),
            title: Text(context.loc.contacts),
          ),
          const Divider(
            thickness: 0.5,
            height: 1.0,
          ),
          ListTile(
            onTap: onLogoutTap,
            leading: const Icon(
              CupertinoIcons.power,
              color: Colors.redAccent,
            ),
            title: Text(
              context.loc.logout,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
