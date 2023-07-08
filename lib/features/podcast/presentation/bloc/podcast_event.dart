part of 'podcast_bloc.dart';

abstract class PodcastEvent {}

class LoadSinglePodcastEvent extends PodcastEvent {
  final String id;

  LoadSinglePodcastEvent({
    required this.id,
  });
}
