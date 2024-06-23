import 'package:flutter/material.dart';
import 'package:sportportal_food/src/core/l10n/app_localizations_context.dart';

import '../../../../../data/dto/checkout_types_dto.dart';
import 'custom_choice_widget.dart';

class DeliveryTypeWidget extends StatelessWidget {
  final List<Delivery> deliveryTypes;
  final Delivery? groupValue;
  final void Function(Delivery?) onChanged;
  final bool hasError;
  final String? errorText;
  const DeliveryTypeWidget(
      {super.key,
      required this.deliveryTypes,
      this.groupValue,
      required this.onChanged,
      required this.hasError,
      this.errorText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.loc.deliveryType,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 15.0),
          Wrap(
            children: [
              for (final element in deliveryTypes)
                CustomChoiceWidget<Delivery?>(
                  title: element.type ?? '',
                  value: element,
                  groupValue: groupValue,
                  onChanged: (type) {
                    onChanged(type);
                  },
                ),
            ],
          ),
          const SizedBox(height: 10.0),
          if (hasError)
            Text(
              errorText ?? '',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Theme.of(context).colorScheme.error),
            )
        ],
      ),
    );
  }
}
