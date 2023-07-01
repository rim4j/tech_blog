import 'package:tech_blog/common/params/verify_user_params.dart';
import 'package:tech_blog/common/resources/data_state.dart';
import 'package:tech_blog/features/auth/domain/repositories/auth_repository.dart';

class VerifyUserUseCase {
  final AuthRepository authRepository;

  VerifyUserUseCase({
    required this.authRepository,
  });

  Future<DataState<Map<String, dynamic>>> call(VerifyUserParams params) {
    return authRepository.verifyUserRegister(params);
  }
}
