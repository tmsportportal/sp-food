import 'package:dio/dio.dart';
import 'package:sportportal_food/src/core/network/helpers/api_client_helper.dart';
import 'package:sportportal_food/src/core/network/helpers/api_path_helper.dart';

import '../dto/cart_dto.dart';

abstract class CartRepository {
  Future<Map<String, dynamic>?> createCart();

  Future<CartDto> getCartProducts(String? uuid);

  Future<int> addProductToCart({
    required String? uuid,
    required int? productId,
    int? quantity,
    int? id,
  });

  Future<void> updateProductCount({
    required int? productKey,
    required int? quantity,
  });

  Future<void> removeProductFromCart({
    required int? productKey,
  });

  factory CartRepository(Dio client) => _CartRepositoryImpl(client);
}

class _CartRepositoryImpl implements CartRepository {
  final Dio _client;
  _CartRepositoryImpl(this._client);

  @override
  Future<Map<String, dynamic>?> createCart() async {
    try {
      final response = await _client.postData(
        ApiPathHelper.cart(CartPath.create),
      );
      return response;
    } on Exception catch (e) {
      throw Exception('createCart method error: $e');
    }
  }

  @override
  Future<CartDto> getCartProducts(String? uuid) async {
    try {
      final response = await _client.getData<CartDto>(
        ApiPathHelper.cart(CartPath.getBasketByUUID, uuid: uuid),
        converter: (e) => CartDto.fromJson(e),
      );
      return response;
    } on Exception catch (e) {
      throw Exception('getCartProducts method error: $e');
    }
  }

  @override
  Future<int> addProductToCart({
    required String? uuid,
    required int? productId,
    int? quantity = 1,
    int? id,
  }) async {
    try {
      final response = await _client.postData(
        ApiPathHelper.cart(CartPath.addItemToBasket, uuid: uuid),
        data: {
          "product": productId,
          "quantity": quantity,
          "basket": id,
        },
      );
      return response['item_id'];
    } on Exception catch (e) {
      throw Exception('addProductToCart method error: $e');
    }
  }

  @override
  Future<void> updateProductCount(
      {required int? productKey, required int? quantity}) async {
    try {
      final response = await _client.patchData(
        ApiPathHelper.cart(CartPath.updateItem, id: '$productKey'),
        data: {"quantity": quantity},
      );
      return response;
    } catch (e) {
      throw Exception('updateProductCount method error: $e');
    }
  }

  @override
  Future<void> removeProductFromCart({required int? productKey}) async {
    try {
      final response = await _client.deleteData<void>(
        ApiPathHelper.cart(CartPath.deleteItem, id: '$productKey'),
      );
      return response;
    } on Exception catch (e) {
      throw Exception('removeProductFromCart method error: $e');
    }
  }
}
