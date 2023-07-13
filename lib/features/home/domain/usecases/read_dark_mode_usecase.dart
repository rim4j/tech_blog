import 'package:tech_blog/features/home/domain/repositories/home_repository.dart';

class ReadDarkModeUseCase {
  final HomeRepository homeRepository;

  ReadDarkModeUseCase({
    required this.homeRepository,
  });

  Future<bool> call() async => await homeRepository.readDarkMode();
}
