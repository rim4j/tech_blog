import 'package:tech_blog/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  static const storage = FlutterSecureStorage();

  @override
  Future<void> saveToken(String token) async {
    await storage.write(key: "token", value: token);
  }

  @override
  Future<void> saveUserId(String userId) async {
    await storage.write(key: "userId", value: userId);
  }

  @override
  Future<dynamic> getStorage(String key) async {
    return await storage.read(key: key);
  }
}
