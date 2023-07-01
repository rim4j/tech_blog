import 'package:dio/dio.dart';
import 'package:tech_blog/common/constants/api_constants.dart';
import 'package:tech_blog/common/params/verify_user_params.dart';
import 'package:tech_blog/common/services/dio_service.dart';
import 'package:tech_blog/features/auth/data/data_sources/remote/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioService _dioService = DioService();

  @override
  Future<dynamic> register(String email) async {
    var formData = FormData.fromMap({'email': email, 'command': 'register'});

    Response res =
        await _dioService.postMethod(formData, ApiUrlConstant.postRegister);

    return res;
  }

  @override
  Future verifyUser(VerifyUserParams params) async {
    var formData = FormData.fromMap({
      'email': params.email,
      "user_id": params.userId,
      "code": params.code,
      'command': 'verify',
    });

    Response res =
        await _dioService.postMethod(formData, ApiUrlConstant.postRegister);

    return res;
  }
}
