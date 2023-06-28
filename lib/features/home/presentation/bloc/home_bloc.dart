import 'package:bloc/bloc.dart';
import 'package:tech_blog/common/resources/data_state.dart';

import 'package:tech_blog/features/home/domain/usecases/get_home_items_usecase.dart';
import 'package:tech_blog/features/home/domain/usecases/get_single_article_usecase.dart';
import 'package:tech_blog/features/home/presentation/bloc/single_article_status.dart';

import 'home_items_status.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeItemsUseCase getHomeItemsUseCase;
  final GetSingleArticleUseCase getSingleArticleUseCase;

  HomeBloc({
    required this.getHomeItemsUseCase,
    required this.getSingleArticleUseCase,
  }) : super(
          HomeState(
            homeItemsStatus: HomeItemsLoading(),
            singleArticleStatus: SingleArticleLoading(),
          ),
        ) {
    on<LoadHomeItemsEvent>(_onLoadHomeItemsEvent);
    on<LoadSingleArticleEvent>(_onLoadSingleArticleEvent);
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

  void _onLoadSingleArticleEvent(
    LoadSingleArticleEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(newSingleArticleStatus: SingleArticleLoading()));
    DataState dataState = await getSingleArticleUseCase(event.id);

    if (dataState is DataSuccess) {
      emit(
        state.copyWith(
          newSingleArticleStatus: SingleArticleCompleted(
            singleArticleEntity: dataState.data["info"],
            related: dataState.data["related"],
            tags: dataState.data["tags"],
          ),
        ),
      );
    }

    if (dataState is DataFailed) {
      emit(state.copyWith(
          newSingleArticleStatus: SingleArticleError(dataState.error!)));
    }
  }
}
