abstract class ArticleRemoteDataSource {
  Future<dynamic> fetchSingleArticle(String id);
  Future<dynamic> fetchNewArticleListData();
  Future<dynamic> fetchArticlesWithTagId(String id);
  Future<dynamic> fetchArticlesPublishedByMe(String userId);
}
