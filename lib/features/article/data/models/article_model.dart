import 'package:tech_blog/common/constants/api_constants.dart';
import 'package:tech_blog/features/article/domain/entities/article_entity.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    final String? id,
    final String? title,
    final String? image,
    final String? catId,
    final String? catName,
    final String? author,
    final String? view,
    final String? status,
    //final String? isFavorite,
    final String? createdAt,
  }) : super(
          id: id,
          title: title,
          image: image,
          catId: catId,
          catName: catName,
          author: author,
          view: view,
          status: status,
          createdAt: createdAt,
        );

  factory ArticleModel.fromJson(Map<String, dynamic> element) {
    return ArticleModel(
      id: element["id"] ?? "",
      title: element["title"] ?? "",
      image: ApiUrlConstant.hostDlUrl + (element['image'] ?? ''),
      catId: element["cat_id"] ?? "",
      catName: element["cat_name"] ?? "",
      author: element["author"] ?? 'ساسان صفری',
      view: element["view"] ?? "",
      status: element["status"] ?? "",
      createdAt: element["created_at"] ?? "",
    );
  }
}
