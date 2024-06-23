import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportportal_food/src/core/l10n/app_localizations_context.dart';

class AddressItemWidget extends StatelessWidget {
  final int index;
  final String address;
  final VoidCallback onOptionsTap;
  final void Function(String?) onChangeMainAddressTap;
  final String currentAddress;
  const AddressItemWidget(
      {super.key,
      required this.index,
      required this.address,
      required this.onOptionsTap,
      required this.onChangeMainAddressTap,
      required this.currentAddress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
          color: Theme.of(context).colorScheme.surface,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${context.loc.address} #${index + 1}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    onOptionsTap();
                  },
                  color: Theme.of(context).colorScheme.error,
                  icon: const Icon(CupertinoIcons.delete_simple),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                address,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
            ),
            const Divider(thickness: 0.2),
            RadioListTile<String>.adaptive(
              dense: true,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 1.0),
              visualDensity: const VisualDensity(vertical: -3),
              value: address,
              splashRadius: 15,
              onChanged: (val) {
                onChangeMainAddressTap(val);
              },
              groupValue: currentAddress,
              title: Text(
                context.loc.useAddressAsMain,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
