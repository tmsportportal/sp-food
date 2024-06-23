import 'package:dio/dio.dart';
import 'package:sportportal_food/src/core/network/helpers/api_client_helper.dart';
import 'package:sportportal_food/src/core/network/helpers/api_path_helper.dart';
import 'package:sportportal_food/src/features/product/data/dto/product_list_dto.dart';

class FavoritesRepository {
  final Dio _client;
  const FavoritesRepository(this._client);

  Future<List<ProductListDto>> getFavorites() async {
    try {
      final response = await _client.getListData<ProductListDto>(
        ApiPathHelper.favorites(FavoritesPath.base),
        requiresAuthToken: true,
        converter: (e) => ProductListDto.fromJson(e),
      );
      return response;
    } catch (e) {
      throw Exception('getFavorites method error: $e');
    }
  }

  Future<void> addToFavorites(int productId) async {
    try {
      await _client.postData<void>(ApiPathHelper.favorites(FavoritesPath.base),
          requiresAuthToken: true, data: {"product": productId});
    } catch (e) {
      throw Exception('addToFavorites method error: $e');
    }
  }

  Future<void> removeFromFavorites(int productId) async {
    try {
      await _client.deleteData<void>(
          ApiPathHelper.favorites(FavoritesPath.byId, productId),
          requiresAuthToken: true);
    } catch (e) {
      throw Exception('addToFavorites method error: $e');
    }
  }
}
