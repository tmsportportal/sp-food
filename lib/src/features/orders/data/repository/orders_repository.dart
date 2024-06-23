import 'package:dio/dio.dart';
import 'package:sportportal_food/src/core/network/helpers/api_client_helper.dart';
import 'package:sportportal_food/src/core/network/helpers/api_path_helper.dart';

import '../dto/order_dto.dart';

abstract class OrdersRepository {
  Future<List<OrderDto>> getOrders();
  Future<OrderDto> getOrder(int? id);
  factory OrdersRepository(Dio client) => _OrdersRepositoryImpl(client);
}

class _OrdersRepositoryImpl implements OrdersRepository {
  final Dio _client;
  const _OrdersRepositoryImpl(this._client);

  @override
  Future<List<OrderDto>> getOrders() async {
    final response = await _client.getListData<OrderDto>(
      ApiPathHelper.checkout(CheckoutPath.base),
      requiresAuthToken: true,
      converter: (json) => OrderDto.fromJson(json),
    );
    return response;
  }

  @override
  Future<OrderDto> getOrder(int? id) async {
    final response = await _client.getData<OrderDto>(
      ApiPathHelper.checkout(CheckoutPath.byId, id: id),
      requiresAuthToken: true,
      converter: (json) => OrderDto.fromJson(json),
    );
    return response;
  }
}
