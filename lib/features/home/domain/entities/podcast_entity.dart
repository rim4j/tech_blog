import 'package:equatable/equatable.dart';

class PodcastEntity extends Equatable {
  final String? id;
  final String? title;
  final String? poster;
  final String? publisher;
  final String? view;
  final String? createdAt;

  const PodcastEntity({
    this.id,
    this.title,
    this.poster,
    this.publisher,
    this.view,
    this.createdAt,
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
