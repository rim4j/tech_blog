import 'package:dio/dio.dart';
import 'package:tech_blog/common/resources/data_state.dart';
import 'package:tech_blog/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:tech_blog/features/home/data/models/article_model.dart';
import 'package:tech_blog/features/home/data/models/podcast_model.dart';
import 'package:tech_blog/features/home/data/models/poster_model.dart';
import 'package:tech_blog/features/home/data/models/tag_model.dart';
import 'package:tech_blog/features/home/domain/entities/article_entity.dart';
import 'package:tech_blog/features/home/domain/entities/podcast_entity.dart';
import 'package:tech_blog/features/home/domain/entities/tag_entity.dart';
import 'package:tech_blog/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({
    required this.homeRemoteDataSource,
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
        return const DataFailed("status code not 200");
      }
    } catch (e) {
      return const DataFailed("please check your connection");
    }
  }
}
