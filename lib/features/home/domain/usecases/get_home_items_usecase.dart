import 'package:tech_blog/common/resources/data_state.dart';
import 'package:tech_blog/features/home/domain/repositories/home_repository.dart';

class GetHomeItemsUseCase {
  final HomeRepository homeRepository;

  GetHomeItemsUseCase({
    required this.homeRepository,
  });

  Future<DataState<Map<String, dynamic>>> call() {
    return homeRepository.fetchHomeItems();
  }
}
