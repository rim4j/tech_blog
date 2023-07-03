import 'package:tech_blog/common/resources/data_state.dart';
import 'package:tech_blog/features/article/domain/entities/article_entity.dart';
import 'package:tech_blog/features/article/domain/repositories/article_repository.dart';

class GetArticlePublishedByMeUseCase {
  final ArticleRepository articleRepository;

  GetArticlePublishedByMeUseCase({
    required this.articleRepository,
  });

  Future<DataState<List<ArticleEntity>>> call(String userId) =>
      articleRepository.fetchArticlePublishedByMe(userId);
}
