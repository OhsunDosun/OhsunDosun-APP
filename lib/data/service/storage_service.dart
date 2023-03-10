import 'package:injectable/injectable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

@lazySingleton
class StorageService {
  late FlutterSecureStorage _storage;

  @factoryMethod
  static Future<StorageService> create() async {
    final service = StorageService();
    await service.init();
    return service;
  }

  init() async {
    _storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
    );
  }

  Future<String?> get({
    required String key,
  }) async {
    return await _storage.read(key: key);
  }

  Future<void> upsert({
    required String key,
    required String value,
  }) async {
    if (await get(key: key) != null) {
      await _storage.delete(key: key);
    }
    await _storage.write(key: key, value: value);
  }
}
