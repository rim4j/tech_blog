part of 'article_bloc.dart';

// abstract class ArticleEvent extends Equatable {
//   const ArticleEvent();

//   @override
//   List<Object> get props => [];
// }

abstract class ArticleEvent {}

class LoadSingleArticleEvent extends ArticleEvent {
  String id;

  LoadSingleArticleEvent({
    required this.id,
  });
}
