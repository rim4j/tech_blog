import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tech_blog/features/podcast/domain/entities/podcast_entity.dart';
import 'package:tech_blog/features/podcast/domain/entities/podcast_file_entity.dart';

@immutable
abstract class SinglePodcastStatus extends Equatable {}

class SinglePodcastLoading extends SinglePodcastStatus {
  @override
  List<Object?> get props => [];
}

class SinglePodcastCompleted extends SinglePodcastStatus {
  final List<PodcastFileEntity> files;
  final List<PodcastEntity> related;

  SinglePodcastCompleted({
    required this.files,
    required this.related,
  });

  @override
  List<Object?> get props => [
        files,
        related,
      ];
}

class SinglePodcastError extends SinglePodcastStatus {
  final String message;

  SinglePodcastError({required this.message});

  @override
  List<Object?> get props => [message];
}
