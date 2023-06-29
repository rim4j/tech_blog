import 'package:dio/dio.dart';
import 'package:tech_blog/common/constants/api_constants.dart';
import 'package:tech_blog/features/home/data/data_sources/remote/home_remote_data_source.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Dio _dio = Dio();

  @override
  Future<dynamic> fetchHomeItems() async {
    Response response = await _dio.get(ApiUrlConstant.getHomeItems);
    return response;
  }
}
