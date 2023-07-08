import 'package:dio/dio.dart';
import 'package:tech_blog/common/resources/data_state.dart';
import 'package:tech_blog/features/podcast/data/data_sources/remote/podcast_remote_data_source.dart';
import 'package:tech_blog/features/podcast/data/models/podcast_file_model.dart';
import 'package:tech_blog/features/podcast/data/models/podcast_model.dart';
import 'package:tech_blog/features/podcast/domain/entities/podcast_entity.dart';
import 'package:tech_blog/features/podcast/domain/entities/podcast_file_entity.dart';
import 'package:tech_blog/features/podcast/domain/repositories/podcast_repository.dart';

class PodcastRepositoryImpl implements PodcastRepository {
  final PodcastRemoteDataSource podcastRemoteDataSource;

  PodcastRepositoryImpl({
    required this.podcastRemoteDataSource,
  });
  @override
  Future<DataState<Map<String, dynamic>>> fetchSinglePodcast(String id) async {
    try {
      Response response = await podcastRemoteDataSource.fetchSinglePodcast(id);

      if (response.statusCode == 200) {
        Map<String, dynamic> singlePodcast = {
          "files": [],
          "related": [],
        };

        List<PodcastFileEntity> files = [];
        List<PodcastEntity> related = [];

        response.data["files"]
            .forEach((item) => files.add(PodcastFileModel.fromJson(item)));

        response.data["related"]
            .forEach((item) => related.add(PodcastModel.fromJson(item)));

        singlePodcast["files"] = files;
        singlePodcast["related"] = related;

        return DataSuccess(singlePodcast);
      } else {
        return const DataFailed("something went wrong please try again later");
      }
    } catch (e) {
      return const DataFailed("please check your connection");
    }
  }
}
