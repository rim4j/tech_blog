import 'package:tech_blog/common/resources/data_state.dart';

abstract class ArticleRepository {
  Future<DataState<Map<String, dynamic>>> fetchInfoArticle(String id);
}
