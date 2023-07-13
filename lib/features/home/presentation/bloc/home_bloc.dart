import 'package:bloc/bloc.dart';
import 'package:tech_blog/common/resources/data_state.dart';

import 'package:tech_blog/features/home/domain/usecases/get_home_items_usecase.dart';
import 'package:tech_blog/features/home/domain/usecases/read_dark_mode_usecase.dart';
import 'package:tech_blog/features/home/domain/usecases/set_dark_mode_usecase.dart';
import 'package:tech_blog/features/home/presentation/bloc/theme_status.dart';

import 'home_items_status.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeItemsUseCase getHomeItemsUseCase;
  final ReadDarkModeUseCase readDarkModeUseCase;
  final SetDarkModeUseCase setDarkModeUseCase;

  HomeBloc({
    required this.getHomeItemsUseCase,
    required this.readDarkModeUseCase,
    required this.setDarkModeUseCase,
  }) : super(
          HomeState(
            homeItemsStatus: HomeItemsLoading(),
            themeStatus: DarkMode(isDarkMode: false),
          ),
        ) {
    on<LoadHomeItemsEvent>(_onLoadHomeItemsEvent);
    on<IsDarkModeEvent>(_isDarkModeEvent);
    on<InitIsDarkModeEvent>(_initIsDarkModeEvent);
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
  ) async {
    DarkMode darkMode = state.themeStatus as DarkMode;
    if (darkMode.isDarkMode) {
      emit(state.copyWith(newThemeStatus: DarkMode(isDarkMode: false)));
      await setDarkModeUseCase("isDarkMode", false);
    } else {
      emit(state.copyWith(newThemeStatus: DarkMode(isDarkMode: true)));
      await setDarkModeUseCase("isDarkMode", true);
    }
  }

  void _initIsDarkModeEvent(
    InitIsDarkModeEvent event,
    Emitter<HomeState> emit,
  ) async {
    var initDarkMode = await readDarkModeUseCase();

    emit(state.copyWith(newThemeStatus: DarkMode(isDarkMode: initDarkMode)));
  }
}
