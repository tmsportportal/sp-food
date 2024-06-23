import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(
            height: 80.0,
            child: Image.asset('assets/images/sp_logo.png'),
          ),
          const SizedBox(height: 20.0),
          Text(
            'Welcome to\nSPORTPORTAL FOOD',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
