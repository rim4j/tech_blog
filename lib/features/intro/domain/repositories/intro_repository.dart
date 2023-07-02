import 'package:tech_blog/common/resources/data_state.dart';

abstract class IntroRepository {
  Future<DataState<bool>> checkConnection();
}
