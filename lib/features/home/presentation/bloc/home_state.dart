part of 'home_bloc.dart';

class HomeState {
  HomeItemsStatus homeItemsStatus;
  ThemeStatus themeStatus;

  HomeState({
    required this.homeItemsStatus,
    required this.themeStatus,
  });

  HomeState copyWith({
    HomeItemsStatus? newHomeItemsStatus,
    ThemeStatus? newThemeStatus,
  }) {
    return HomeState(
      homeItemsStatus: newHomeItemsStatus ?? homeItemsStatus,
      themeStatus: newThemeStatus ?? themeStatus,
    );
  }
}
