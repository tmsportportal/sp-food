import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/navigation/app_routes.dart';
import '../../../../widgets/list_product/list_product_widget.dart';

class CollectionProductsContainer extends StatelessWidget {
  const CollectionProductsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ColoredBox(
      color: theme.colorScheme.onPrimary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Хиты продаж',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const Divider(
            height: 1,
            thickness: 0.2,
          ),
          SizedBox(
            height: 410.0,
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 5.0,
              ),
              scrollDirection: Axis.horizontal,
              children: [
                for (int i = 0; i < 10; i++)
                  GestureDetector(
                    onTap: () {
                      context.goNamed(
                        AppRoutes.homeProduct.name,
                        pathParameters: {'productSlug': '$i'},
                      );
                    },
                    child: ListProductWidget(
                      // original: i % 3 == 0,
                      key: Key('$i'),
                    ),
                  ),
              ],
            ),
          ),
          const Divider(
            height: 1,
            thickness: 0.2,
          ),
        ],
      ),
    );
  }
}
