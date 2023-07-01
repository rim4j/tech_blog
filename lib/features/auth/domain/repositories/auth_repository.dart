import 'package:tech_blog/common/params/verify_user_params.dart';
import 'package:tech_blog/common/resources/data_state.dart';

abstract class AuthRepository {
  Future<DataState<Map<String, dynamic>>> register(String email);
  Future<DataState<Map<String, dynamic>>> verifyUserRegister(
    VerifyUserParams params,
  );
}
