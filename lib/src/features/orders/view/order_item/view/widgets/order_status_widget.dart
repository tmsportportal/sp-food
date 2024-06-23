import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportportal_food/src/features/orders/data/dto/order_dto.dart';

class OrderStatusWidget extends StatelessWidget {
  final OrderStatus? orderStatus;
  const OrderStatusWidget({super.key, required this.orderStatus});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 50.0,
      decoration: BoxDecoration(
        border: Border.all(color: _getColor()),
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      child: Center(
        child: Icon(
          _getIcon(),
          color: _getColor(),
        ),
      ),
    );
  }

  Color _getColor() {
    switch (orderStatus) {
      case OrderStatus.canceled:
        return Colors.redAccent;
      case OrderStatus.confirmed:
        return Colors.green;
      case OrderStatus.delivered:
        return Colors.green;
      case OrderStatus.pending:
        return Colors.orangeAccent;

      default:
        return Colors.orangeAccent;
    }
  }

  IconData _getIcon() {
    switch (orderStatus) {
      case OrderStatus.canceled:
        return CupertinoIcons.xmark_circle_fill;
      case OrderStatus.confirmed:
        return CupertinoIcons.check_mark_circled_solid;

      case OrderStatus.delivered:
        return CupertinoIcons.cart_fill;
      case OrderStatus.pending:
        return CupertinoIcons.clock_fill;

      default:
        return CupertinoIcons.clock_fill;
    }
  }
}
