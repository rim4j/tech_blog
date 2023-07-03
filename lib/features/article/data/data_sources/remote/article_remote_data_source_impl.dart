import 'package:dio/dio.dart';
import 'package:tech_blog/common/constants/api_constants.dart';
import 'package:tech_blog/features/article/data/data_sources/remote/article_remote_data_source.dart';

class ArticleRemoteDataSourceImpl implements ArticleRemoteDataSource {
  final Dio _dio = Dio();

  @override
  Future fetchSingleArticle(String id) async {
    Response res = await _dio.get(
      "${ApiUrlConstant.baseUrl}/article/get.php?command=info&id=$id&user_id=1",
    );

    return res;
  }

  @override
  Future fetchNewArticleListData() async {
    Response res = await _dio.get(ApiUrlConstant.getArticleList);

    return res;
  }

  @override
  Future fetchArticlesWithTagId(String id) async {
    // final queryParam = {
    //   'command': 'get_articles_with_tag_id',
    //   'tag_id': id,
    //   'user_id': ''
    // };
    // final uri =
    //     Uri.https(ApiUrlConstant.baseUrl, 'article/get.php?', queryParam);

    // final newUri =
    //     "https://techblog.sasansafari.com/Techblog/api/article/get.php?command=get_articles_with_tag_id&tag_id=$id&user_id=";

    Response res = await _dio.get(
        "https://techblog.sasansafari.com/Techblog/api/article/get.php?command=get_articles_with_tag_id&tag_id=$id&user_id=");

    return res;
  }

  @override
  Future fetchArticlesPublishedByMe(String userId) async {
    Response res = await _dio.get(ApiUrlConstant.publishedByMe + userId);

    return res;
  }
}
