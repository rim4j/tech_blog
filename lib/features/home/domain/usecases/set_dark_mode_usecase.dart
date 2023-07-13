import 'package:tech_blog/features/home/domain/repositories/home_repository.dart';

class SetDarkModeUseCase {
  final HomeRepository homeRepository;

  SetDarkModeUseCase({
    required this.homeRepository,
  });

  Future<void> call(String key, bool value) async =>
      await homeRepository.setDarkMode(key, value);
}
