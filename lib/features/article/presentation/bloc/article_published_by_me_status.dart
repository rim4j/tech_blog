import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tech_blog/features/article/domain/entities/article_entity.dart';

@immutable
abstract class ArticlePublishedByMeStatus extends Equatable {}

class ArticlePublishedByMeLoading extends ArticlePublishedByMeStatus {
  @override
  List<Object?> get props => [];
}

class ArticlePublishedByMeCompleted extends ArticlePublishedByMeStatus {
  final List<ArticleEntity> publishedByMe;

  ArticlePublishedByMeCompleted({
    required this.publishedByMe,
  });

  @override
  List<Object?> get props => [publishedByMe];
}

class ArticlePublishedByMeError extends ArticlePublishedByMeStatus {
  final String message;

  ArticlePublishedByMeError({required this.message});

  @override
  List<Object?> get props => [message];
}
