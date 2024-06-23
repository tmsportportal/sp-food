import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:sportportal_food/src/core/navigation/route_models/brand_route_info.dart';
import 'package:sportportal_food/src/features/brands/controller/brands_controller.dart';

import '../../../core/navigation/app_routes.dart';
import '../../../widgets/custom_error_widget.dart';
import 'widgets/brand_list_widget.dart';

class BrandsScreen extends StatefulWidget {
  const BrandsScreen({super.key});

  @override
  State<BrandsScreen> createState() => _BrandsScreenState();
}

class _BrandsScreenState extends State<BrandsScreen>
    with AutomaticKeepAliveClientMixin {
  final controller = GetIt.instance<BrandsController>();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    controller.fetchBrands();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Observer(builder: (context) {
        if (controller.brandsResponse.status == FutureStatus.pending) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (controller.brandsResponse.status == FutureStatus.rejected) {
          return Center(
            child: CustomErrorWidget(
              onPressed: () {
                controller.fetchBrands();
              },
            ),
          );
        }
        return GridView.builder(
          padding: const EdgeInsets.all(10.0),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 160.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            mainAxisExtent: 130.0,
          ),
          itemCount: controller.brandsResponse.value?.length,
          itemBuilder: (context, index) {
            final brand = controller.brandsResponse.value?[index];
            return GestureDetector(
              onTap: () {
                final routeInfo = BrandRouteInfo(
                  brandSlug: brand?.slug,
                  brandName: brand?.name,
                );
                context.goNamed(
                  AppRoutes.brand.name,
                  pathParameters: routeInfo.toMap(),
                );
              },
              child: BrandListWidget(
                brandDto: brand,
              ),
            );
          },
        );
      }),
    );
  }
}
