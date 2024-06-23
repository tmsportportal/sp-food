import 'package:flutter/material.dart';

import '../../../../../data/dto/category_dto.dart';
import 'choose_all_list_tile.dart';

class SubCategoriesListView extends StatelessWidget {
  final CategoryDto? category;
  final void Function(CategoryDto? categoryTreeDto) callback;
  const SubCategoriesListView(
      {super.key, this.category, required this.callback});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (category?.children?.isEmpty ?? true) {
      return ListTile(
        title: Text(
          category?.name?.toUpperCase() ?? '',
          style: theme.textTheme.titleMedium,
        ),
        dense: true,
        onTap: () {
          callback(category);
        },
        visualDensity: const VisualDensity(vertical: -3),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
      );
    }
    return ListTileTheme(
      data: const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 0.0,
        ),
        minVerticalPadding: 0.0,
        visualDensity: VisualDensity(vertical: -3),
      ),
      child: ExpansionTile(
        childrenPadding: const EdgeInsets.symmetric(horizontal: 15.0),
        title: Text(category?.name?.toUpperCase() ?? ''),
        shape: const Border(),
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
    );
  }
}
