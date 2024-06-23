import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../widgets/caching_image.dart';
import '../../../../widgets/counter_widget.dart';
import '../../data/dto/cart_product_dto.dart';

class CartProductWidget extends StatelessWidget {
  final CartProductDto? cartProduct;
  final VoidCallback onIncrementTap;
  final VoidCallback onDecrementTap;
  final VoidCallback onDeleteTap;
  const CartProductWidget({
    super.key,
    this.cartProduct,
    required this.onIncrementTap,
    required this.onDecrementTap,
    required this.onDeleteTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  width: 0.6,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100.0,
                      height: 125.0,
                      child: CachingImage(cartProduct?.product?.thumbnail),
                    ),
                    const SizedBox(width: 15.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8.0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cartProduct?.product?.name ?? '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: theme.textTheme.bodyLarge,
                                      textAlign: TextAlign.start,
                                    ),
                                    Text(
                                      cartProduct?.product?.brand?.name ??
                                          'brand',
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                              color: theme.colorScheme.primary),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  onDeleteTap();
                                },
                                iconSize: 17.0,
                                color: Colors.redAccent,
                                icon: const Icon(CupertinoIcons.trash),
                              ),
                            ],
                          ),
                          Text(
                            '${cartProduct?.product?.price} TMT / ${cartProduct?.product?.sku}',
                            style: theme.textTheme.bodySmall?.copyWith(
                              letterSpacing: 0.0,
                              wordSpacing: 0.0,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            child: Observer(
                              builder: (context) {
                                return CounterWidget(
                                  onDecrementTap: onDecrementTap,
                                  onIncrementTap: onIncrementTap,
                                  count: cartProduct?.quantity ?? 1,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 15.0),
          SizedBox(
            width: 90.0,
            child: Observer(builder: (context) {
              return Text(
                '${(cartProduct?.product?.price ?? 1) * (cartProduct?.quantity ?? 1)} TMT',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
