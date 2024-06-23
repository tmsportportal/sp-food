import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sportportal_food/src/core/l10n/app_localizations_context.dart';
import 'package:sportportal_food/src/features/order/controller/order_controller.dart';
import 'package:sportportal_food/src/features/orders/data/dto/order_dto.dart';
import 'package:sportportal_food/src/features/orders/view/order_item/view/widgets/section_name_with_dots_widget.dart';
import 'package:sportportal_food/src/utils/date_time_parser.dart';

import '../../../widgets/custom_error_widget.dart';
import 'widgets/order_item_product.dart';

class OrderScreen extends StatefulWidget {
  final String? orderId;

  const OrderScreen({super.key, this.orderId});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final controller = GetIt.instance<OrderController>();

  @override
  void initState() {
    controller.setupId(int.tryParse(widget.orderId ?? '0') ?? 0);
    controller.fetchOrder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ColoredBox(
      color: theme.scaffoldBackgroundColor,
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(),
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
                child: CustomErrorWidget(onPressed: controller.fetchOrder),
              );
            }
            final order = controller.orderResponse.value;
            return SliverList(
              delegate: SliverChildListDelegate(
                [
                  ContainerWithTitleAndItems(
                    title: context.loc.orderDetails,
                    items: [
                      SectionNameWithDotsWidget(
                        title: context.loc.orderCreated,
                        content: DateTimeParser.parseDate(
                            order?.basket?.createdAt ?? DateTime.now(), '/'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: SectionNameWithDotsWidget(
                          title: context.loc.orderTime,
                          content: DateTimeParser.parseTime(
                              order?.basket?.createdAt ?? DateTime.now(), ':'),
                        ),
                      ),
                      SectionNameWithDotsWidget(
                        title: context.loc.orderId,
                        content: '${order?.id}',
                      ),
                    ],
                  ),
                  ContainerWithTitleAndItems(
                    title: context.loc.orderStatusTitle,
                    items: [
                      SectionNameWithDotsWidget(
                        title: context.loc.orderStatusTitle,
                        content:
                            context.loc.orderStatus(order?.status?.name ?? ''),
                      ),
                    ],
                  ),
                  ContainerWithTitleAndItems(
                    title: context.loc.orderItems,
                    items: [
                      SectionNameWithDotsWidget(
                        title: context.loc.total,
                        content: '${order?.basket?.totalPrice} TMT',
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: SectionNameWithDotsWidget(
                          title: context.loc.itemsCount,
                          content: context.loc
                              .count(order?.basket?.items?.length ?? 0),
                        ),
                      ),
                      for (final item in order?.basket?.items ?? <Item>[])
                        OrderItemProduct(
                          productListDto: item.product,
                          quantity: item.quantity,
                        ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

class ContainerWithTitleAndItems extends StatelessWidget {
  final String title;
  final List<Widget> items;

  const ContainerWithTitleAndItems(
      {super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
            child: Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: const BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
            child: Column(children: items),
          ),
        ],
      ),
    );
  }
}
