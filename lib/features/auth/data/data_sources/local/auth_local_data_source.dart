abstract class AuthLocalDataSource {
  Future<void> saveToken(String token);
  Future<void> saveUserId(String userId);

  Future<dynamic> getStorage(String key);
}
