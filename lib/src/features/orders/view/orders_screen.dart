import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:sportportal_food/src/core/l10n/app_localizations_context.dart';
import 'package:sportportal_food/src/core/navigation/app_routes.dart';
import 'package:sportportal_food/src/features/orders/controller/orders_controller.dart';
import 'package:sportportal_food/src/widgets/custom_error_widget.dart';

import 'order_item/view/order_item_widget.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final controller = GetIt.instance<OrdersController>();

  @override
  void initState() {
    controller.fetchOrders();
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
            title: Text(context.loc.orders),
          ),
          Observer(builder: (context) {
            if (controller.isLoading) {
              return const SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (controller.isError) {
              return SliverFillRemaining(
                hasScrollBody: false,
                child: CustomErrorWidget(onPressed: controller.fetchOrders),
              );
            }
            final orders = controller.ordersResponse.value;
            return SliverPadding(
              padding: const EdgeInsets.all(10.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final order = orders?[index];
                    return GestureDetector(
                      onTap: () {
                        context.goNamed(AppRoutes.order.name, pathParameters: {
                          "orderId": '${order?.id}',
                        });
                      },
                      child: OrderItemWidget(
                        orderDto: order,
                      ),
                    );
                  },
                  childCount: orders?.length,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
