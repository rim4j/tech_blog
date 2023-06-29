import 'package:tech_blog/common/resources/data_state.dart';
import 'package:tech_blog/features/article/domain/entities/article_entity.dart';
import 'package:tech_blog/features/article/domain/repositories/article_repository.dart';

class GetArticleListUseCase {
  final ArticleRepository articleRepository;

  GetArticleListUseCase({
    required this.articleRepository,
  });

  Future<DataState<List<ArticleEntity>>> call() {
    return articleRepository.fetchArticleList();
  }
}
