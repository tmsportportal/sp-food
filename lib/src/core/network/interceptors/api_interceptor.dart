import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../../utils/consts/app_constants.dart';
import '../../local/key_value_storage_service.dart';

/// A class that holds intercepting logic for API related requests. This is
/// the first interceptor in case of both request and response.
///
/// Primary purpose is to handle token injection and response success validation
///
/// Since this interceptor isn't responsible for error handling, if an exception
/// occurs it is passed on the next [Interceptor] or to [Dio].
class ApiInterceptor extends Interceptor {
  ApiInterceptor() : super();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.extra.containsKey(AppConstants.requiresAuthToken)) {
      if (options.extra[AppConstants.requiresAuthToken] == true) {
        final token = await KeyValueStorageService().getAuthToken();
        // final token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzExMzc0NTA2LCJpYXQiOjE3MTEzNzQyMDYsImp0aSI6IjUwZGI2YjlhZTYzZjQ5MWE4ZDNhZjA0NGEyNGE5OTE2IiwidXNlcl9pZCI6NX0.ZxPd0G5S7PGuyzTrvdxu8ULF2kCYcEcgMZrDBnfIdxE';
        log('token from storage: $token');
        if (token.isNotEmpty) {
          options.headers.addAll(
            <String, Object?>{HttpHeaders.authorizationHeader: 'Bearer $token'},
          );
        }
        options.extra.remove(AppConstants.requiresAuthToken);
      }
    }
    return handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    final success = response.data != null;

    if (success) return handler.next(response);

    //Reject all error codes from server except 402 and 200 OK
    return handler.reject(
      DioException(
        requestOptions: response.requestOptions,
        response: response,
      ),
    );
  }
}
