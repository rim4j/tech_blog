import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:tech_blog/common/params/verify_user_params.dart';
import 'package:tech_blog/common/resources/data_state.dart';
import 'package:tech_blog/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:tech_blog/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:tech_blog/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;
  static const storage = FlutterSecureStorage();

  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
  });
  @override
  Future<DataState<Map<String, dynamic>>> register(String email) async {
    try {
      Response response = await authRemoteDataSource.register(email);

      if (response.statusCode == 200) {
        return DataSuccess(response.data);
      } else {
        return const DataFailed("something went wrong please try again later");
      }
    } catch (e) {
      return const DataFailed("please check your connection");
    }
  }

  @override
  Future<DataState<Map<String, dynamic>>> verifyUserRegister(
      VerifyUserParams params) async {
    try {
      Response response = await authRemoteDataSource.verifyUser(params);

      if (response.statusCode == 200) {
        var status = response.data["response"];

        switch (status) {
          case "verified":
            return DataSuccess(response.data);

          case 'incorrect_code':
            return const DataFailed("کد فعال سازی غلط است");

          case 'expired':
            return const DataFailed("کد فعال سازی منقضی شده است");

          default:
            return const DataFailed(
                "something went wrong please try again later");
        }
      } else {
        return const DataFailed("something went wrong please try again later");
      }
    } catch (e) {
      return const DataFailed("please check your connection");
    }
  }

  @override
  Future<void> saveToken(String token) {
    return authLocalDataSource.saveToken(token);
  }

  @override
  Future<void> saveUserId(String userId) async {
    return authLocalDataSource.saveUserId(userId);
  }

  @override
  Future<bool> isAuthenticated() async {
    var token = await authLocalDataSource.getStorage("token");
    var userId = await authLocalDataSource.getStorage("userId");

    if (token != null && userId != null) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

      if (decodedToken["id"].toString() == userId.toString()) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
