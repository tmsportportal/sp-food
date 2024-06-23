import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportportal_food/src/core/l10n/app_localizations_context.dart';
import 'package:sportportal_food/src/utils/consts/app_constants.dart';

import 'elevated_button_with_state.dart';

class AddToCartWidget extends StatelessWidget {
  final bool isCart;
  final VoidCallback onAddToCartTap;
  final VoidCallback onIncrementTap;
  final VoidCallback onDecrementTap;
  final int count;
  final bool isLoading;
  final bool isError;

  const AddToCartWidget(
      {super.key,
      required this.isCart,
      required this.onAddToCartTap,
      required this.onIncrementTap,
      required this.onDecrementTap,
      this.count = 1,
      required this.isLoading,
      required this.isError});

  @override
  Widget build(BuildContext context) {
    if (!isCart) {
      return SizedBox(
        height: AppConstants.elevatedButtonHeight,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButtonWithState(
          onPressed: onAddToCartTap,
          isError: isError,
          isLoading: isLoading,
          child: Row(
            children: [
              const Icon(CupertinoIcons.shopping_cart),
              const SizedBox(width: 10.0),
              Flexible(child: Text(context.loc.addToCart)),
            ],
          ),
        ),
      );
    }
    return SizedBox(
      height: AppConstants.elevatedButtonHeight,
      child: CounterWidget(
        onIncrementTap: onIncrementTap,
        onDecrementTap: onDecrementTap,
        count: count,
      ),
    );
  }
}

class CounterWidget extends StatelessWidget {
  final VoidCallback onIncrementTap;
  final VoidCallback onDecrementTap;
  final int count;
  const CounterWidget(
      {super.key,
      required this.onIncrementTap,
      required this.onDecrementTap,
      this.count = 1});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppConstants.elevatedButtonHeight,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          IconButton.filledTonal(
            onPressed: onDecrementTap,
            icon: const Icon(CupertinoIcons.minus),
            iconSize: 12.0,
          ),
          Expanded(
            child: Text(
              '$count',
              textAlign: TextAlign.center,
            ),
          ),
          IconButton.filledTonal(
            onPressed: onIncrementTap,
            icon: const Icon(CupertinoIcons.plus),
            iconSize: 12.0,
          ),
        ],
      ),
    );
  }
}
