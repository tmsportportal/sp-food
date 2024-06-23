import 'dart:io';

import 'package:dio/dio.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'interceptors/api_interceptor.dart';
import 'interceptors/refresh_token_interceptor.dart';

class Configs {
  static const baseUrl = 'http://10.10.73.44:5050/api/';
}

class AppHttpClient {
  const AppHttpClient._();

  static Dio configureClient() {
    final client = Dio(
      BaseOptions(
        baseUrl: Configs.baseUrl,
        contentType: 'application/json',
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          "Accept-Language": 'ru',
        },
      ),
    );

    // Hive store.
    // final store = HiveCacheStore(storePath);
    // // Configure cache strategy.
    // cacheOptions = CacheOptions(
    //     store: store,
    //     policy: CachePolicy.refreshForceCache,
    //     hitCacheOnErrorExcept: [],
    //     keyBuilder: CacheOptions.defaultCacheKeyBuilder);
    // Provide cache functionality
    // client.interceptors.add(DioCacheInterceptor(options: cacheOptions));

    client.interceptors.add(ApiInterceptor());
    client.interceptors.add(RefreshTokenInterceptor(dioClient: client));
    // Log all requests and responses
    // client.interceptors.add(PrettyDioLogger(
    //   request: true,
    //   requestHeader: true,
    //   requestBody: true,
    //   responseHeader: true,
    //   responseBody: true,
    //   error: true,
    // ));
    return client;
  }

// // Returns map with auth header
// // If credentials was provided, then returns non null map
// static Map<String, dynamic>? _getAuthHeader(String credentials) {
//   return credentials.isEmpty
//       ? null
//       : {
//     HttpHeaders.authorizationHeader:
//     'Basic ${base64Url.encode(utf8.encode(credentials))}'
//   };
// }
}
