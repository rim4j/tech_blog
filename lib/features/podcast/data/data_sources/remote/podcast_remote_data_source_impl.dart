import 'package:dio/dio.dart';
import 'package:tech_blog/common/constants/api_constants.dart';
import 'package:tech_blog/features/podcast/data/data_sources/remote/podcast_remote_data_source.dart';

class PodcastRemoteDataSourceImpl implements PodcastRemoteDataSource {
  final Dio _dio = Dio();
  @override
  Future fetchSinglePodcast(String id) async {
    Response response = await _dio.get(ApiUrlConstant.podcastFiles + id);
    return response;
  }
}
