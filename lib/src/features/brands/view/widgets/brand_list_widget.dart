import 'package:flutter/material.dart';
import 'package:sportportal_food/src/features/brand/data/dto/brand_dto.dart';

import '../../../../widgets/caching_image.dart';

class BrandListWidget extends StatelessWidget {
  final BrandDto? brandDto;
  const BrandListWidget({super.key, this.brandDto});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
        border: Border.all(
          color: theme.colorScheme.primary.withOpacity(0.4),
        ),
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 78.0,
            child: CachingImage(
              brandDto?.logo,
              fit: BoxFit.cover,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              brandDto?.name ?? '',
              style: theme.textTheme.titleSmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
