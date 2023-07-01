import 'package:tech_blog/common/resources/data_state.dart';

abstract class AuthRepository {
  Future<DataState<Map<String, dynamic>>> register(String email);
}
