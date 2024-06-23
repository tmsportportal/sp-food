import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:sportportal_food/src/features/brand/controller/brand_controller.dart';
import 'package:sportportal_food/src/utils/consts/app_constants.dart';

import '../../../core/navigation/app_routes.dart';
import '../../../core/navigation/route_models/brand_route_info.dart';
import '../../../widgets/list_product/list_product_widget.dart';

class BrandScreen extends StatefulWidget {
  final String? brandSlug;
  final String? brandName;
  const BrandScreen({super.key, this.brandSlug, this.brandName});

  @override
  State<BrandScreen> createState() => _BrandScreenState();
}

class _BrandScreenState extends State<BrandScreen> {
  final controller = GetIt.instance<BrandController>();
  late final String? brandSlug;
  late final String? brandName;

  @override
  void initState() {
    brandSlug = widget.brandSlug;
    brandName = widget.brandName;
    controller.fetchProducts(brandSlug);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(brandName ?? ''),
            floating: true,
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text(brandName ?? ''),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const TextField(),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('submit'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                icon: const Icon(CupertinoIcons.slider_horizontal_3),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.line_horizontal_3_decrease),
              ),
            ],
          ),
          Observer(builder: (context) {
            if (controller.productsResponse.status == FutureStatus.pending) {
              return const SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (controller.productsResponse.status == FutureStatus.rejected) {
              return const SliverToBoxAdapter(
                child: Center(
                  child: Text('ERROR'),
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
                      final routeInfo = BrandRouteInfo(
                        brandSlug: '$brandSlug',
                        brandName: '$brandName',
                      );
                      final pathParameters = {
                        'productSlug': '${product?.slug}'
                      };
                      pathParameters.addAll(routeInfo.toMap());
                      context.goNamed(AppRoutes.brandProducts.name,
                          pathParameters: pathParameters);
                    },
                    child: ListProductWidget(
                      productListDto: product,
                    ),
                  );
                }, childCount: controller.productsResponse.value?.length),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 285.0,
                  mainAxisExtent: AppConstants.gridProductExtend,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
