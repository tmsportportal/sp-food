import 'package:flutter/material.dart';

class CustomFlexibleAppBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.background,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxHeight > 100.0) {
            return Column(
              children: [
                const SizedBox(height: 10.0),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 100.0,
                    child: Image.asset('assets/images/sp_logo.png'),
                  ),
                ),
                // SizedBox(height: 10.0),
                Expanded(
                  // flex: 3,
                  child: Center(
                    child: Text(
                      'Welcome to N-FOOD',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
              ],
            );
          }
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SizedBox(
                  width: 70.0,
                  child: Image.asset('assets/images/sp_logo.png'),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    'Welcome to N-FOOD',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  double get maxExtent => 180.0;

  @override
  double get minExtent => 60.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
