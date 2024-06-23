import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:sportportal_food/src/features/orders/controller/orders_controller.dart';
import 'package:sportportal_food/src/features/orders/data/repository/orders_repository.dart';

import '../../features/account_info/controller/account_info_controller.dart';
import '../../features/address/controller/address_controller.dart';
import '../../features/checkout/controller/checkout_controller.dart';
import '../../features/auth/controller/account_controller.dart';
import '../../features/auth/controller/account_status_controller.dart';
import '../../features/brands/controller/brands_controller.dart';
import '../../features/cart/controller/cart_controller.dart';
import '../../features/categories/controller/categories_controller.dart';
import '../../features/login/controller/login_controller.dart';
import '../../features/order/controller/order_controller.dart';
import '../../features/register/controller/register_controller.dart';
import '../../features/brand/controller/brand_controller.dart';
import '../../features/category/controller/category_controller.dart';
import '../../features/dashboard/controller/dashboard_controller.dart';
import '../../features/favorites/controller/favorites_controller.dart';
import '../../features/product/controller/product_controller.dart';
import '../../features/search/controller/search_controller.dart';
import '../../localization/app_localizations_gateway_hive/app_localizations_gateway_hive.dart';
import '../../localization/controller/localization_controller.dart';
import '../../localization/localizations_use_case/localizations_use_case.dart';
import '../../theme/controller/theme_controller.dart';
import '../../theme/gateway/theme_gateway_hive.dart';
import '../../theme/use_case/theme_use_case.dart';

import '../../features/address/data/repository/address_repository.dart';
import '../../features/auth/data/repository/auth_repository.dart';
import '../../features/brands/data/repository/brands_repository.dart';
import '../../features/categories/data/repository/categories_repository.dart';
import '../../features/category/data/repository/category_repository.dart';
import '../../features/checkout/data/repository/checkout_repository.dart';
import '../../features/favorites/data/repository/favorites_repository.dart';
import '../../features/brand/data/repository/brand_repository.dart';
import '../../features/cart/data/repository/cart_repository.dart';
import '../../features/product/data/repository/products_repository.dart';

import '../network/dio_helper.dart';

/// Class [AppInjections] is used for DEPENDENCY INJECTION.
/// Creating [GetIt] instance and registering necessary injectable instances like [ThemeController] etc.
class AppInjections {
  const AppInjections._();

  /// This function used for register all injections
  static void registerInjections(Box configBox) {
    /// Creating global getIt instance
    final getIt = GetIt.instance;

    /// Registering theme controllers and logic
    getIt.registerSingleton<ThemeGatewayHive>(ThemeGatewayHive(configBox));
    getIt.registerSingleton<ThemeUseCaseImpl>(ThemeUseCaseImpl(getIt()));
    getIt.registerSingleton<ThemeController>(ThemeController(getIt()));

    /// Registering localization controllers and logic
    getIt.registerSingleton<AppLocalizationsGatewayHive>(
        AppLocalizationsGatewayHive(configBox));
    getIt.registerSingleton<LocalizationsUseCaseImpl>(
        LocalizationsUseCaseImpl(getIt()));
    getIt.registerSingleton<LocalizationsController>(
        LocalizationsController(getIt()));

    /// Registering navigation controller
    getIt.registerSingleton<DashboardController>(DashboardController());

    /// Register singleton for Dio instance
    getIt.registerSingleton<Dio>(AppHttpClient.configureClient());

    /// Registering singletons for repositories
    getIt.registerLazySingleton<CategoriesRepository>(
        () => CategoriesRepository(getIt<Dio>()));
    getIt.registerLazySingleton<FavoritesRepository>(
        () => FavoritesRepository(getIt<Dio>()));
    getIt.registerLazySingleton<ProductsRepository>(
        () => ProductsRepository(getIt<Dio>()));
    getIt.registerLazySingleton<CategoryRepository>(
        () => CategoryRepository(getIt<Dio>()));
    getIt.registerLazySingleton<CheckoutRepository>(
        () => CheckoutRepository(getIt<Dio>()));
    getIt.registerLazySingleton<AddressRepository>(
        () => AddressRepository(getIt<Dio>()));
    getIt.registerLazySingleton<OrdersRepository>(
        () => OrdersRepository(getIt<Dio>()));
    getIt.registerLazySingleton<BrandsRepository>(
        () => BrandsRepository(getIt<Dio>()));
    getIt.registerLazySingleton<BrandRepository>(
        () => BrandRepository(getIt<Dio>()));
    getIt.registerLazySingleton<AuthRepository>(
        () => AuthRepository(getIt<Dio>()));
    getIt.registerLazySingleton<CartRepository>(
        () => CartRepository(getIt<Dio>()));

    /// Registering singleton controllers
    getIt.registerLazySingleton(() => AccountStatusController());
    getIt.registerLazySingleton(() => AccountInfoController());
    getIt.registerLazySingleton(() => CategoriesController());
    getIt.registerLazySingleton(() => FavoritesController());
    getIt.registerLazySingleton(() => AccountController());
    getIt.registerLazySingleton(() => AddressController());
    getIt.registerLazySingleton(() => BrandsController());
    getIt.registerLazySingleton(() => CartController());

    /// Registering factory controllers
    getIt.registerFactory(() => SearchStoreController());
    getIt.registerFactory(() => CategoryController());
    getIt.registerFactory(() => RegisterController());
    getIt.registerFactory(() => CheckoutController());
    getIt.registerFactory(() => ProductController());
    getIt.registerFactory(() => OrdersController());
    getIt.registerFactory(() => OrderController());
    getIt.registerFactory(() => BrandController());
    getIt.registerFactory(() => LoginController());
  }
}
