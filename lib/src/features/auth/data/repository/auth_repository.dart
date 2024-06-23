import 'package:dio/dio.dart';
import 'package:sportportal_food/src/core/network/helpers/api_client_helper.dart';
import 'package:sportportal_food/src/core/network/helpers/api_path_helper.dart';
import 'package:sportportal_food/src/features/account_info/data/account_info.dart';
import 'package:sportportal_food/src/features/auth/data/dto/account_dto.dart';

abstract class AuthRepository {
  Future<String> login(AccountDto accountDto);
  Future<void> register(AccountDto accountDto);
  Future<AccountInfo> getAccountInfo();
  Future<AccountInfo> putAccountInfo(AccountInfo? accountInfo);

  factory AuthRepository(Dio client) => _AuthRepositoryImpl(client);
}

class _AuthRepositoryImpl implements AuthRepository {
  final Dio _client;
  const _AuthRepositoryImpl(this._client);

  @override
  Future<String> login(AccountDto accountDto) async {
    try {
      final response = await _client.postData(
        ApiPathHelper.auth(AuthPath.base),
        data: accountDto.toMap(),
      );

      return response['access'];
    } on Exception catch (e) {
      throw Exception('login method error: $e');
    }
  }

  @override
  Future<void> register(AccountDto accountDto) async {
    try {
      final data = accountDto.toMap();
      data.addAll({'password_confirmation': accountDto.password});
      await _client.postData(
        ApiPathHelper.auth(AuthPath.register),
        data: data,
      );
    } on Exception catch (e) {
      throw Exception('register method error: $e');
    }
  }

  @override
  Future<AccountInfo> getAccountInfo() async {
    final data = await _client.getData<AccountInfo>(
      ApiPathHelper.auth(AuthPath.account),
      converter: (json) => AccountInfo.fromMap(json),
      requiresAuthToken: true,
    );
    return data;
  }

  @override
  Future<AccountInfo> putAccountInfo(AccountInfo? accountInfo) async {
    final data = await _client.putData<AccountInfo>(
      ApiPathHelper.auth(AuthPath.account),
      converter: (json) => AccountInfo.fromMap(json),
      requiresAuthToken: true,
      data: accountInfo?.toMap(),
    );
    return data;
  }
}
