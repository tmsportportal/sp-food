
import 'package:flutter/material.dart';
import 'package:sportportal_food/src/core/l10n/app_localizations_context.dart';

import '../../../../widgets/elevated_button_with_state.dart';

class AddNewAddressBottomSheet extends StatefulWidget {
  final void Function(String text) onSaveTap;
  final bool isLoading;
  final bool isError;

  const AddNewAddressBottomSheet(
      {super.key,
      required this.onSaveTap,
      required this.isLoading,
      required this.isError});

  @override
  State<AddNewAddressBottomSheet> createState() =>
      _AddNewAddressBottomSheetState();
}

class _AddNewAddressBottomSheetState extends State<AddNewAddressBottomSheet> {
  final textController = TextEditingController();

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              height: 4.0,
              width: 120.0,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          TextField(
            controller: textController,
            maxLines: 1,
            decoration: InputDecoration(
              labelText: context.loc.address,
            ),
          ),
          const SizedBox(height: 10.0),
          ElevatedButtonWithState(
            isError: widget.isError,
            isLoading: widget.isLoading,
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
