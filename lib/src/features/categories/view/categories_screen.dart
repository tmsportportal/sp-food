import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:sportportal_food/src/features/categories/controller/categories_controller.dart';

import '../../../core/navigation/app_routes.dart';
import '../../../core/navigation/route_models/category_route_info.dart';
import '../../../widgets/custom_error_widget.dart';
import 'widgets/categories_list_view/view/categories_list_view.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with AutomaticKeepAliveClientMixin {
  final controller = GetIt.instance<CategoriesController>();
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    controller.fetchCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Observer(builder: (context) {
        if (controller.categoriesResponse.status == FutureStatus.pending) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (controller.categoriesResponse.status == FutureStatus.rejected) {
          return Center(
            child: CustomErrorWidget(
              onPressed: () {
                controller.fetchCategories();
              },
            ),
          );
        }
        return ListView(
          children: controller.categoriesResponse.value?.map(
                (category) {
                  return Column(
                    children: [
                      CategoriesListView(
                        category: category,
                        callback: (e) {
                          final routeInfo = CategoryRouteInfo(
                            categorySlug: e?.slug,
                          );
                          context.goNamed(
                            AppRoutes.category.name,
                            pathParameters: routeInfo.toMap(),
                          );
                        },
                      ),
                      const Divider(
                        height: 1.0,
                        thickness: 0.5,
                      ),
                    ],
                  );
                },
              ).toList() ??
              [],
        );
      }),
    );
  }
}
