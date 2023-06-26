import 'package:tech_blog/common/constants/api_constants.dart';
import 'package:tech_blog/features/home/domain/entities/poster_entity.dart';

class PosterModel extends PosterEntity {
  const PosterModel({
    final String? id,
    final String? title,
    final String? image,
  }) : super(
          id: id,
          title: title,
          image: image,
        );

  factory PosterModel.fromJson(Map<String, dynamic> element) {
    return PosterModel(
      id: element["id"] ?? "",
      title: element["title"] ?? "",
      image: ApiUrlConstant.hostDlUrl + (element["image"] ?? ""),
    );
  }
}
