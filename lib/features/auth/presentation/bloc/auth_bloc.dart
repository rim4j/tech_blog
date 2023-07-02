import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tech_blog/common/params/verify_user_params.dart';
import 'package:tech_blog/common/resources/data_state.dart';

import 'package:tech_blog/features/auth/domain/usecases/register_usecase.dart';
import 'package:tech_blog/features/auth/domain/usecases/save_token_usecase.dart';
import 'package:tech_blog/features/auth/domain/usecases/save_user_id_usecase.dart';
import 'package:tech_blog/features/auth/domain/usecases/verify_user_usecase.dart';
import 'package:tech_blog/features/auth/presentation/bloc/register_status.dart';
import 'package:tech_blog/features/auth/presentation/bloc/verify_user_status.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUseCase registerUseCase;
  final VerifyUserUseCase verifyUserUseCase;
  final SaveTokenUseCase saveTokenUseCase;
  final SaveUserIdUseCase saveUserIdUseCase;

  AuthBloc({
    required this.registerUseCase,
    required this.verifyUserUseCase,
    required this.saveTokenUseCase,
    required this.saveUserIdUseCase,
  }) : super(AuthState(
          registerStatus: RegisterInitial(),
          verifyUserStatus: VerifyUserInitial(),
        )) {
    on<RegisterEvent>(_registerEvent);
    on<VerifyUserEvent>(_verifyUserEvent);
  }

  void _registerEvent(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(newRegisterStatus: RegisterLoading()));

    DataState dataState = await registerUseCase(event.email);

    if (dataState is DataSuccess) {
      emit(state.copyWith(
          newRegisterStatus:
              RegisterSuccess(userId: dataState.data["user_id"])));
    }

    if (dataState is DataFailed) {
      emit(state.copyWith(
          newRegisterStatus: RegisterFailed(message: dataState.error!)));
    }
  }

  void _verifyUserEvent(VerifyUserEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(newVerifyUserStatus: VerifyUserLoading()));

    DataState dataState = await verifyUserUseCase(event.verifyUserParams);

    if (dataState is DataSuccess) {
      emit(state.copyWith(newVerifyUserStatus: VerifyUserSuccess()));

      String token = dataState.data["token"];
      String userId = dataState.data["user_id"];

      await saveTokenUseCase(token);
      await saveUserIdUseCase(userId);
    }

    if (dataState is DataFailed) {
      emit(state.copyWith(
          newVerifyUserStatus: VerifyUserFailed(message: dataState.error!)));
    }
  }
}
