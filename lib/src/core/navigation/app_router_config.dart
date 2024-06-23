import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sportportal_food/src/core/navigation/app_routes.dart';
import 'package:sportportal_food/src/features/account_info/view/account_info_screen.dart';
import 'package:sportportal_food/src/features/checkout/view/checkout_screen.dart';
import 'package:sportportal_food/src/features/home/view/home_screen.dart';
import 'package:sportportal_food/src/features/information/views/about/view/about_screen.dart';
import 'package:sportportal_food/src/features/order/view/order_screen.dart';
import 'package:sportportal_food/src/features/orders/view/orders_screen.dart';
import 'package:sportportal_food/src/features/product/view/product_screen.dart';
import 'package:sportportal_food/src/features/sections/view/sections_screen.dart';

import '../../features/address/view/address_screen.dart';
import '../../features/cart/view/cart_screen.dart';
import '../../features/category/view/category_screen.dart';
import '../../features/dashboard/view/dashboard_screen.dart';
import '../../features/favorites/view/favorites_screen.dart';
import '../../features/profile/view/profile_screen.dart';
import '../../features/brand/view/brand_screen.dart';
import '../../features/search/view/search_screen.dart';
import 'route_models/category_route_info.dart';
import 'route_models/brand_route_info.dart';

class AppRouterConfig {
  final GoRouter _goRouter;

  AppRouterConfig(
      GlobalKey<NavigatorState> rootState, GlobalKey<NavigatorState> shellState)
      : _goRouter = _configureRouter(rootState, shellState);

  GoRouter get router => _goRouter;

  static final GlobalKey<NavigatorState> _homeShellKey =
      GlobalKey<NavigatorState>(debugLabel: 'home');
  static final GlobalKey<NavigatorState> _categoriesShellKey =
      GlobalKey<NavigatorState>(debugLabel: 'sections');
  static final GlobalKey<NavigatorState> _cartShellKey =
      GlobalKey<NavigatorState>(debugLabel: 'cart');
  static final GlobalKey<NavigatorState> _favoritesShellKey =
      GlobalKey<NavigatorState>(debugLabel: 'favorites');
  static final GlobalKey<NavigatorState> _profileShellKey =
      GlobalKey<NavigatorState>(debugLabel: 'profile');

  /// Configures routes and adding pages there
  static GoRouter _configureRouter(GlobalKey<NavigatorState> rootState,
      GlobalKey<NavigatorState> shellState) {
    return GoRouter(
      initialLocation: '/home',
      navigatorKey: rootState,
      debugLogDiagnostics: true,
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) =>
              DashboardScreen(navigationShell: navigationShell),
          branches: [
            StatefulShellBranch(navigatorKey: _homeShellKey, routes: [
              GoRoute(
                path: '/home',
                name: AppRoutes.home.name,
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    child: const HomeScreen(),
                    key: state.pageKey,
                    transitionDuration: const Duration(milliseconds: 1),
                    reverseTransitionDuration: const Duration(milliseconds: 1),
                    transitionsBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation,
                        Widget child) {
                      return ScaleTransition(
                        scale: animation,
                        child: child,
                      );
                    },
                  );
                },
                routes: [
                  GoRoute(
                    pageBuilder: (context, state) {
                      final categoryInfo =
                          CategoryRouteInfo.fromMap(state.pathParameters);
                      return CustomTransitionPage(
                        child: CategoryScreen(
                          categorySlug: categoryInfo.categorySlug,
                        ),
                        key: ValueKey(
                            'home_category_${categoryInfo.categorySlug}'),
                        transitionDuration: const Duration(milliseconds: 1),
                        reverseTransitionDuration:
                            const Duration(milliseconds: 1),
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child) {
                          return ScaleTransition(
                            scale: animation,
                            child: child,
                          );
                        },
                      );
                    },
                    path: 'category/:categorySlug',
                    name: AppRoutes.homeCategory.name,
                    routes: [
                      GoRoute(
                        pageBuilder: (context, state) {
                          final productSlug =
                              state.pathParameters['productSlug'] ?? '0';
                          return CustomTransitionPage(
                            child: ProductScreen(
                              productSlug: productSlug,
                            ),
                            key: ValueKey('home_category_product_$productSlug'),
                            transitionDuration: const Duration(milliseconds: 1),
                            reverseTransitionDuration:
                                const Duration(milliseconds: 1),
                            transitionsBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secondaryAnimation,
                                Widget child) {
                              return ScaleTransition(
                                scale: animation,
                                child: child,
                              );
                            },
                          );
                        },
                        path: 'product/:productSlug',
                        name: AppRoutes.homeCategoryProduct.name,
                      ),
                    ],
                  ),
                  GoRoute(
                    pageBuilder: (context, state) {
                      final productSlug =
                          state.pathParameters['productSlug'] ?? '0';
                      return CustomTransitionPage(
                        child: ProductScreen(
                          productSlug: productSlug,
                        ),
                        key: ValueKey('home_product_$productSlug'),
                        transitionDuration: const Duration(milliseconds: 1),
                        reverseTransitionDuration:
                            const Duration(milliseconds: 1),
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child) {
                          return ScaleTransition(
                            scale: animation,
                            child: child,
                          );
                        },
                      );
                    },
                    path: 'product/:productSlug',
                    name: AppRoutes.homeProduct.name,
                  ),
                  GoRoute(
                    pageBuilder: (context, state) {
                      return CustomTransitionPage(
                        child: const SearchScreen(),
                        key: const ValueKey('search'),
                        transitionDuration: const Duration(milliseconds: 1),
                        reverseTransitionDuration:
                            const Duration(milliseconds: 1),
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child) {
                          return ScaleTransition(
                            scale: animation,
                            child: child,
                          );
                        },
                      );
                    },
                    path: 'search',
                    name: AppRoutes.search.name,
                    routes: [
                      GoRoute(
                        pageBuilder: (context, state) {
                          final productSlug =
                              state.pathParameters['productSlug'] ?? '0';
                          return CustomTransitionPage(
                            child: ProductScreen(
                              productSlug: productSlug,
                            ),
                            key: ValueKey('search_product_$productSlug'),
                            transitionDuration: const Duration(milliseconds: 1),
                            reverseTransitionDuration:
                                const Duration(milliseconds: 1),
                            transitionsBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secondaryAnimation,
                                Widget child) {
                              return ScaleTransition(
                                scale: animation,
                                child: child,
                              );
                            },
                          );
                        },
                        path: 'product/:productSlug',
                        name: AppRoutes.searchProduct.name,
                      ),
                    ],
                  ),
                ],
              ),
            ]),
            StatefulShellBranch(navigatorKey: _categoriesShellKey, routes: [
              GoRoute(
                  path: '/sections',
                  pageBuilder: (context, state) {
                    return CustomTransitionPage(
                      child: const SectionsScreen(),
                      key: state.pageKey,
                      transitionDuration: const Duration(milliseconds: 1),
                      reverseTransitionDuration:
                          const Duration(milliseconds: 1),
                      transitionsBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation,
                          Widget child) {
                        return ScaleTransition(
                          scale: animation,
                          child: child,
                        );
                      },
                    );
                  },
                  routes: [
                    GoRoute(
                        pageBuilder: (context, state) {
                          final categoryInfo =
                              CategoryRouteInfo.fromMap(state.pathParameters);
                          return CustomTransitionPage(
                            child: CategoryScreen(
                              categorySlug: categoryInfo.categorySlug,
                            ),
                            key: ValueKey(
                                'category_${categoryInfo.categorySlug}'),
                            transitionDuration: const Duration(milliseconds: 1),
                            reverseTransitionDuration:
                                const Duration(milliseconds: 1),
                            transitionsBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secondaryAnimation,
                                Widget child) {
                              return ScaleTransition(
                                scale: animation,
                                child: child,
                              );
                            },
                          );
                        },
                        path: 'category/:categorySlug',
                        name: AppRoutes.category.name,
                        routes: [
                          GoRoute(
                            pageBuilder: (context, state) {
                              final productSlug =
                                  state.pathParameters['productSlug'] ?? '0';
                              return CustomTransitionPage(
                                child: ProductScreen(
                                  productSlug: productSlug,
                                ),
                                key: ValueKey('category_item_$productSlug'),
                                transitionDuration:
                                    const Duration(milliseconds: 1),
                                reverseTransitionDuration:
                                    const Duration(milliseconds: 1),
                                transitionsBuilder: (BuildContext context,
                                    Animation<double> animation,
                                    Animation<double> secondaryAnimation,
                                    Widget child) {
                                  return ScaleTransition(
                                    scale: animation,
                                    child: child,
                                  );
                                },
                              );
                            },
                            path: 'product/:productSlug',
                            name: AppRoutes.categoryProduct.name,
                          ),
                        ]),
                    GoRoute(
                        pageBuilder: (context, state) {
                          final brandInfo =
                              BrandRouteInfo.fromMap(state.pathParameters);
                          return CustomTransitionPage(
                            child: BrandScreen(
                              brandSlug: brandInfo.brandSlug,
                              brandName: brandInfo.brandName,
                            ),
                            key: ValueKey('brand_${brandInfo.brandSlug}'),
                            transitionDuration: const Duration(milliseconds: 1),
                            reverseTransitionDuration:
                                const Duration(milliseconds: 1),
                            transitionsBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secondaryAnimation,
                                Widget child) {
                              return ScaleTransition(
                                scale: animation,
                                child: child,
                              );
                            },
                          );
                        },
                        path: 'brand/:brandName-:brandSlug',
                        name: AppRoutes.brand.name,
                        routes: [
                          GoRoute(
                            pageBuilder: (context, state) {
                              final productSlug =
                                  state.pathParameters['productSlug'] ?? '0';
                              return CustomTransitionPage(
                                child: ProductScreen(
                                  productSlug: productSlug,
                                ),
                                key: ValueKey('brand_item_$productSlug'),
                                transitionDuration:
                                    const Duration(milliseconds: 1),
                                reverseTransitionDuration:
                                    const Duration(milliseconds: 1),
                                transitionsBuilder: (BuildContext context,
                                    Animation<double> animation,
                                    Animation<double> secondaryAnimation,
                                    Widget child) {
                                  return ScaleTransition(
                                    scale: animation,
                                    child: child,
                                  );
                                },
                              );
                            },
                            path: 'product/:productSlug',
                            name: AppRoutes.brandProducts.name,
                          ),
                        ]),
                  ]),
            ]),
            StatefulShellBranch(navigatorKey: _cartShellKey, routes: [
              GoRoute(
                path: '/cart',
                name: AppRoutes.cart.name,
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    child: const CartScreen(),
                    key: state.pageKey,
                    transitionDuration: const Duration(milliseconds: 1),
                    reverseTransitionDuration: const Duration(milliseconds: 1),
                    transitionsBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation,
                        Widget child) {
                      return ScaleTransition(
                        scale: animation,
                        child: child,
                      );
                    },
                  );
                },
                routes: [
                  GoRoute(
                    pageBuilder: (context, state) {
                      final productSlug =
                          state.pathParameters['productSlug'] ?? '0';
                      return CustomTransitionPage(
                        child: ProductScreen(productSlug: productSlug),
                        key: ValueKey('cart_item_$productSlug'),
                        transitionDuration: const Duration(milliseconds: 1),
                        reverseTransitionDuration:
                            const Duration(milliseconds: 1),
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child) {
                          return ScaleTransition(
                            scale: animation,
                            child: child,
                          );
                        },
                      );
                    },
                    path: 'product/:productSlug',
                    name: AppRoutes.cartProducts.name,
                  ),
                  GoRoute(
                    pageBuilder: (context, state) {
                      return CustomTransitionPage(
                        child: const CheckoutScreen(),
                        key: const ValueKey('checkout'),
                        transitionDuration: const Duration(milliseconds: 1),
                        reverseTransitionDuration:
                            const Duration(milliseconds: 1),
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child) {
                          return ScaleTransition(
                            scale: animation,
                            child: child,
                          );
                        },
                      );
                    },
                    path: 'checkout',
                    name: AppRoutes.checkout.name,
                    routes: [
                      GoRoute(
                        pageBuilder: (context, state) {
                          return CustomTransitionPage(
                            child: const AddressScreen(),
                            key: const ValueKey('address_screen'),
                            transitionDuration: const Duration(milliseconds: 1),
                            reverseTransitionDuration:
                                const Duration(milliseconds: 1),
                            transitionsBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secondaryAnimation,
                                Widget child) {
                              return ScaleTransition(
                                scale: animation,
                                child: child,
                              );
                            },
                          );
                        },
                        path: 'address',
                        name: AppRoutes.checkoutAddress.name,
                      ),
                    ],
                  ),
                ],
              ),
            ]),
            StatefulShellBranch(navigatorKey: _favoritesShellKey, routes: [
              GoRoute(
                path: '/favorites',
                name: AppRoutes.favorites.name,
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    child: const FavoritesScreen(),
                    key: state.pageKey,
                    transitionDuration: const Duration(milliseconds: 1),
                    reverseTransitionDuration: const Duration(milliseconds: 1),
                    transitionsBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation,
                        Widget child) {
                      return ScaleTransition(
                        scale: animation,
                        child: child,
                      );
                    },
                  );
                },
                routes: [
                  GoRoute(
                    pageBuilder: (context, state) {
                      final productSlug =
                          state.pathParameters['productSlug'] ?? '0';
                      return CustomTransitionPage(
                        child: ProductScreen(productSlug: productSlug),
                        key: ValueKey('favorite_item_$productSlug'),
                        transitionDuration: const Duration(milliseconds: 1),
                        reverseTransitionDuration:
                            const Duration(milliseconds: 1),
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child) {
                          return ScaleTransition(
                            scale: animation,
                            child: child,
                          );
                        },
                      );
                    },
                    path: 'product/:productSlug',
                    name: AppRoutes.favoritesProducts.name,
                  ),
                ],
              ),
            ]),
            StatefulShellBranch(navigatorKey: _profileShellKey, routes: [
              GoRoute(
                path: '/profile',
                name: AppRoutes.profile.name,
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    child: const ProfileScreen(),
                    key: state.pageKey,
                    transitionDuration: const Duration(milliseconds: 1),
                    reverseTransitionDuration: const Duration(milliseconds: 1),
                    transitionsBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation,
                        Widget child) {
                      return ScaleTransition(
                        scale: animation,
                        child: child,
                      );
                    },
                  );
                },
                routes: [
                  GoRoute(
                    pageBuilder: (context, state) {
                      return CustomTransitionPage(
                        child: const AboutScreen(),
                        key: const ValueKey('about_screen'),
                        transitionDuration: const Duration(milliseconds: 1),
                        reverseTransitionDuration:
                            const Duration(milliseconds: 1),
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child) {
                          return ScaleTransition(
                            scale: animation,
                            child: child,
                          );
                        },
                      );
                    },
                    path: 'about',
                    name: AppRoutes.about.name,
                  ),
                  GoRoute(
                    pageBuilder: (context, state) {
                      return CustomTransitionPage(
                        child: const AccountInfoScreen(),
                        key: const ValueKey('account_info_screen'),
                        transitionDuration: const Duration(milliseconds: 1),
                        reverseTransitionDuration:
                            const Duration(milliseconds: 1),
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child) {
                          return ScaleTransition(
                            scale: animation,
                            child: child,
                          );
                        },
                      );
                    },
                    path: 'accountInfo',
                    name: AppRoutes.accountInfo.name,
                  ),
                  GoRoute(
                    pageBuilder: (context, state) {
                      return CustomTransitionPage(
                        child: const AddressScreen(),
                        key: const ValueKey('address_screen'),
                        transitionDuration: const Duration(milliseconds: 1),
                        reverseTransitionDuration:
                            const Duration(milliseconds: 1),
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child) {
                          return ScaleTransition(
                            scale: animation,
                            child: child,
                          );
                        },
                      );
                    },
                    path: 'address',
                    name: AppRoutes.address.name,
                  ),
                  GoRoute(
                    pageBuilder: (context, state) {
                      return CustomTransitionPage(
                        child: const OrdersScreen(),
                        key: const ValueKey('orders_screen'),
                        transitionDuration: const Duration(milliseconds: 1),
                        reverseTransitionDuration:
                            const Duration(milliseconds: 1),
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child) {
                          return ScaleTransition(
                            scale: animation,
                            child: child,
                          );
                        },
                      );
                    },
                    path: 'orders',
                    name: AppRoutes.orders.name,
                    routes: [
                      GoRoute(
                        pageBuilder: (context, state) {
                          final orderId = state.pathParameters['orderId'];
                          return CustomTransitionPage(
                            child: OrderScreen(
                              orderId: orderId,
                            ),
                            key: ValueKey('order_$orderId'),
                            transitionDuration: const Duration(milliseconds: 1),
                            reverseTransitionDuration:
                                const Duration(milliseconds: 1),
                            transitionsBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secondaryAnimation,
                                Widget child) {
                              return ScaleTransition(
                                scale: animation,
                                child: child,
                              );
                            },
                          );
                        },
                        path: 'order/:orderId',
                        name: AppRoutes.order.name,
                      ),
                    ],
                  ),
                ],
              ),
            ]),
          ],
        ),
      ],
    );
  }
}
