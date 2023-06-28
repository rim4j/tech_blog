import 'package:tech_blog/common/constants/api_constants.dart';
import 'package:tech_blog/features/home/domain/entities/single_article_entity.dart';

class SingleArticleModel extends SingleArticleEntity {
  const SingleArticleModel({
    final String? id,
    final String? title,
    final String? content,
    final String? image,
    final String? catId,
    final String? catName,
    final String? author,
    final String? view,
    final String? status,
    final String? createdAt,
  }) : super(
          id: id,
          title: title,
          content: content,
          image: image,
          catId: catId,
          catName: catName,
          author: author,
          view: view,
          status: status,
          createdAt: createdAt,
        );

  factory SingleArticleModel.fromJson(Map<String, dynamic> element) {
    return SingleArticleModel(
      id: element['id'],
      title: element['title'],
      content: element['content'],
      image: ApiUrlConstant.hostDlUrl + element['image'],
      catId: element['cat_id'],
      catName: element['cat_name'],
      author: element['author'],
      view: element['view'],
      status: element['status'],
      createdAt: element['created_at'],
    );
  }
}
