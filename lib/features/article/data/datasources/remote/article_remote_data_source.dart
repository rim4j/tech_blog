abstract class ArticleRemoteDataSource {
  Future<dynamic> fetchSingleArticle(String id);
  Future<dynamic> fetchNewArticleListData();
}
