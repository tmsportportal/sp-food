import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportportal_food/src/core/l10n/app_localizations_context.dart';
import 'package:sportportal_food/src/features/categories/view/categories_screen.dart';

import '../../brands/view/brands_screen.dart';

class SectionsScreen extends StatefulWidget {
  const SectionsScreen({super.key});

  @override
  State<SectionsScreen> createState() => _SectionsScreenState();
}

class _SectionsScreenState extends State<SectionsScreen>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        AppBar(
          title: Text(context.loc.sections),
        ),
        TabBar(
          controller: tabController,
          tabs: [
            Tab(
              icon: const Icon(CupertinoIcons.square_grid_2x2),
              text: context.loc.categories,
            ),
            Tab(
              icon: const Icon(CupertinoIcons.bag),
              text: context.loc.vendors,
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: const [
              CategoriesScreen(),
              BrandsScreen(),
            ],
          ),
        ),
      ],
    );
  }
}
