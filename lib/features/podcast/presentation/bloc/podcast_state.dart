part of 'podcast_bloc.dart';

class PodcastState extends Equatable {
  final SinglePodcastStatus singlePodcastStatus;

  const PodcastState({
    required this.singlePodcastStatus,
  });

  PodcastState copyWith({
    SinglePodcastStatus? newSinglePodcastStatus,
  }) {
    return PodcastState(
      singlePodcastStatus: newSinglePodcastStatus ?? singlePodcastStatus,
    );
  }

  @override
  List<Object?> get props => [singlePodcastStatus];
}
