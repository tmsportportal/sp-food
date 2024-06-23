import 'package:flutter/material.dart';

class SectionNameWithDotsWidget extends StatelessWidget {
  final String title;
  final String content;
  const SectionNameWithDotsWidget(
      {super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Text(title),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final dotsCount = '.' * (constraints.maxWidth.floor() ~/ 7);
                return Text(
                  dotsCount,
                  maxLines: 1,
                  style: theme.textTheme.bodySmall?.copyWith(
                    letterSpacing: 5,
                    color: const Color.fromARGB(255, 197, 196, 196),
                  ),
                );
              },
            ),
          ),
        ),
        Text(
          content,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
