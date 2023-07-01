import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tech_blog/common/resources/data_state.dart';

import 'package:tech_blog/features/auth/domain/usecases/register_usecase.dart';
import 'package:tech_blog/features/auth/presentation/bloc/register_status.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUseCase registerUseCase;

  AuthBloc({
    required this.registerUseCase,
  }) : super(AuthState(
          registerStatus: RegisterInitial(),
        )) {
    on<RegisterEvent>(_registerEvent);
  }

  void _registerEvent(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(newRegisterStatus: RegisterLoading()));

    DataState dataState = await registerUseCase(event.email);

    // print(dataState.toString());

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
}
