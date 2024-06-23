import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sportportal_food/src/features/product/data/dto/product_list_dto.dart';

import '../../features/cart/controller/cart_controller.dart';
import '../../utils/show_snack_helper.dart';
import '../caching_image.dart';
import '../counter_widget.dart';
import '../like_button.dart';

class ListProductWidget extends StatefulWidget {
  final ProductListDto? productListDto;
  const ListProductWidget({super.key, this.productListDto});

  @override
  State<ListProductWidget> createState() => _ListProductWidgetState();
}

class _ListProductWidgetState extends State<ListProductWidget> {
  final cartController = GetIt.instance<CartController>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 230.0,
      color: theme.colorScheme.onPrimary,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 160.0,
              child: Stack(
                children: [
                  CachingImage(widget.productListDto?.thumbnail),
                  Positioned(
                    top: 0.0,
                    right: 0.0,
                    child: LikeButton(
                      product: widget.productListDto ?? const ProductListDto(),
                    ),
                  ),
                ],
              ),
            ),
            RatingBar.builder(
              itemSize: 15.0,
              ignoreGestures: true,
              initialRating:
                  double.tryParse(widget.productListDto?.rating ?? '0.0') ??
                      0.0,
              itemBuilder: (BuildContext context, int index) {
                return const Icon(
                  Icons.star,
                  color: Colors.amber,
                );
              },
              onRatingUpdate: (double value) {},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7.0),
              child: Text(
                widget.productListDto?.name ?? '',
                style: theme.textTheme.titleMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              'upc: ${widget.productListDto?.upc}',
              style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: 11.0, color: theme.colorScheme.secondary),
            ),
            // NewOriginalWidget(
            //   isOriginal: widget.productListDto?.isOriginal ?? false,
            //   isNew: widget.productListDto?.isNew ?? false,
            // ),
            const Spacer(),
            Text(
              '${widget.productListDto?.price} TMT',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 7.0),
            Observer(builder: (context) {
              return Center(
                child: AddToCartWidget(
                  onAddToCartTap: () {
                    if (cartController.syncResponse.status !=
                            FutureStatus.pending &&
                        cartController.cartResponse.status !=
                            FutureStatus.pending) {
                      cartController.addToCart(
                          widget.productListDto?.id, widget.productListDto,
                          onSuccess: () {
                        ShowSnackHelper.showSnack(context, SnackStatus.success,
                            'Successfully added to the cart!');
                      }, onError: () {
                        ShowSnackHelper.showSnack(context, SnackStatus.error,
                            'Error added to the cart!');
                      });
                    }
                  },
                  onDecrementTap: () {
                    cartController
                        .decrementProductQuantity(widget.productListDto?.id);
                  },
                  onIncrementTap: () {
                    cartController
                        .incrementProductQuantity(widget.productListDto?.id);
                  },
                  isError: cartController.syncResponse.status ==
                      FutureStatus.rejected,
                  isLoading: cartController.syncResponse.status ==
                      FutureStatus.pending,
                  isCart: cartController.cartProducts
                      .containsKey(widget.productListDto?.id),
                  count: cartController
                          .cartProducts[widget.productListDto?.id]?.quantity ??
                      1,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
