part of 'home_bloc.dart';

class HomeState {
  HomeItemsStatus homeItemsStatus;
  SingleArticleStatus singleArticleStatus;

  HomeState({
    required this.homeItemsStatus,
    required this.singleArticleStatus,
  });

  HomeState copyWith({
    HomeItemsStatus? newHomeItemsStatus,
    SingleArticleStatus? newSingleArticleStatus,
  }) {
    return HomeState(
      homeItemsStatus: newHomeItemsStatus ?? homeItemsStatus,
      singleArticleStatus: newSingleArticleStatus ?? singleArticleStatus,
    );
  }
}
