import 'package:flutter/material.dart';

import '../../../../../../widgets/custom_error_widget.dart';

class CheckoutScreenError extends StatelessWidget {
  final VoidCallback onRetryTap;
  const CheckoutScreenError({super.key, required this.onRetryTap});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: CustomErrorWidget(
          onPressed: () {
            onRetryTap();
          },
        ),
      ),
    );
  }
}
