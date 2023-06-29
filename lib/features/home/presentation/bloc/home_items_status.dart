import 'package:flutter/material.dart';

import 'package:tech_blog/features/article/domain/entities/article_entity.dart';
import 'package:tech_blog/features/home/domain/entities/podcast_entity.dart';
import 'package:tech_blog/features/home/domain/entities/poster_entity.dart';
import 'package:tech_blog/features/home/domain/entities/tag_entity.dart';

@immutable
abstract class HomeItemsStatus {}

class HomeItemsLoading extends HomeItemsStatus {}

class HomeItemsCompleted extends HomeItemsStatus {
  final PosterEntity posterEntity;
  final List<ArticleEntity> topVisited;
  final List<PodcastEntity> topPodcasts;
  final List<TagEntity> tags;

  HomeItemsCompleted({
    required this.posterEntity,
    required this.topVisited,
    required this.topPodcasts,
    required this.tags,
  });
}

class HomeItemsFailed extends HomeItemsStatus {
  final String message;

  HomeItemsFailed(this.message);
}
