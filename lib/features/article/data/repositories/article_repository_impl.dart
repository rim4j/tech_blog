import 'package:dio/dio.dart';

import 'package:tech_blog/common/resources/data_state.dart';
import 'package:tech_blog/features/article/data/data_sources/remote/article_remote_data_source.dart';
import 'package:tech_blog/features/article/domain/repositories/article_repository.dart';
import 'package:tech_blog/features/article/data/models/article_model.dart';
import 'package:tech_blog/features/article/data/models/single_article_model.dart';
import 'package:tech_blog/features/home/data/models/tag_model.dart';
import 'package:tech_blog/features/article/domain/entities/article_entity.dart';
import 'package:tech_blog/features/home/domain/entities/tag_entity.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  ArticleRemoteDataSource articleRemoteDataSource;

  ArticleRepositoryImpl({
    required this.articleRemoteDataSource,
  });

  @override
  Future<DataState<Map<String, dynamic>>> fetchInfoArticle(String id) async {
    try {
      Response response = await articleRemoteDataSource.fetchSingleArticle(id);

      if (response.statusCode == 200) {
        Map<String, dynamic> singleArticleItems = {
          //single article model
          "info": {},
          //article model
          "related": [],
          //tag model
          "tags": [],
        };

        List<ArticleEntity> related = [];
        List<TagEntity> tags = [];

        singleArticleItems["info"] =
            SingleArticleModel.fromJson(response.data["info"]);

        response.data["related"]
            .forEach((item) => related.add(ArticleModel.fromJson(item)));

        response.data["tags"]
            .forEach((item) => tags.add(TagModel.fromJson(item)));

        singleArticleItems["related"] = related;
        singleArticleItems["tags"] = tags;

        return DataSuccess(singleArticleItems);
      } else {
        return const DataFailed("something went wrong please try again later");
      }
    } catch (e) {
      return const DataFailed("please check your connection");
    }
  }

  @override
  Future<DataState<List<ArticleEntity>>> fetchArticleList() async {
    try {
      Response response =
          await articleRemoteDataSource.fetchNewArticleListData();

      if (response.statusCode == 200) {
        List<ArticleEntity> articleList = [];

        response.data
            .forEach((item) => articleList.add(ArticleModel.fromJson(item)));

        return DataSuccess(articleList);
      } else {
        return const DataFailed("something went wrong please try again later");
      }
    } catch (e) {
      return const DataFailed("please check your connection");
    }
  }

  @override
  Future<DataState<List<ArticleEntity>>> fetchArticleListWithId(
      String id) async {
    try {
      Response response =
          await articleRemoteDataSource.fetchArticlesWithTagId(id);

      if (response.statusCode == 200) {
        List<ArticleEntity> articleList = [];

        response.data
            .forEach((item) => articleList.add(ArticleModel.fromJson(item)));

        return DataSuccess(articleList);
      } else {
        return const DataFailed("something went wrong please try again later");
      }
    } catch (e) {
      return const DataFailed("please check your connection");
    }
  }

  @override
  Future<DataState<List<ArticleEntity>>> fetchArticlePublishedByMe(
      String userId) async {
    try {
      Response response =
          await articleRemoteDataSource.fetchArticlesPublishedByMe(userId);

      if (response.statusCode == 200) {
        List<ArticleEntity> articlePublishedByMe = [];

        response.data.forEach(
            (item) => articlePublishedByMe.add(ArticleModel.fromJson(item)));

        return DataSuccess(articlePublishedByMe);
      } else {
        return const DataFailed("something went wrong please try again later");
      }
    } catch (e) {
      return const DataFailed("please check your connection");
    }
  }
}
