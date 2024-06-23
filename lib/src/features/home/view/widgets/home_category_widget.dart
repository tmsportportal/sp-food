import 'package:flutter/material.dart';

import '../../../../widgets/caching_image.dart';

class HomeCategoryWidget extends StatelessWidget {
  const HomeCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      fit: StackFit.expand,
      children: [
        const CachingImage(
          'https://assets-global.website-files.com/5ca5fe687e34be0992df1fbe/6235ea7fbaf601e8d3980228_boy-kicking-ball-on-football-field-2021-09-24-03-47-56-utc-min-min.jpg',
          fit: BoxFit.cover,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            // width: MediaQuery.of(context).size.width,
            padding:
                const EdgeInsets.symmetric(vertical: 13.0, horizontal: 13.0),
            margin: const EdgeInsets.all(10.0),
            // color: theme.colorScheme.background.withOpacity(0.9),
            color: theme.colorScheme.background,
            // alignment: Alignment.bottomCenter,
            child: Text(
              'Футбол',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
