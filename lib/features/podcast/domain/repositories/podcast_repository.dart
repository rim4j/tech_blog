import 'package:tech_blog/common/resources/data_state.dart';

abstract class PodcastRepository {
  Future<DataState<Map<String, dynamic>>> fetchSinglePodcast(String id);
}
