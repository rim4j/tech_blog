part of 'article_bloc.dart';

class ArticleState {
  SingleArticleStatus singleArticleStatus;

  ArticleState({
    required this.singleArticleStatus,
  });

  ArticleState copyWith({
    SingleArticleStatus? newSingleArticleStatus,
  }) {
    return ArticleState(
      singleArticleStatus: newSingleArticleStatus ?? singleArticleStatus,
    );
  }
}
