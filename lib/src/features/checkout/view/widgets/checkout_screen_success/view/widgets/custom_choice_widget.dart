import 'package:flutter/material.dart';

class CustomChoiceWidget<T> extends StatelessWidget {
  final String title;

  final T value;
  final T groupValue;
  final void Function(T?) onChanged;
  const CustomChoiceWidget({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          onChanged(value);
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Radio<T>(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
