import 'package:tech_blog/features/auth/domain/repositories/auth_repository.dart';

class SaveUserIdUseCase {
  final AuthRepository authRepository;

  SaveUserIdUseCase({
    required this.authRepository,
  });

  Future<void> call(String userId) {
    return authRepository.saveUserId(userId);
  }
}
