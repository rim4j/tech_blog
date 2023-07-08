import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tech_blog/common/resources/data_state.dart';
import 'package:tech_blog/features/podcast/domain/usecases/get_single_podcast_usecase.dart';
import 'package:tech_blog/features/podcast/presentation/bloc/single_podcast_status.dart';

part 'podcast_event.dart';
part 'podcast_state.dart';

class PodcastBloc extends Bloc<PodcastEvent, PodcastState> {
  final GetSinglePodcastUseCase getSinglePodcastUseCase;
  PodcastBloc({
    required this.getSinglePodcastUseCase,
  }) : super(PodcastState(
          singlePodcastStatus: SinglePodcastLoading(),
        )) {
    on<LoadSinglePodcastEvent>(_onLoadSinglePodcastEvent);
  }

  void _onLoadSinglePodcastEvent(
    LoadSinglePodcastEvent event,
    Emitter<PodcastState> emit,
  ) async {
    emit(state.copyWith(newSinglePodcastStatus: SinglePodcastLoading()));

    DataState dataState = await getSinglePodcastUseCase(event.id);

    if (dataState is DataSuccess) {
      emit(
        state.copyWith(
          newSinglePodcastStatus: SinglePodcastCompleted(
            files: dataState.data["files"],
            related: dataState.data["related"],
          ),
        ),
      );
    }

    if (dataState is DataFailed) {
      emit(
        state.copyWith(
          newSinglePodcastStatus: SinglePodcastError(message: dataState.error!),
        ),
      );
    }
  }
}
