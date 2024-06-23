import 'package:dio/dio.dart';
import 'package:sportportal_food/src/core/network/helpers/api_client_helper.dart';
import 'package:sportportal_food/src/core/network/helpers/api_path_helper.dart';
import 'package:sportportal_food/src/features/product/data/dto/product_list_dto.dart';

class BrandRepository {
  final Dio _client;
  const BrandRepository(this._client);

  Future<List<ProductListDto>> getBrandProducts(String? slug) async {
    try {
      final response = await _client.getListData<ProductListDto>(
          ApiPathHelper.products(ProductsPath.base),
          queryParameters: {"brand__slug": slug},
          converter: (e) => ProductListDto.fromJson(e));
      return response;
    } on Exception catch (e) {
      throw Exception('getBrandProducts method error: $e');
    }
  }
}
