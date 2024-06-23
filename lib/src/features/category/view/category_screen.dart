import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:sportportal_food/src/core/l10n/app_localizations_context.dart';
import 'package:sportportal_food/src/core/navigation/route_models/category_route_info.dart';
import 'package:sportportal_food/src/features/category/controller/category_controller.dart';
import 'package:sportportal_food/src/utils/consts/app_constants.dart';

import '../../../core/navigation/app_routes.dart';
import '../../../widgets/custom_error_widget.dart';
import '../../../widgets/list_product/list_product_widget.dart';

class CategoryScreen extends StatefulWidget {
  final String? categorySlug;
  const CategoryScreen({super.key, this.categorySlug});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final controller = GetIt.instance<CategoryController>();
  late final String? categorySlug;

  @override
  void initState() {
    categorySlug = widget.categorySlug;
    controller.setupCategorySlug(categorySlug);
    controller.initController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Observer(builder: (context) {
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(controller.mainCategory?.name ?? ''),
              floating: true,
              actions: const [
                // if (controller.categoryResponse.status ==
                //     FutureStatus.fulfilled)
                //   IconButton(
                //     onPressed: () {
                //       showDialog(
                //         context: context,
                //         builder: (_) => AlertDialog(
                //           // title: Text(categoryName ?? ''),
                //           content: Column(
                //             mainAxisSize: MainAxisSize.min,
                //             children: [
                //               const TextField(),
                //               ElevatedButton(
                //                 onPressed: () {},
                //                 child: const Text('submit'),
                //               ),
                //             ],
                //           ),
                //         ),
                //       );
                //     },
                //     icon: const Icon(CupertinoIcons.slider_horizontal_3),
                //   ),
                // IconButton(
                //   onPressed: () {},
                //   icon: const Icon(CupertinoIcons.line_horizontal_3_decrease),
                // ),
              ],
            ),
            if (controller.categoryResponse.status == FutureStatus.pending)
              const SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            else if (controller.categoryResponse.status ==
                FutureStatus.rejected)
              SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: CustomErrorWidget(
                    onPressed: () {},
                  ),
                ),
              )
            else if (controller.categoryResponse.status ==
                FutureStatus.fulfilled) ...[
              if (controller.breadCrumbs.isNotEmpty)
                SliverPadding(
                  padding: const EdgeInsets.all(15.0),
                  sliver: SliverToBoxAdapter(
                    child: Wrap(
                      spacing: 10.0,
                      runSpacing: 10.0,
                      children: [
                        for (int i = 0;
                            i < controller.breadCrumbs.length;
                            i++) ...[
                          SizedBox(
                            height: 28.0,
                            child: Builder(builder: (context) {
                              final el = controller.breadCrumbs[i];
                              return GestureDetector(
                                onTap: () {
                                  controller.removeFromBreadCrumbs(el);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surfaceVariant,
                                        blurRadius: 4,
                                        spreadRadius: 0,
                                        offset: const Offset(0, 1),
                                      ),
                                    ],
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5.0)),
                                    color: Colors.white,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 3.0, horizontal: 7.0),
                                  child: Text('${el?.name}'),
                                ),
                              );
                            }),
                          ),
                          if (i < controller.breadCrumbs.length - 1)
                            const SizedBox(
                              height: 28.0,
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 13.0,
                              ),
                            ),
                        ]
                      ],
                    ),
                  ),
                ),
              if (controller.currentCategory.value?.children?.isNotEmpty ??
                  false)
                SliverPadding(
                  padding: const EdgeInsets.all(15.0),
                  sliver: SliverToBoxAdapter(
                    child: Wrap(
                      spacing: 10.0,
                      runSpacing: 10.0,
                      children: controller.currentCategory.value?.children
                              ?.map(
                                (el) => FilterChip(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                  onSelected: (value) {
                                    controller.addToBreadCrumbs(el);
                                  },
                                  label: Text(el.name ?? ''),
                                  selected: controller.breadCrumbs.contains(el),
                                ),
                              )
                              .toList() ??
                          [],
                    ),
                  ),
                ),
              Observer(builder: (context) {
                if (controller.productsResponse.status ==
                    FutureStatus.pending) {
                  return const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (controller.productsResponse.status ==
                    FutureStatus.rejected) {
                  return SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: CustomErrorWidget(onPressed: () {
                        controller.fetchCategory();
                      }),
                    ),
                  );
                }
                if (controller.productsResponse.value?.isEmpty ?? true) {
                  return SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Text(context.loc.categoryIsEmpty),
                    ),
                  );
                }
                return SliverPadding(
                  padding: const EdgeInsets.all(10.0),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final product = controller.productsResponse.value?[index];
                      return GestureDetector(
                        onTap: () {
                          final location = GoRouter.of(context)
                              .routeInformationProvider
                              .value
                              .uri;
                          String routeLocation = 'categories';

                          if (location.path.contains('sections')) {
                            routeLocation = AppRoutes.categoryProduct.name;
                          } else if (location.path.contains('home')) {
                            routeLocation = AppRoutes.homeCategoryProduct.name;
                          }
                          final routeInfo = CategoryRouteInfo(
                            categorySlug: '$categorySlug',
                          );
                          final pathParameters = {
                            'productSlug': '${product?.slug}'
                          };
                          pathParameters.addAll(routeInfo.toMap());
                          context.goNamed(routeLocation,
                              pathParameters: pathParameters);
                        },
                        child: ListProductWidget(productListDto: product),
                      );
                    }, childCount: controller.productsResponse.value?.length),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 280.0,
                      mainAxisExtent: AppConstants.gridProductExtend,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                    ),
                  ),
                );
              }),
            ],
          ],
        );
      }),
    );
  }
}
