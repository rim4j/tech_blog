import 'package:bloc/bloc.dart';
import 'package:tech_blog/common/resources/data_state.dart';

import 'package:tech_blog/features/home/domain/usecases/get_home_items_usecase.dart';

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
          ),
        ) {
    on<LoadHomeItemsEvent>(_onLoadHomeItemsEvent);
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
}
