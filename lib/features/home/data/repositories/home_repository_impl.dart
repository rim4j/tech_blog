import 'package:dio/dio.dart';
import 'package:tech_blog/common/resources/data_state.dart';
import 'package:tech_blog/features/home/data/data_sources/local/home_local_data_source.dart';
import 'package:tech_blog/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:tech_blog/features/article/data/models/article_model.dart';
import 'package:tech_blog/features/home/data/models/poster_model.dart';
import 'package:tech_blog/features/home/data/models/tag_model.dart';
import 'package:tech_blog/features/article/domain/entities/article_entity.dart';
import 'package:tech_blog/features/home/domain/entities/tag_entity.dart';
import 'package:tech_blog/features/home/domain/repositories/home_repository.dart';
import 'package:tech_blog/features/podcast/data/models/podcast_model.dart';
import 'package:tech_blog/features/podcast/domain/entities/podcast_entity.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepositoryImpl({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });

  @override
  Future<DataState<Map<String, dynamic>>> fetchHomeItems() async {
    try {
      Response response = await homeRemoteDataSource.fetchHomeItems();

      if (response.statusCode == 200) {
        Map<String, dynamic> homeItems = {
          "poster": {},
          "topVisited": [],
          "topPodcasts": [],
          "tags": [],
        };

        List<ArticleEntity> topVisited = [];
        List<PodcastEntity> topPodcasts = [];
        List<TagEntity> tags = [];

        homeItems["poster"] = PosterModel.fromJson(response.data["poster"]);

        response.data["top_visited"]
            .forEach((item) => topVisited.add(ArticleModel.fromJson(item)));

        response.data["top_podcasts"]
            .forEach((item) => topPodcasts.add(PodcastModel.fromJson(item)));

        response.data["tags"]
            .forEach((item) => tags.add(TagModel.fromJson(item)));

        homeItems["topVisited"] = topVisited;
        homeItems["topPodcasts"] = topPodcasts;
        homeItems["tags"] = tags;

        return DataSuccess(homeItems);
      } else {
        return const DataFailed("something went wrong please try again later");
      }
    } catch (e) {
      return const DataFailed("please check your connection");
    }
  }

  @override
  Future<void> setDarkMode(String key, bool value) async =>
      homeLocalDataSource.setDarkModeStorage(key, value);

  @override
  Future<bool> readDarkMode() async {
    var result = await homeLocalDataSource.readDarkModeStorage();

    if (result == null) {
      return false;
    } else {
      bool isDarkMode = bool.parse("$result");
      return isDarkMode;
    }
  }
}
