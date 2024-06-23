// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sportportal_food/src/core/network/helpers/api_client_helper.dart';
import 'package:sportportal_food/src/core/network/helpers/api_path_helper.dart';

import '../../local/key_value_storage_service.dart';

/// A class that holds intercepting logic for refreshing expired tokens. This
/// is the last interceptor in the queue.
class RefreshTokenInterceptor extends QueuedInterceptor {
  /// An instance of [Dio] for network requests
  final Dio _dio;

  RefreshTokenInterceptor({
    required Dio dioClient,
  }) : _dio = dioClient;

  /// The name of the exception on which this interceptor is triggered.

  /// This method is used to send a refresh token request if the error
  /// indicates an expired token.
  ///
  /// In case of expired token, it creates a new [Dio] instance, replicates
  /// its options and locks the current instance to prevent further requests.
  /// The new instance retrieves a new token and updates it. The original
  /// request is retried with the new token.
  ///
  /// ** NOTE: ** Any requests from original instance will trigger all attached
  /// interceptors as expected.
  ///
  /// ** The structure of response in case of errors or the refresh request is
  /// dependant on the API and may not always be the same. It might need
  /// changing according to your own API. **
  @override
  Future<void> onError(
    DioError dioError,
    ErrorInterceptorHandler handler,
  ) async {
    if (dioError.response != null) {
      // print();
      if (dioError.response?.statusCode == 401) {
        debugPrint('trying to refresh token');
        final tokenDio = Dio()..options = _dio.options;
        tokenDio.options.headers
            .addAll({HttpHeaders.contentTypeHeader: 'application/json'});

        // Get auth details for refresh token request
        final kVStorageService = KeyValueStorageService();
        final currentUser = kVStorageService.getAuthUser();
        final data = {
          'username': currentUser.username,
          'password': await kVStorageService.getAuthPassword(),
        };

        // Make refresh request and get new token
        final newToken = await _refreshTokenRequest(
          dioError: dioError,
          handler: handler,
          tokenDio: tokenDio,
          data: data,
        );

        if (newToken == null) return super.onError(dioError, handler);

        // Update auth and unlock old dio
        await kVStorageService.setAuthToken(newToken);

        // Make original req with new token
        final response = await _dio.request<Map<String, dynamic>>(
          dioError.requestOptions.path,
          data: dioError.requestOptions.data,
          cancelToken: dioError.requestOptions.cancelToken,
          options: Options(
            headers: <String, Object?>{
              HttpHeaders.authorizationHeader: 'Bearer $newToken'
            },
          ),
        );

        return handler.resolve(response);
      }
    }

    // if not token expired error, forward it to try catch in dio_service
    return super.onError(dioError, handler);
  }

  /// This method sends out a request to refresh the token. Since this request
  /// uses the new [Dio] instance it needs its own logging and error handling.
  ///
  /// ** The structure of response is dependant on the API and may not always
  /// be the same. It might need changing according to your own API. **
  Future<String?> _refreshTokenRequest({
    required DioError dioError,
    required ErrorInterceptorHandler handler,
    required Dio tokenDio,
    required Map<String, dynamic> data,
  }) async {
    debugPrint('--> REFRESHING TOKEN');
    try {
      debugPrint('\tBody: $data');

      final response = await tokenDio.postData<Map<String, dynamic>>(
        ApiPathHelper.auth(AuthPath.base),
        data: data,
      );

      debugPrint('\tResponse: $response');
      debugPrint('<-- END REFRESH');
      return response['access'] as String;
    } on Exception catch (ex) {
      // only caught here for logging
      // forward to try-catch in dio_service for handling
      debugPrint('\t--> ERROR');
      if (ex is DioError) {
        final de = ex;
        debugPrint('\t\t--> Exception: ${de.error}');
        debugPrint('\t\t--> Message: ${de.message}');
        debugPrint('\t\t--> Response: ${de.response}');
      } else {
        debugPrint('\t\t--> Exception: $ex');
      }
      debugPrint('\t<-- END ERROR');
      debugPrint('<-- END REFRESH');

      return null;
    }
  }
}
