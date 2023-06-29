import 'package:equatable/equatable.dart';

class SingleArticleEntity extends Equatable {
  final String? id;
  final String? title;
  final String? content;
  final String? image;
  final String? catId;
  final String? catName;
  final String? author;
  final String? view;
  final String? status;
  final String? createdAt;

  const SingleArticleEntity({
    this.id,
    this.title,
    this.content,
    this.image,
    this.catId,
    this.catName,
    this.author,
    this.view,
    this.status,
    this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        content,
        image,
        catId,
        catName,
        author,
        view,
        status,
        createdAt,
      ];
}
