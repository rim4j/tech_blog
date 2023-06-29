import 'package:tech_blog/common/resources/data_state.dart';
import 'package:tech_blog/features/article/domain/repositories/article_repository.dart';

class GetSingleArticleUseCase {
  final ArticleRepository articleRepository;

  GetSingleArticleUseCase({
    required this.articleRepository,
  });

  Future<DataState<Map<String, dynamic>>> call(String id) {
    return articleRepository.fetchInfoArticle(id);
  }
}
