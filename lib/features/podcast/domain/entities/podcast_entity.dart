import 'package:equatable/equatable.dart';

class PodcastEntity extends Equatable {
  final String? id;
  final String? title;
  final String? poster;
  final String? publisher;
  final String? view;
  final String? createdAt;

  const PodcastEntity({
    required this.id,
    required this.title,
    required this.poster,
    required this.publisher,
    required this.view,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        poster,
        publisher,
        view,
        createdAt,
      ];
}
