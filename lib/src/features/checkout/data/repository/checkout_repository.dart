import 'package:dio/dio.dart';
import 'package:sportportal_food/src/core/network/helpers/api_client_helper.dart';
import 'package:sportportal_food/src/core/network/helpers/api_path_helper.dart';
import 'package:sportportal_food/src/features/checkout/data/dto/checkout_types_dto.dart';

import '../dto/checkout_dto.dart';

abstract class CheckoutRepository {
  Future<CheckoutTypesDto> getCheckoutTypes();

  Future<void> checkout(CheckoutDto checkoutDto);

  factory CheckoutRepository(Dio client) => _CheckoutRepositoryImpl(client);
}

class _CheckoutRepositoryImpl implements CheckoutRepository {
  final Dio _client;
  const _CheckoutRepositoryImpl(this._client);

  @override
  Future<void> checkout(CheckoutDto checkoutDto) async {
    await _client.postData(ApiPathHelper.checkout(CheckoutPath.base),
        data: checkoutDto.toJson());
  }

  @override
  Future<CheckoutTypesDto> getCheckoutTypes() async {
    final response = await _client.getData<CheckoutTypesDto>(
      ApiPathHelper.checkout(CheckoutPath.checkoutTypes),
      converter: (json) => CheckoutTypesDto.fromJson(json),
    );
    return response;
  }
}
