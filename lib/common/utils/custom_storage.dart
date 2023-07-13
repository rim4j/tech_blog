import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CustomStorage {
  static const storage = FlutterSecureStorage();

  Future<dynamic> readStorage(String key) async {
    var result = await storage.read(key: key);
    return result;
  }

  Future<void> writeStorage(key, value) async {
    return await storage.write(key: key, value: value.toString());
  }
}
