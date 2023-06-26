import 'package:tech_blog/features/home/domain/entities/tag_entity.dart';

class TagModel extends TagEntity {
  const TagModel({
    final String? id,
    final String? title,
  }) : super(
          id: id,
          title: title,
        );

  factory TagModel.fromJson(Map<String, dynamic> element) {
    return TagModel(
      id: element["id"] ?? "",
      title: element["title"] ?? "",
    );
  }
}
