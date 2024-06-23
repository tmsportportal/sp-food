import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:sportportal_food/src/core/l10n/app_localizations_context.dart';
import 'package:sportportal_food/src/features/dashboard/controller/dashboard_controller.dart';

class DashboardScreen extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const DashboardScreen({super.key, required this.navigationShell});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final controller = GetIt.instance<DashboardController>();

  @override
  void initState() {
    controller.initController(widget.navigationShell);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: widget.navigationShell),
      bottomNavigationBar: Builder(builder: (context) {
        final textStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            );
        return SalomonBottomBar(
          currentIndex: widget.navigationShell.currentIndex,
          onTap: (value) {
            controller.updateCurrentIndex(value);
          },
          items: [
            SalomonBottomBarItem(
              icon: const Icon(CupertinoIcons.house),
              activeIcon: const Icon(CupertinoIcons.house_fill),
              title: Text(
                context.loc.home,
                style: textStyle,
              ),
            ),
            SalomonBottomBarItem(
              icon: const Icon(CupertinoIcons.square_grid_2x2),
              activeIcon: const Icon(CupertinoIcons.square_grid_2x2_fill),
              title: Text(
                context.loc.sections,
                style: textStyle,
              ),
            ),
            SalomonBottomBarItem(
              icon: const Icon(CupertinoIcons.cart),
              activeIcon: const Icon(CupertinoIcons.cart_fill),
              title: Text(
                context.loc.cart,
                style: textStyle,
              ),
            ),
            SalomonBottomBarItem(
              icon: const Icon(CupertinoIcons.heart),
              activeIcon: const Icon(CupertinoIcons.heart_fill),
              title: Text(
                context.loc.favorites,
                style: textStyle,
              ),
            ),
            SalomonBottomBarItem(
              icon: const Icon(CupertinoIcons.person),
              activeIcon: const Icon(CupertinoIcons.person_fill),
              title: Text(
                context.loc.profile,
                style: textStyle,
              ),
            ),
          ],
        );
      }),
    );
  }
}
