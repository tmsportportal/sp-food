// Services

import 'dart:convert';
import 'dart:developer';

import 'package:sportportal_food/src/features/account_info/data/account_info.dart';

import '../../features/auth/data/dto/account_dto.dart';
import 'key_value_storage_base.dart';

/// A service class for providing methods to store and retrieve key-value data
/// from common or secure storage.
class KeyValueStorageService {
  /// The name of auth token key
  static const _authTokenKey = 'authToken';

  /// The name of user password key
  static const _authPasswordKey = 'authPasswordKey';

  /// The name of user model key
  static const _authUserKey = 'authUserKey';

  /// The name of user model key
  static const _authUserInfoKey = 'authUserInfoKey';

  /// The name of the basket UUID
  static const _basketUUID = 'basketUUID';

  /// The name of the address key
  static const _addressKey = 'addressKey';

  /// Instance of key-value storage base class
  final _keyValueStorage = KeyValueStorageBase();

  /// Returns last authenticated user
  AccountDto getAuthUser() {
    final user = _keyValueStorage.getCommon<String>(_authUserKey);
    final account = AccountDto.fromJson(jsonDecode(user ?? '{}'));
    return account;
  }

  /// Returns last authenticated user
  AccountInfo? getAuthUserInfo() {
    final user = _keyValueStorage.getCommon<String>(_authUserInfoKey);
    if (user == null || user.isEmpty) {
      return null;
    }
    final account = AccountInfo.fromMap(jsonDecode(user));
    return account;
  }

  /// Sets the authenticated user to this value. Even though this method is
  /// asynchronous, we don't care about it's completion which is why we don't
  /// use `await` and let it execute in the background.
  Future<void> setAuthUser(AccountDto user) async {
    await _keyValueStorage.setCommon(_authUserKey, jsonEncode(user.toMap()));
  }

  Future<void> setAuthUserInfo(AccountInfo user) async {
    await _keyValueStorage.setCommon(
        _authUserInfoKey, jsonEncode(user.toMap()));
  }

  Future<bool?> setMainAddress(String address) async {
    return await _keyValueStorage.setCommon(_addressKey, address);
  }

  /// Returns logged in user password
  Future<String> getAuthPassword() async {
    return await _keyValueStorage.getEncrypted(_authPasswordKey) ?? '';
  }

  /// Returns last authentication token
  Future<String> getAuthToken() async {
    return await _keyValueStorage.getEncrypted(_authTokenKey) ?? '';
  }

  Future<String> getBasketUUID() async {
    return await _keyValueStorage.getEncrypted(_basketUUID) ?? '';
  }

  Future<String?> getMainAddress() async {
    return _keyValueStorage.getCommon(_addressKey);
  }

  /// Sets the authentication password to this value. Even though this method is
  /// asynchronous, we don't care about it's completion which is why we don't
  /// use `await` and let it execute in the background.
  Future<void> setAuthPassword(String password) async {
    await _keyValueStorage.setEncrypted(_authPasswordKey, password);
  }

  /// Sets the authentication token to this value. Even though this method is
  /// asynchronous, we don't care about it's completion which is why we don't
  /// use `await` and let it execute in the background.
  Future<void> setAuthToken(String token) async {
    log('new token was saved! $token');
    await _keyValueStorage.setEncrypted(_authTokenKey, token);
  }

  Future<void> setBasketUUID(String uuid) async {
    log('new basket UUID was saved! $uuid');
    await _keyValueStorage.setEncrypted(_basketUUID, uuid);
  }

  Future<void> resetBasketUUID() async {
    log('basket UUID was successfully removed!');
    await _keyValueStorage.clearEncryptedKey(_basketUUID);
  }

  Future<void> deleteAddress() async {
    _keyValueStorage.clearCommonKey(_addressKey);
  }

  /// Resets the authentication. Even though these methods are asynchronous, we
  /// don't care about their completion which is why we don't use `await` and
  /// let them execute in the background.
  void resetKeys() {
    _keyValueStorage
      ..clearCommon()
      ..clearEncrypted();
  }
}
