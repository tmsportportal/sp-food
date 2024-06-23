import 'package:dio/dio.dart';
import 'package:sportportal_food/src/core/network/helpers/api_client_helper.dart';
import 'package:sportportal_food/src/core/network/helpers/api_path_helper.dart';

import '../dto/category_dto.dart';

class CategoriesRepository {
  final Dio _client;
  const CategoriesRepository(this._client);

  Future<List<CategoryDto>> getCategories() async {
    try {
      final response = await _client.getListData<CategoryDto>(
        ApiPathHelper.category(CategoriesPath.base),
        converter: (e) => CategoryDto.fromJson(e),
      );
      return response;
    } on Exception catch (e) {
      throw Exception('getCategories method error: $e');
    }
  }

  Future<List<CategoryDto>> getCategoryBySlug(String? slug) async {
    try {
      final response = await _client.getListData<CategoryDto>(
        ApiPathHelper.category(CategoriesPath.bySlug, slug: slug),
        converter: (e) => CategoryDto.fromJson(e),
      );
      return response;
    } on Exception catch (e) {
      throw Exception('getCategoryBySlug method error: $e');
    }
  }
}
