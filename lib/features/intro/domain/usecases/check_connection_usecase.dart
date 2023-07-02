import 'package:tech_blog/common/resources/data_state.dart';
import 'package:tech_blog/features/intro/domain/repositories/intro_repository.dart';

class CheckConnectionUseCase {
  final IntroRepository introRepository;

  CheckConnectionUseCase({
    required this.introRepository,
  });

  Future<DataState<bool>> call() {
    return introRepository.checkConnection();
  }
}
