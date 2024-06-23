import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:sportportal_food/src/core/l10n/app_localizations_context.dart';
import 'package:sportportal_food/src/core/navigation/app_routes.dart';
import 'package:sportportal_food/src/features/auth/controller/account_status_controller.dart';
import 'package:sportportal_food/src/features/dashboard/controller/dashboard_controller.dart';
import 'package:sportportal_food/src/features/favorites/controller/favorites_controller.dart';
import 'package:sportportal_food/src/widgets/custom_error_widget.dart';

import 'widgets/favorite_product_widget.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final accountController = GetIt.instance<AccountStatusController>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(context.loc.favorites),
          ),
          Observer(builder: (context) {
            // account loading
            if (accountController.accountLoginStatus ==
                AccountLoginStatus.loading) {
              return const SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            // account error
            if (accountController.accountLoginStatus ==
                AccountLoginStatus.error) {
              return SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: CustomErrorWidget(
                    onPressed: () {},
                  ),
                ),
              );
            }

            // account logged in
            if (accountController.accountLoginStatus ==
                AccountLoginStatus.loggedIn) {
              return const FavoriteSuccessBody();
            }

            // account not logged in or empty
            return const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: UnauthorizedContainer(),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class FavoriteSuccessBody extends StatefulWidget {
  const FavoriteSuccessBody({super.key});

  @override
  State<FavoriteSuccessBody> createState() => _FavoriteSuccessBodyState();
}

class _FavoriteSuccessBodyState extends State<FavoriteSuccessBody> {
  final controller = GetIt.instance<FavoritesController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        // favorite loading
        if (controller.favoritesResponse.status == FutureStatus.rejected) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: CustomErrorWidget(
                onPressed: () {},
              ),
            ),
          );
        }

        // favorite error
        if (controller.favoritesResponse.status == FutureStatus.pending) {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        // favorite success, but empty
        if (controller.favoritesResponse.status == FutureStatus.fulfilled &&
            controller.favoriteProducts.isEmpty) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Text(context.loc.favoritesIsEmpty),
            ),
          );
        }

        // favorite success
        return SliverList(
          delegate: SliverChildListDelegate(
            controller.favoriteProducts.entries
                .map(
                  (e) => InkWell(
                    onTap: () {
                      context.goNamed(
                        AppRoutes.favoritesProducts.name,
                        pathParameters: {'productSlug': '${e.value}'},
                      );
                    },
                    child: FavoriteProductWidget(
                      productListDto: e.value,
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}

class UnauthorizedContainer extends StatelessWidget {
  const UnauthorizedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          CupertinoIcons.xmark_rectangle,
          color: theme.colorScheme.error,
          size: 80,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            context.loc.unauthorized,
            textAlign: TextAlign.center,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            GetIt.instance<DashboardController>().updateCurrentIndex(4);
          },
          child: Text(context.loc.goToLogin),
        ),
      ],
    );
  }
}
