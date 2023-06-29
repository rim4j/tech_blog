import 'package:dio/dio.dart';
import 'package:tech_blog/common/constants/api_constants.dart';
import 'package:tech_blog/features/article/data/datasources/remote/article_remote_data_source.dart';

class ArticleRemoteDataSourceImpl implements ArticleRemoteDataSource {
  final Dio _dio = Dio();

  @override
  Future fetchSingleArticle(String id) async {
    Response res = await _dio.get(
      "${ApiUrlConstant.baseUrl}/article/get.php?command=info&id=$id&user_id=1",
    );

    return res;
  }
}
