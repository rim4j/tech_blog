import 'package:tech_blog/features/auth/domain/repositories/auth_repository.dart';

class IsAuthUseCase {
  final AuthRepository authRepository;

  IsAuthUseCase({
    required this.authRepository,
  });

  Future<bool> call() async {
    return authRepository.isAuthenticated();
  }
}
