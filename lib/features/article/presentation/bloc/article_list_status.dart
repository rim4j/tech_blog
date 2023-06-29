import 'package:flutter/material.dart';

import 'package:tech_blog/features/article/domain/entities/article_entity.dart';

@immutable
abstract class ArticleListStatus {}

class ArticleListLoading extends ArticleListStatus {}

class ArticleListCompleted extends ArticleListStatus {
  final List<ArticleEntity> articleList;

  ArticleListCompleted({
    required this.articleList,
  });
}

class ArticleListError extends ArticleListStatus {
  final String message;

  ArticleListError(this.message);
}
