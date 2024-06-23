import 'package:dio/dio.dart';
import 'package:sportportal_food/src/core/network/helpers/api_client_helper.dart';
import 'package:sportportal_food/src/features/brand/data/dto/brand_dto.dart';

import '../../../../core/network/helpers/api_path_helper.dart';

class BrandsRepository {
  final Dio _client;
  const BrandsRepository(this._client);

  Future<List<BrandDto>> getBrands() async {
    try {
      final response = await _client.getListData<BrandDto>(
        ApiPathHelper.brand(BrandsPath.base),
        converter: (e) => BrandDto.fromJson(e),
      );
      return response;
    } on Exception catch (e) {
      throw Exception('getBrands method error: $e');
    }
  }
}
