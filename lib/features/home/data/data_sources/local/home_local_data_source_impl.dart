import 'package:tech_blog/common/utils/custom_storage.dart';
import 'package:tech_blog/features/home/data/data_sources/local/home_local_data_source.dart';

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final CustomStorage customStorage = CustomStorage();
  @override
  @override
  Future<void> setDarkModeStorage(String key, bool value) async =>
      await customStorage.writeStorage(key, value);

  @override
  Future<dynamic> readDarkModeStorage() async =>
      await customStorage.readStorage("isDarkMode");
}
