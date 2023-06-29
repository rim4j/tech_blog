import 'package:tech_blog/common/resources/data_state.dart';
import 'package:tech_blog/features/article/domain/entities/article_entity.dart';

abstract class ArticleRepository {
  Future<DataState<Map<String, dynamic>>> fetchInfoArticle(String id);
  Future<DataState<List<ArticleEntity>>> fetchArticleList();
}
