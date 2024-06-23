import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:sportportal_food/src/core/l10n/app_localizations_context.dart';

import '../../../core/navigation/app_routes.dart';
import '../../../utils/show_snack_helper.dart';
import '../../../widgets/custom_error_widget.dart';
import '../controller/cart_controller.dart';
import 'widgets/cart_product_widget.dart';
import 'widgets/cart_total_container.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final controller = GetIt.instance<CartController>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(context.loc.cart),
            floating: true,
          ),
          Observer(
            builder: (context) {
              if (controller.cartResponse.status == FutureStatus.pending) {
                return const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (controller.cartResponse.status == FutureStatus.rejected) {
                return SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: CustomErrorWidget(
                      onPressed: () {
                        controller.fetchCartProducts();
                      },
                    ),
                  ),
                );
              }
              if (controller.cartResponse.status == FutureStatus.fulfilled &&
                  controller.cartProducts.isEmpty) {
                return SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Text(
                      context.loc.cartIsEmpty,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                );
              }
              return SliverList(
                delegate: SliverChildListDelegate(
                  [
                    ...controller.cartProducts.entries.map(
                      (entry) {
                        final cartProduct = entry.value;
                        return InkWell(
                          onTap: () {
                            context.goNamed(
                              AppRoutes.cartProducts.name,
                              pathParameters: {
                                'productSlug': cartProduct?.product?.slug ?? ''
                              },
                            );
                          },
                          child: CartProductWidget(
                            cartProduct: cartProduct,
                            onDecrementTap: () {
                              controller.decrementProductQuantity(
                                  cartProduct?.product?.id);
                            },
                            onIncrementTap: () {
                              controller.incrementProductQuantity(
                                  cartProduct?.product?.id);
                            },
                            onDeleteTap: () {
                              controller.removeProduct(
                                cartProduct?.product?.id,
                                onSuccess: () {
                                  ShowSnackHelper.showSnack(
                                    context,
                                    SnackStatus.message,
                                    'Successfully deleted from the cart!',
                                  );
                                },
                                onError: () {
                                  ShowSnackHelper.showSnack(
                                    context,
                                    SnackStatus.error,
                                    'Error deleting from the cart!',
                                  );
                                },
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          Observer(
            builder: (context) {
              if (controller.cartResponse.status == FutureStatus.fulfilled &&
                  controller.cartProducts.isNotEmpty) {
                return SliverFillRemaining(
                  hasScrollBody: false,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Builder(
                      builder: (context) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CartTotalContainer(
                          total: controller.total.toString(),
                          onCheckoutTap: () {
                            context.goNamed(AppRoutes.checkout.name);
                          },
                        ),
                      ),
                    ),
                  ),
                );
              }
              return const SliverToBoxAdapter(
                child: SizedBox(),
              );
            },
          ),
        ],
      ),
    );
  }
}
