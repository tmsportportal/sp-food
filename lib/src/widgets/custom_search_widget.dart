import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:sportportal_food/src/core/l10n/app_localizations_context.dart';
import 'package:sportportal_food/src/core/navigation/app_routes.dart';

import '../features/search/controller/search_controller.dart';
import 'caching_image.dart';

class CustomSearchWidget extends StatefulWidget {
  const CustomSearchWidget({super.key});

  @override
  State<CustomSearchWidget> createState() => _CustomSearchWidgetState();
}

class _CustomSearchWidgetState extends State<CustomSearchWidget> {
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

    return Container(
      color: theme.colorScheme.surface,
      padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SearchAnchor(
              searchController: searchTextController,
              isFullScreen: true,
              builder: (context, controller) {
                return SearchBar(
                  controller: controller,
                  leading: const Icon(CupertinoIcons.search),
                  hintText: context.loc.search,
                  trailing: const [Icon(CupertinoIcons.arrow_turn_down_left)],
                  elevation: const MaterialStatePropertyAll<double>(0.0),
                  backgroundColor:
                      MaterialStatePropertyAll(theme.colorScheme.background),
                  shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                        side: BorderSide(color: theme.colorScheme.primary)),
                  ),
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
                    if (controller.productsResponse.status ==
                        FutureStatus.pending) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    if (controller.productsResponse.status ==
                        FutureStatus.rejected) {
                      return Center(
                          child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(context.loc.error.toUpperCase()),
                      ));
                    }
                    return Column(
                        key: key,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (final element
                              in controller.searchProducts.take(4))
                            ListTile(
                              onTap: () {
                                context.goNamed(AppRoutes.homeProduct.name,
                                    pathParameters: {
                                      'productSlug': element.slug ?? ''
                                    });
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
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.0),
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
              }),
          const SizedBox(height: 10.0),
          SizedBox(
            height: 45.0,
            child: ElevatedButton(
              onPressed: () {
                searchTextController.openView();
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
              ),
              child: Row(
                children: [
                  Expanded(child: Text(context.loc.search)),
                  const Icon(CupertinoIcons.slider_horizontal_3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   final theme = Theme.of(context);
  //   return Container(
  //     color: theme.colorScheme.surface,
  //     padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 20.0),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.stretch,
  //       children: [
  //         TextField(
  //           decoration: InputDecoration(
  //               contentPadding: const EdgeInsets.all(0.0),
  //               focusColor: Colors.blue,
  //               prefixIcon: const Icon(
  //                 CupertinoIcons.search,
  //                 // color: Colors.grey,
  //               ),
  //               suffixIcon: const Icon(
  //                 CupertinoIcons.arrow_turn_down_left,
  //                 // color: Colors.grey,
  //               ),
  //               labelText: context.loc.wantToBuy),
  //         ),
  //         const SizedBox(height: 10.0),
  //         ElevatedButton(
  //           onPressed: () {
  //             context.goNamed(AppRoutes.search.name);
  //           },
  //           style: ElevatedButton.styleFrom(
  //             padding:
  //                 const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  //           ),
  //           child: Row(
  //             children: [
  //               Expanded(child: Text(context.loc.search)),
  //               const Icon(CupertinoIcons.slider_horizontal_3),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
