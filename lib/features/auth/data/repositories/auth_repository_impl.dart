import 'package:dio/dio.dart';
import 'package:tech_blog/common/params/verify_user_params.dart';
import 'package:tech_blog/common/resources/data_state.dart';
import 'package:tech_blog/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:tech_blog/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({
    required this.authRemoteDataSource,
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
}
