abstract class HomeLocalDataSource {
  Future<void> setDarkModeStorage(String key, bool value);
  Future<dynamic> readDarkModeStorage();
}
