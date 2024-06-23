import 'package:flutter/material.dart';

class CheckoutScreenLoading extends StatelessWidget {
  const CheckoutScreenLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
