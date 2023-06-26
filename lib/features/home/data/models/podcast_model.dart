import 'package:tech_blog/common/constants/api_constants.dart';
import 'package:tech_blog/features/home/domain/entities/podcast_entity.dart';

class PodcastModel extends PodcastEntity {
  const PodcastModel({
    final String? id,
    final String? title,
    final String? poster,
    final String? publisher,
    final String? view,
    final String? createdAt,
  }) : super(
          id: id,
          title: title,
          poster: poster,
          publisher: publisher,
          view: view,
          createdAt: createdAt,
        );

  factory PodcastModel.fromJson(Map<String, dynamic> element) {
    return PodcastModel(
      id: element['id'] ?? '',
      title: element['title'] ?? '',
      poster: ApiUrlConstant.hostDlUrl + (element['poster'] ?? ''),
      publisher: element['publisher'] ?? '',
      view: element['view'] ?? '',
      createdAt: element['created_at'] ?? '',
    );
  }
}
