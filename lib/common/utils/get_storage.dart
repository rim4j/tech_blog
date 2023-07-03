import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CustomGetStorage {
  static const storage = FlutterSecureStorage();

  Future<dynamic> readStorage(String key) async {
    const storage = FlutterSecureStorage();
    var result = await storage.read(key: key);
    return result;
  }
}
