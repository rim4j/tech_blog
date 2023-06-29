import 'package:flutter/material.dart';

import 'package:tech_blog/features/article/domain/entities/article_entity.dart';
import 'package:tech_blog/features/article/domain/entities/single_article_entity.dart';
import 'package:tech_blog/features/home/domain/entities/tag_entity.dart';

@immutable
abstract class SingleArticleStatus {}

class SingleArticleLoading extends SingleArticleStatus {}

class SingleArticleCompleted extends SingleArticleStatus {
  final SingleArticleEntity singleArticleEntity;
  final List<ArticleEntity> related;
  final List<TagEntity> tags;

  SingleArticleCompleted({
    required this.singleArticleEntity,
    required this.related,
    required this.tags,
  });
}

class SingleArticleError extends SingleArticleStatus {
  final String message;

  SingleArticleError(this.message);
}
