part of 'home_bloc.dart';

abstract class HomeEvent {}

class LoadHomeItemsEvent extends HomeEvent {}

class LoadSingleArticleEvent extends HomeEvent {
  String id;

  LoadSingleArticleEvent({
    required this.id,
  });
}
