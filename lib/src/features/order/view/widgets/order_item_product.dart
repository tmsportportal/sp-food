import 'package:flutter/material.dart';
import 'package:sportportal_food/src/core/l10n/app_localizations_context.dart';

import '../../../../widgets/caching_image.dart';
import '../../../product/data/dto/product_list_dto.dart';

class OrderItemProduct extends StatelessWidget {
  final ProductListDto? productListDto;
  final int? quantity;
  const OrderItemProduct(
      {super.key, this.productListDto, required this.quantity});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 90.0,
            height: 90.0,
            child: CachingImage(
              productListDto?.thumbnail,
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productListDto?.name ??
                      'Voluptatum phasellus consul eius harum splendide no at.',
                  style: theme.textTheme.bodyLarge,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    productListDto?.brand?.name ?? 'Nike',
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: theme.colorScheme.primary),
                  ),
                ),
                if (productListDto?.discountPercent != null)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${(productListDto?.price ?? 0.0) - (productListDto?.price ?? 0.0) * (productListDto?.discountPercent ?? 0) / 100} TMT',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 5.0),
                      Text(
                        '${productListDto?.price} TMT',
                        style: theme.textTheme.bodySmall?.copyWith(
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  )
                else
                  Text(
                    '${productListDto?.price} TMT',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                Text(context.loc.count(quantity ?? ''))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
