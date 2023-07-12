import 'package:bloc/bloc.dart';
import 'package:tech_blog/common/resources/data_state.dart';

import 'package:tech_blog/features/home/domain/usecases/get_home_items_usecase.dart';
import 'package:tech_blog/features/home/presentation/bloc/theme_status.dart';

import 'home_items_status.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeItemsUseCase getHomeItemsUseCase;

  HomeBloc({
    required this.getHomeItemsUseCase,
  }) : super(
          HomeState(
            homeItemsStatus: HomeItemsLoading(),
            themeStatus: DarkMode(isDarkMode: false),
          ),
        ) {
    on<LoadHomeItemsEvent>(_onLoadHomeItemsEvent);
    on<IsDarkModeEvent>(_isDarkModeEvent);
  }

  void _onLoadHomeItemsEvent(
    LoadHomeItemsEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(newHomeItemsStatus: HomeItemsLoading()));

    DataState dataState = await getHomeItemsUseCase();

    if (dataState is DataSuccess) {
      emit(
        state.copyWith(
          newHomeItemsStatus: HomeItemsCompleted(
            posterEntity: dataState.data["poster"],
            topVisited: dataState.data["topVisited"],
            topPodcasts: dataState.data["topPodcasts"],
            tags: dataState.data["tags"],
          ),
        ),
      );
    }
    if (dataState is DataFailed) {
      emit(
        state.copyWith(newHomeItemsStatus: HomeItemsFailed(dataState.error!)),
      );
    }
  }

  void _isDarkModeEvent(
    IsDarkModeEvent event,
    Emitter<HomeState> emit,
  ) {
    DarkMode darkMode = state.themeStatus as DarkMode;
    if (darkMode.isDarkMode) {
      emit(state.copyWith(newThemeStatus: DarkMode(isDarkMode: false)));
    } else {
      emit(state.copyWith(newThemeStatus: DarkMode(isDarkMode: true)));
    }
  }
}
