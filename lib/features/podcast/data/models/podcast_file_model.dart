import 'package:tech_blog/common/constants/api_constants.dart';
import 'package:tech_blog/features/podcast/domain/entities/podcast_file_entity.dart';

class PodcastFileModel extends PodcastFileEntity {
  const PodcastFileModel({
    final String? id,
    final String? podcastId,
    final String? file,
    final String? title,
    final String? length,
  }) : super(
          id: id,
          podcastId: podcastId,
          file: file,
          title: title,
          length: length,
        );

  factory PodcastFileModel.fromJson(Map<String, dynamic> element) {
    return PodcastFileModel(
      id: element["id"],
      podcastId: element["podcast_id"],
      file: ApiUrlConstant.hostDlUrl + element["file"],
      title: element["title"],
      length: element["length"],
    );
  }
}
