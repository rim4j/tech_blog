part of 'article_bloc.dart';

abstract class ArticleEvent {}

class LoadSingleArticleEvent extends ArticleEvent {
  String id;

  LoadSingleArticleEvent({
    required this.id,
  });
}

class LoadArticleListEvent extends ArticleEvent {}
