import 'package:tech_blog/common/resources/data_state.dart';
import 'package:tech_blog/features/home/domain/repositories/home_repository.dart';

class GetSingleArticleUseCase {
  final HomeRepository homeRepository;

  GetSingleArticleUseCase({
    required this.homeRepository,
  });

  Future<DataState<Map<String, dynamic>>> call(String id) {
    return homeRepository.fetchSingleArticle(id);
  }
}
