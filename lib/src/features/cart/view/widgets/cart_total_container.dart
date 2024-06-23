import 'package:flutter/material.dart';
import 'package:sportportal_food/src/core/l10n/app_localizations_context.dart';
import 'package:sportportal_food/src/utils/consts/app_constants.dart';

class CartTotalContainer extends StatelessWidget {
  final String total;
  final VoidCallback onCheckoutTap;
  const CartTotalContainer(
      {super.key, required this.total, required this.onCheckoutTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(2.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                context.loc.total,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final dotsCount =
                          '.' * (constraints.maxWidth.floor() ~/ 7);
                      return Text(
                        dotsCount,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              letterSpacing: 5,
                              color: const Color.fromARGB(255, 197, 196, 196),
                            ),
                      );
                    },
                  ),
                ),
              ),
              Text(
                '$total TMT',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            height: AppConstants.elevatedButtonHeight,
            child: ElevatedButton(
              onPressed: onCheckoutTap,
              child: Text(context.loc.checkout),
            ),
          ),
        ],
      ),
    );
  }
}
