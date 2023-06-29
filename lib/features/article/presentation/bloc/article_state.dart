part of 'article_bloc.dart';

class ArticleState {
  SingleArticleStatus singleArticleStatus;
  ArticleListStatus articleListStatus;

  ArticleState({
    required this.singleArticleStatus,
    required this.articleListStatus,
  });

  ArticleState copyWith({
    SingleArticleStatus? newSingleArticleStatus,
    ArticleListStatus? newArticleListStatus,
  }) {
    return ArticleState(
      singleArticleStatus: newSingleArticleStatus ?? singleArticleStatus,
      articleListStatus: newArticleListStatus ?? articleListStatus,
    );
  }
}
