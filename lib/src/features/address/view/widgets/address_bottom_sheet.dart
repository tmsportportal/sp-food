import 'package:flutter/material.dart';
import 'package:sportportal_food/src/core/l10n/app_localizations_context.dart';

class ChangeAddressBottomSheet extends StatefulWidget {
  final String address;
  final void Function(String val) onSaveTap;
  const ChangeAddressBottomSheet(
      {super.key, required this.address, required this.onSaveTap});

  @override
  State<ChangeAddressBottomSheet> createState() =>
      _ChangeAddressBottomSheetState();
}

class _ChangeAddressBottomSheetState extends State<ChangeAddressBottomSheet> {
  late final TextEditingController textController;

  @override
  void initState() {
    textController = TextEditingController(text: widget.address);
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 4.0,
            width: 120.0,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 15.0),
          TextField(
            controller: textController,
            maxLines: 3,
            decoration: InputDecoration(
              labelText: context.loc.address,
            ),
          ),
          const SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () {
              widget.onSaveTap(textController.text);
            },
            child: Text(context.loc.save),
          ),
        ],
      ),
    );
  }
}
