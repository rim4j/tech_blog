part of 'article_bloc.dart';

class ArticleState {
  SingleArticleStatus singleArticleStatus;
  ArticleListStatus articleListStatus;
  ArticlePublishedByMeStatus articlePublishedByMeStatus;

  ArticleState({
    required this.singleArticleStatus,
    required this.articleListStatus,
    required this.articlePublishedByMeStatus,
  });

  ArticleState copyWith({
    SingleArticleStatus? newSingleArticleStatus,
    ArticleListStatus? newArticleListStatus,
    ArticlePublishedByMeStatus? newArticlePublishedByMeStatus,
  }) {
    return ArticleState(
      singleArticleStatus: newSingleArticleStatus ?? singleArticleStatus,
      articleListStatus: newArticleListStatus ?? articleListStatus,
      articlePublishedByMeStatus:
          newArticlePublishedByMeStatus ?? articlePublishedByMeStatus,
    );
  }
}
