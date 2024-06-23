import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sportportal_food/src/features/cart/controller/cart_controller.dart';
import 'package:sportportal_food/src/features/product/controller/product_controller.dart';
import 'package:sportportal_food/src/features/product/data/dto/product_list_dto.dart';
import 'package:sportportal_food/src/utils/show_snack_helper.dart';
import 'package:sportportal_food/src/widgets/custom_error_widget.dart';
import 'package:sportportal_food/src/widgets/like_button.dart';

import '../../../widgets/carousel_slider_with_buttons.dart';
import '../../../widgets/counter_widget.dart';

class ProductScreen extends StatefulWidget {
  final String? productSlug;

  const ProductScreen({super.key, this.productSlug});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final controller = GetIt.instance<ProductController>();
  final cartController = GetIt.instance<CartController>();

  @override
  void initState() {
    controller.fetchProduct(widget.productSlug);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ColoredBox(
      color: theme.scaffoldBackgroundColor,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              LikeButton(
                product: ProductListDto.fromJson(
                  controller.productResponse.value?.toJson() ?? {},
                ),
              ),
              // LikeButton(onTap: () {}, isFav: false),
            ],
          ),
          Observer(builder: (context) {
            if (controller.productResponse.status == FutureStatus.pending) {
              return const SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (controller.productResponse.status == FutureStatus.rejected) {
              return SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: CustomErrorWidget(onPressed: () {}),
                ),
              );
            }
            final product = controller.productResponse.value;
            return SliverList(
              delegate: SliverChildListDelegate([
                CarouselSliderWithIndicators(
                  height: 400.0,
                  viewportFraction: 1.0,
                  images: product?.images,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    product?.name ?? '',
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                //   child: Row(
                //     children: [
                //       // NewOriginalWidget(
                //       //   isNew: product?.isNew ?? false,
                //       //   isOriginal: product?.isOriginal ?? false,
                //       // ),
                //       const Spacer(),
                //       RatingBar.builder(
                //         itemSize: 21.0,
                //         ignoreGestures: true,
                //         initialRating:
                //             double.tryParse(product?.rating ?? '0.0') ?? 0.0,
                //         itemBuilder: (BuildContext context, int index) {
                //           return const Icon(
                //             Icons.star,
                //             color: Colors.amber,
                //           );
                //         },
                //         onRatingUpdate: (double value) {},
                //       ),
                //     ],
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    product?.description ?? '',
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                // const Padding(
                //   padding: EdgeInsets.all(10.0),
                //   child: SizeChooseWidget(),
                // ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Observer(builder: (context) {
                          return AddToCartWidget(
                            isCart: cartController.cartProducts
                                .containsKey(product?.id),
                            onAddToCartTap: () {
                              if (cartController.syncResponse.status !=
                                      FutureStatus.pending &&
                                  cartController.cartResponse.status !=
                                      FutureStatus.pending) {
                                final productListDto = ProductListDto.fromJson(
                                    product?.toJson() ?? {});
                                cartController.addToCart(
                                  product?.id,
                                  productListDto,
                                  onSuccess: () {
                                    ShowSnackHelper.showSnack(
                                        context,
                                        SnackStatus.success,
                                        'Successfully added to cart!');
                                  },
                                  onError: () {
                                    ShowSnackHelper.showSnack(
                                        context,
                                        SnackStatus.error,
                                        'Error adding to cart!');
                                  },
                                );
                              }
                            },
                            isError: cartController.syncResponse.status ==
                                FutureStatus.rejected,
                            isLoading: cartController.syncResponse.status ==
                                FutureStatus.pending,
                            count: cartController
                                    .cartProducts[product?.id]?.quantity ??
                                1,
                            onDecrementTap: () {
                              cartController
                                  .decrementProductQuantity(product?.id);
                            },
                            onIncrementTap: () {
                              cartController
                                  .incrementProductQuantity(product?.id);
                            },
                          );
                        }),
                      ),
                      const SizedBox(width: 25.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${product?.price} TMT',
                            textAlign: TextAlign.center,
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${product?.price} TMT',
                            textAlign: TextAlign.center,
                            style: theme.textTheme.titleSmall?.copyWith(
                                // fontWeight: FontWeight.bold
                                color: Colors.grey,
                                fontSize: 15.0,
                                decoration: TextDecoration.lineThrough,
                                decorationStyle: TextDecorationStyle.solid),
                          ),

                          // if(product?.discountPercent != null)
                        ],
                      ),
                    ],
                  ),
                ),

                /// comment section

                // ExpandableNotifier(
                //   child: ScrollOnExpand(
                //     scrollOnExpand: true,
                //     scrollOnCollapse: false,
                //     child: ExpandablePanel(
                //       theme: const ExpandableThemeData(
                //         headerAlignment: ExpandablePanelHeaderAlignment.center,
                //         tapBodyToCollapse: true,
                //       ),
                //       header: Padding(
                //         padding: const EdgeInsets.all(10),
                //         child: Text(
                //           context.loc.comments,
                //           style: theme.textTheme.titleLarge?.copyWith(
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //       ),
                //       collapsed: CommentWidget(
                //         comment: Comment(
                //           id: 1,
                //           rating: 1,
                //           user: 'Aman Amanow',
                //           comment:
                //               "It's a figure of speech, Morty! They're bureaucrats! I don't respect them. Just keep shooting, Morty! You have no idea what prison is like here!",
                //           date: DateTime.now(),
                //         ),
                //       ),
                //       expanded: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: <Widget>[
                //           for (int i = 1; i < 10; i++)
                //             CommentWidget(
                //               comment: Comment(
                //                 id: i,
                //                 rating: i % 5,
                //                 user: 'Aman Amanow',
                //                 comment:
                //                     "It's a figure of speech, Morty! They're bureaucrats! I don't respect them. Just keep shooting, Morty! You have no idea what prison is like here!",
                //                 date: DateTime.now(),
                //               ),
                //             )
                //         ],
                //       ),
                //       builder: (_, collapsed, expanded) {
                //         return Padding(
                //           padding: const EdgeInsets.only(
                //               left: 10, right: 10, bottom: 10),
                //           child: Expandable(
                //             collapsed: collapsed,
                //             expanded: expanded,
                //             theme: const ExpandableThemeData(crossFadePoint: 0),
                //           ),
                //         );
                //       },
                //     ),
                //   ),
                // ),
              ]),
            );
          }),
        ],
      ),
    );
  }
}

class SizeChooseWidget extends StatefulWidget {
  const SizeChooseWidget({super.key});

  @override
  State<SizeChooseWidget> createState() => _SizeChooseWidgetState();
}

class _SizeChooseWidgetState extends State<SizeChooseWidget> {
  int currentIndex = 39;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        for (int i = 39; i < 45; i++)
          GestureDetector(
            onTap: () {
              if (currentIndex != i) {
                setState(() {
                  currentIndex = i;
                });
              }
            },
            child: AnimatedContainer(
              height: 40.0,
              width: 40.0,
              duration: const Duration(milliseconds: 150),
              decoration: BoxDecoration(
                border: currentIndex == i
                    ? Border.all(
                        color: theme.colorScheme.primary,
                        strokeAlign: BorderSide.strokeAlignOutside,
                      )
                    : null,
              ),
              child: Center(child: Text('$i')),
            ),
          ),
      ],
    );
  }
}
