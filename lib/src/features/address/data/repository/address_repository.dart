import 'package:dio/dio.dart';
import 'package:sportportal_food/src/core/network/helpers/api_client_helper.dart';
import 'package:sportportal_food/src/core/network/helpers/api_path_helper.dart';

import '../dto/address_dto.dart';

abstract class AddressRepository {
  Future<AddressDto> postAddress(String data);
  Future<void> deleteAddress(String data);

  Future<List<AddressDto>> getAddresses();

  factory AddressRepository(Dio client) => _AddressRepositoryImpl(client);
}

class _AddressRepositoryImpl implements AddressRepository {
  final Dio _client;
  const _AddressRepositoryImpl(this._client);

  @override
  Future<AddressDto> postAddress(String data) async {
    final response = await _client.postData<AddressDto>(
      ApiPathHelper.auth(AuthPath.address),
      data: {"address": data},
      requiresAuthToken: true,
      converter: (json) => AddressDto.fromJson(json),
    );
    return response;
  }

  @override
  Future<List<AddressDto>> getAddresses() async {
    final response = await _client.getListData<AddressDto>(
      ApiPathHelper.auth(AuthPath.address),
      converter: (e) => AddressDto.fromJson(e),
      requiresAuthToken: true,
    );
    return response;
  }

  @override
  Future<void> deleteAddress(String id) async {
    final response = await _client.deleteData<void>(
      ApiPathHelper.auth(AuthPath.addressById, id: id),
      requiresAuthToken: true,
    );
    return response;
  }
}
