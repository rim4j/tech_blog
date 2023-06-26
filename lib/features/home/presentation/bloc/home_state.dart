part of 'home_bloc.dart';

class HomeState {
  HomeItemsStatus homeItemsStatus;

  HomeState({
    required this.homeItemsStatus,
  });

  HomeState copyWith({HomeItemsStatus? newHomeItemsStatus}) {
    return HomeState(
      homeItemsStatus: newHomeItemsStatus ?? homeItemsStatus,
    );
  }
}
