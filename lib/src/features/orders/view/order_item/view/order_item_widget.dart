import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportportal_food/src/core/l10n/app_localizations_context.dart';
import 'package:sportportal_food/src/features/orders/data/dto/order_dto.dart';
import 'package:sportportal_food/src/utils/date_time_parser.dart';

import 'widgets/order_status_widget.dart';
import 'widgets/section_name_with_dots_widget.dart';

class OrderItemWidget extends StatelessWidget {
  final OrderDto? orderDto;
  const OrderItemWidget({super.key, required this.orderDto});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 160.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              OrderStatusWidget(
                orderStatus: orderDto?.status,
              ),
              const SizedBox(width: 15.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                              '${context.loc.orderId} - #${orderDto?.id} - ${context.loc.count(orderDto?.basket?.items?.length ?? 0)}'),
                        ),
                        const Icon(Icons.arrow_forward_ios_rounded, size: 14.0),
                      ],
                    ),
                    Text(
                        '${context.loc.orderCreated} - ${DateTimeParser.parseDate(orderDto?.basket?.createdAt ?? DateTime.now(), '.')}'),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 15.0),
          SectionNameWithDotsWidget(
            title:
                '${context.loc.price} (${context.loc.count(orderDto?.basket?.items?.length ?? 0)})',
            content: '${orderDto?.basket?.totalPrice} TMT',
          ),
          const SizedBox(height: 5.0),
          SectionNameWithDotsWidget(
            title: context.loc.orderStatusTitle,
            content: context.loc.orderStatus(orderDto?.status?.name ?? ''),
          ),
        ],
      ),
    );
  }
}
