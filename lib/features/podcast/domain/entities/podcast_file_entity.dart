import 'package:equatable/equatable.dart';

class PodcastFileEntity extends Equatable {
  final String? id;
  final String? podcastId;
  final String? file;
  final String? title;
  final String? length;

  const PodcastFileEntity({
    required this.id,
    required this.podcastId,
    required this.file,
    required this.title,
    required this.length,
  });

  @override
  List<Object?> get props => [
        id,
        podcastId,
        file,
        title,
        length,
      ];
}
