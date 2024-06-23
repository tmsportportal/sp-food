import 'package:flutter/material.dart';
import 'package:sportportal_food/src/widgets/like_button.dart';

import '../../../../widgets/caching_image.dart';
import '../../../product/data/dto/product_list_dto.dart';

class FavoriteProductWidget extends StatelessWidget {
  final ProductListDto? productListDto;

  const FavoriteProductWidget({super.key, this.productListDto});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100.0,
            height: 100.0,
            child: CachingImage(
              productListDto?.thumbnail,
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productListDto?.name ?? '',
                  style: theme.textTheme.bodyLarge,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  productListDto?.brand?.name ?? 'brand',
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(color: theme.colorScheme.primary),
                ),
                Text(
                  '${productListDto?.price} TMT',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          LikeButton(product: productListDto ?? const ProductListDto()),
          // LikeButton(onTap: () {}, isFav: true),
        ],
      ),
    );
  }
}
