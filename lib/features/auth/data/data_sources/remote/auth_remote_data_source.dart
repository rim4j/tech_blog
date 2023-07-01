import 'package:tech_blog/common/params/verify_user_params.dart';

abstract class AuthRemoteDataSource {
  Future<dynamic> register(String email);
  Future<dynamic> verifyUser(VerifyUserParams params);
}
