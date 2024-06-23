import 'package:dio/dio.dart';
import 'package:sportportal_food/src/core/network/helpers/api_client_helper.dart';
import 'package:sportportal_food/src/features/product/data/dto/product_list_dto.dart';

import '../../../../core/network/helpers/api_path_helper.dart';
import '../../../categories/data/dto/category_dto.dart';

class CategoryRepository {
  final Dio _client;
  const CategoryRepository(Dio client) : _client = client;

  Future<List<ProductListDto>> getCategoryProducts(String? slug) async {
    try {
      final response = _client.getListData<ProductListDto>(
        ApiPathHelper.products(ProductsPath.base),
        queryParameters: {"category__slug": slug},
        converter: (e) => ProductListDto.fromJson(e),
      );
      return response;
    } on Exception catch (e) {
      throw Exception('getCategoryProducts method error: $e');
    }
  }

  Future<CategoryDto> getCategory(String? slug) async {
    try {
      final response = _client.getData<CategoryDto>(
        ApiPathHelper.category(CategoriesPath.bySlug, slug: slug),
        converter: (e) => CategoryDto.fromJson(e),
      );
      return response;
    } on Exception catch (e) {
      throw Exception('getCategory method error: $e');
    }
  }
}
