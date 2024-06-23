import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:sportportal_food/src/core/l10n/app_localizations_context.dart';

import '../../../../../../../utils/consts/app_constants.dart';
import '../../../../../../../widgets/elevated_button_with_state.dart';

class CheckoutTotalContainer extends StatelessWidget {
  final double total;
  final double delivery;
  final VoidCallback onCheckoutTap;
  final FutureStatus status;
  const CheckoutTotalContainer(
      {super.key,
      required this.total,
      required this.onCheckoutTap,
      required this.delivery,
      required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primaryContainer,
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
                '${total.toStringAsFixed(2)} TMT',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                context.loc.delivery,
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
                '${delivery.toStringAsFixed(2)} TMT',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            height: AppConstants.elevatedButtonHeight,
            child: Observer(builder: (context) {
              return ElevatedButtonWithState(
                onPressed: () {
                  onCheckoutTap();
                },
                isError: status == FutureStatus.rejected,
                isLoading: status == FutureStatus.pending,
                child: Text(context.loc.checkout),
              );
            }),
          ),
        ],
      ),
    );
  }
}
