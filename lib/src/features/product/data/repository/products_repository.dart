import 'package:dio/dio.dart';
import 'package:sportportal_food/src/core/network/helpers/api_client_helper.dart';
import 'package:sportportal_food/src/core/network/helpers/api_path_helper.dart';

import '../dto/product_detail_dto.dart';
import '../dto/product_list_dto.dart';

class ProductsRepository {
  final Dio _client;
  const ProductsRepository(this._client);

  Future<List<ProductListDto>> getProducts(String? searchKey) async {
    final response = _client.getListData<ProductListDto>(
      ApiPathHelper.products(ProductsPath.base),
      queryParameters: searchKey != null && searchKey.isNotEmpty
          ? {'search': searchKey}
          : null,
      converter: (e) => ProductListDto.fromJson(e),
    );
    return response;
  }

  Future<ProductDetailDto> getProductBySlug(String? slug) async {
    final response = _client.getData<ProductDetailDto>(
      ApiPathHelper.products(ProductsPath.bySlug, slug: slug),
      converter: (e) => ProductDetailDto.fromJson(e),
    );
    return response;
  }
}
