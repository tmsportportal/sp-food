import 'package:flutter/material.dart';

import '../../../../../../widgets/caching_image.dart';
import '../../../../data/dto/category_dto.dart';
import 'widgets/choose_all_list_tile.dart';
import 'widgets/sub_categories_list_view.dart';

class CategoriesListView extends StatelessWidget {
  final CategoryDto? category;
  final void Function(CategoryDto? categoryTreeDto) callback;

  const CategoriesListView(
      {super.key, required this.category, required this.callback});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (category?.children?.isEmpty ?? true) {
      return ListTile(
        leading: SizedBox(
          width: 40.0,
          child: CachingImage(category?.icon),
        ),
        title: Text(
          category?.name?.toUpperCase() ?? '',
          style: theme.textTheme.titleMedium,
        ),
        dense: true,
        onTap: () {
          callback(category);
        },
        visualDensity: const VisualDensity(vertical: -1),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      );
    }
    return ListTileTheme(
      data: const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 0.0,
        ),
        minVerticalPadding: 0.0,
        visualDensity: VisualDensity(vertical: -1),
      ),
      child: ExpansionTile(
        shape: const Border(),
        leading: SizedBox(
          width: 40.0,
          height: 90.0,
          child: CachingImage(category?.icon),
        ),
        title: Text(category?.name?.toUpperCase() ?? ''),
        // backgroundColor: theme.colorScheme.surface,
        children: [
          ColoredBox(
            color: theme.colorScheme.surface,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  ChooseAllListTile(onTap: () {
                    callback(category);
                  }),
                  for (var e in category?.children ?? <CategoryDto>[])
                    SubCategoriesListView(
                      category: e,
                      callback: (e) {
                        callback(e);
                      },
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
