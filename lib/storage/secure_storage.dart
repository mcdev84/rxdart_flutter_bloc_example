import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppAttackStorage {
  final FlutterSecureStorage _storage;

  AppAttackStorage()
      : _storage = const FlutterSecureStorage(
            aOptions: AndroidOptions(encryptedSharedPreferences: true));

  FlutterSecureStorage get storage => _storage;

  Future<void> write({required String key, required String value}) async =>
      await _storage.write(key: key, value: value);

  Future<String> read({required String key}) async =>
      await _storage.read(key: key) ?? '';

  Future<void> del({required String key}) async =>
      await _storage.delete(key: key);
}
