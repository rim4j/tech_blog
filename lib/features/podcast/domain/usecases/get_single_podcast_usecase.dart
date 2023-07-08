import 'package:tech_blog/common/resources/data_state.dart';
import 'package:tech_blog/features/podcast/domain/repositories/podcast_repository.dart';

class GetSinglePodcastUseCase {
  final PodcastRepository podcastRepository;

  GetSinglePodcastUseCase({
    required this.podcastRepository,
  });

  Future<DataState<Map<String, dynamic>>> call(String id) {
    return podcastRepository.fetchSinglePodcast(id);
  }
}
