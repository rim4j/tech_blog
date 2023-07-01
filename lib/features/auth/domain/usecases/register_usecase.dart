import 'package:tech_blog/common/resources/data_state.dart';
import 'package:tech_blog/features/auth/domain/repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository authRepository;

  RegisterUseCase({
    required this.authRepository,
  });

  Future<DataState<Map<String, dynamic>>> call(String email) {
    return authRepository.register(email);
  }
}
