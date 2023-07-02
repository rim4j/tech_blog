import 'package:tech_blog/common/resources/data_state.dart';
import 'package:tech_blog/features/intro/domain/repositories/intro_repository.dart';
import 'dart:io';

class IntroRepositoryImpl implements IntroRepository {
  @override
  Future<DataState<bool>> checkConnection() async {
    try {
      final result = await InternetAddress.lookup("example.com");
      final connection = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
      if (connection == true) {
        return DataSuccess(connection);
      } else {
        return const DataFailed("لطفا به اینترنت متصل شوید");
      }
    } on SocketException catch (_) {
      return const DataFailed("لطفا به اینترنت متصل شوید");
    }
  }
}
