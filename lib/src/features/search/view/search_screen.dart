import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sportportal_food/src/core/l10n/app_localizations_context.dart';
import 'package:sportportal_food/src/features/search/controller/search_controller.dart';

import '../../../widgets/caching_image.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final controller = GetIt.instance<SearchStoreController>();

  final searchTextController = SearchController();

  final key = GlobalKey();

  @override
  void initState() {
    searchTextController.addListener(() {
      controller.getSearchProducts(searchTextController.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SearchAnchor(
        searchController: searchTextController,
        isFullScreen: true,
        builder: (context, controller) {
          return SearchBar(
            controller: controller,
            padding: const MaterialStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16.0),
            ),
            onTap: () {
              controller.openView();
            },
          );
        },
        suggestionsBuilder: (context, suggestionscontroller) {
          return [
            Observer(builder: (context) {
              if (controller.productsResponse.status == FutureStatus.pending) {
                return const CircularProgressIndicator();
              }
              if (controller.productsResponse.status == FutureStatus.rejected) {
                return Text(context.loc.error.toUpperCase());
              }
              return Column(
                  key: key,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (final element in controller.searchProducts.take(4))
                      ListTile(
                        onTap: () {
                          // controller.closeView('');
                          // context.go('/${element.id}');
                        },
                        shape: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: theme.colorScheme.secondaryContainer,
                        )),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 10.0,
                        ),
                        title: Text(
                          element.name ?? '',
                          style: theme.textTheme.bodySmall,
                        ),
                        subtitle: Text(
                          '${element.price?.toStringAsFixed(2)} TMT',
                          style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 13.0),
                        ),
                        leading: SizedBox(
                          height: 50.0,
                          width: 50.0,
                          child: CachingImage(element.thumbnail),
                        ),
                      ),
                    // if (controller.searchProducts.isNotEmpty)
                    //   TextButton(
                    //     onPressed: () {
                    //       // controller.closeView('');
                    //       // // TODO: implement on see all tap
                    //       // context.go('/search');
                    //     },
                    //     child: Text(
                    //       '${context.loc.seeAll} (${controller.searchProducts.length})',
                    //     ),
                    //   )
                  ]);
            }),
          ];
        });
  }
}
