import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../utils/consts/app_constants.dart';

extension DioExtension on Dio {
  /// Fetching data with [T] type
  /// Fetching data and converting it to the List using [converter]
  /// If this path requires authentication, set [requiresAuthToken] true
  Future<List<T>> getListData<T>(
    String path, {
    required T Function(Map<String, dynamic>) converter,
    Map<String, dynamic>? queryParameters,
    bool requiresAuthToken = false,
  }) async {
    try {
      final response = await get(
        path,
        queryParameters: queryParameters,
        options: Options(
          extra: {AppConstants.requiresAuthToken: requiresAuthToken},
        ),
      );
      final data = response.data['results'] as Iterable?;
      return data?.map((e) {
            return converter(e);
          }).toList() ??
          [];
    } catch (e) {
      if (e is TypeError) {
        debugPrint(e.toString());
        throw Exception('Failed to convert data: $e');
      }
      if (e is FormatException) {
        debugPrint(e.toString());
        throw FormatException('Format exception: $e');
      }
      debugPrint(e.toString());
      throw Exception('An error occurred: $e');
    }
  }

  Future<T> getData<T>(
    String path, {
    required T Function(Map<String, dynamic>) converter,
    Map<String, dynamic>? queryParameters,
    bool requiresAuthToken = false,
  }) async {
    try {
      final response = await get(
        path,
        queryParameters: queryParameters,
        options: Options(
          extra: {AppConstants.requiresAuthToken: requiresAuthToken},
        ),
      );
      final data = response.data as Map<String, dynamic>;
      return converter(data);
    } catch (e) {
      if (e is TypeError) {
        debugPrint(e.toString());
        throw Exception('Failed to convert data: $e');
      }
      if (e is FormatException) {
        debugPrint(e.toString());
        throw FormatException('Format exception: $e');
      }
      debugPrint(e.toString());
      throw Exception('An error occurred: $e');
    }
  }

  Future<T> postData<T>(
    String path, {
    T Function(dynamic)? converter,
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool requiresAuthToken = false,
  }) async {
    try {
      final response = await post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          extra: {AppConstants.requiresAuthToken: requiresAuthToken},
        ),
      );
      if (converter != null) {
        return converter(response.data);
      }
      return response.data;
    } catch (e) {
      if (e is TypeError) {
        debugPrint(e.toString());
        throw Exception('Failed to convert data: $e');
      }
      if (e is FormatException) {
        debugPrint(e.toString());
        throw FormatException('Format exception: $e');
      }
      debugPrint(e.toString());
      throw Exception('An error occurred: $e');
    }
  }

  Future<T> patchData<T>(
    String path, {
    T Function(dynamic)? converter,
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool requiresAuthToken = false,
  }) async {
    try {
      final response = await patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          extra: {AppConstants.requiresAuthToken: requiresAuthToken},
        ),
      );
      if (converter != null) {
        return converter(response.data);
      }
      return response.data;
    } catch (e) {
      if (e is TypeError) {
        debugPrint(e.toString());
        throw Exception('Failed to convert data: $e');
      }
      if (e is FormatException) {
        debugPrint(e.toString());
        throw FormatException('Format exception: $e');
      }
      debugPrint(e.toString());
      throw Exception('An error occurred: $e');
    }
  }
 Future<T> putData<T>(
    String path, {
    T Function(dynamic)? converter,
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool requiresAuthToken = false,
  }) async {
    try {
      final response = await put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          extra: {AppConstants.requiresAuthToken: requiresAuthToken},
        ),
      );
      if (converter != null) {
        return converter(response.data);
      }
      return response.data;
    } catch (e) {
      if (e is TypeError) {
        debugPrint(e.toString());
        throw Exception('Failed to convert data: $e');
      }
      if (e is FormatException) {
        debugPrint(e.toString());
        throw FormatException('Format exception: $e');
      }
      debugPrint(e.toString());
      throw Exception('An error occurred: $e');
    }
  }

  Future<T> deleteData<T>(
    String path, {
    T Function(dynamic)? converter,
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool requiresAuthToken = false,
  }) async {
    try {
      final response = await delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          extra: {AppConstants.requiresAuthToken: requiresAuthToken},
        ),
      );
      if (converter != null) {
        return converter(response.data);
      }
      return response.data;
    } catch (e) {
      if (e is TypeError) {
        debugPrint(e.toString());
        throw Exception('Failed to convert data: $e');
      }
      if (e is FormatException) {
        debugPrint(e.toString());
        throw FormatException('Format exception: $e');
      }
      debugPrint(e.toString());
      throw Exception('An error occurred: $e');
    }
  }
}
