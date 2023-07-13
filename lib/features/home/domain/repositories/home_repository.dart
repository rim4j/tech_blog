import 'package:tech_blog/common/resources/data_state.dart';

abstract class HomeRepository {
  Future<DataState<Map<String, dynamic>>> fetchHomeItems();
  Future<bool> readDarkMode();
  Future<void> setDarkMode(String key, bool value);
}
