import 'package:tech_blog/features/auth/domain/repositories/auth_repository.dart';

class SaveTokenUseCase {
  final AuthRepository authRepository;

  SaveTokenUseCase({
    required this.authRepository,
  });

  Future<void> call(String token) {
    return authRepository.saveToken(token);
  }
}
