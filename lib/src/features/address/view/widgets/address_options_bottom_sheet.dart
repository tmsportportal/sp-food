import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportportal_food/src/core/l10n/app_localizations_context.dart';

import 'address_bottom_sheet.dart';

class AddressOptionsBottomSheet extends StatelessWidget {
  final VoidCallback onDeleteTap;
  final void Function(String) onSaveTap;
  final String address;
  const AddressOptionsBottomSheet(
      {super.key,
      required this.onSaveTap,
      required this.address,
      required this.onDeleteTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 4.0,
          width: 100.0,
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            color: Colors.grey,
          ),
        ),
        ListTile(
          onTap: () {
            onDeleteTap();
          },
          leading: const Icon(
            CupertinoIcons.trash,
            color: Colors.redAccent,
          ),
          title: Text(context.loc.delete),
        ),
        const Divider(
          height: 1.0,
          color: Color.fromARGB(255, 221, 221, 221),
        ),
        ListTile(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => ChangeAddressBottomSheet(
                address: address,
                onSaveTap: onSaveTap,
              ),
            );
          },
          leading: Icon(
            CupertinoIcons.pen,
            color: Theme.of(context).colorScheme.primary,
          ),
          title: Text(context.loc.edit),
        )
      ],
    );
  }
}
