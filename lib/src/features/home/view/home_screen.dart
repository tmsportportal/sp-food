import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sportportal_food/src/core/navigation/app_routes.dart';

import '../../../core/navigation/route_models/category_route_info.dart';
import '../../../widgets/carousel_slider_with_buttons.dart';
import '../../../widgets/custom_search_widget.dart';
import 'widgets/collection_products_container.dart';
import 'widgets/custom_flexible_app_bar.dart';
import 'widgets/home_category_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          delegate: CustomFlexibleAppBar(),
          pinned: true,
        ),
        const SliverToBoxAdapter(
          child: CustomSearchWidget(),
        ),
        const SliverToBoxAdapter(
          child: CarouselSliderWithButtons(
            height: 300.0,
            viewportFraction: 1.0,
            images: [
              'https://promova.com/content/sport_idioms_3a57e5deed.png',
              'https://media-s3-us-east-1.ceros.com/forbes/images/2023/05/16/90ed30b9f48f3536c4a626b76645cffb/16x9-top-athletes-main-lander-illustration-by-angelica-alzona.jpg',
            ],
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          sliver: SliverToBoxAdapter(
            child: Text(
              '⭐ Популярные категории',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(15.0),
          sliver: SliverGrid.extent(
            maxCrossAxisExtent: 300.0,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 15.0,
            children: [
              for (int i = 0; i < 5; i++)
                GestureDetector(
                  onTap: () {
                    final routeInfo = CategoryRouteInfo(
                      categorySlug: '$i',
                    );
                    final pathParameters = routeInfo.toMap();
                    context.goNamed(AppRoutes.homeCategory.name,
                        pathParameters: pathParameters);
                  },
                  child: const HomeCategoryWidget(),
                ),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: CollectionProductsContainer(),
            ),
            childCount: 5,
          ),
        ),
      ],
    );
  }
}

class MobileAppBar extends StatelessWidget {
  const MobileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverAppBar(
      backgroundColor: theme.colorScheme.onPrimaryContainer,
      floating: true,
      toolbarHeight: 70.0,
      leading: IconButton(
        onPressed: () {},
        color: theme.colorScheme.background,
        icon: const Icon(CupertinoIcons.line_horizontal_3_decrease),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          color: theme.colorScheme.background,
          icon: const Icon(Icons.favorite),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: IconButton(
            onPressed: () {},
            color: theme.colorScheme.background,
            iconSize: 30.0,
            icon: const Icon(Icons.shopping_cart_rounded),
          ),
        ),
      ],
    );
  }
}
