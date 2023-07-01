part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final RegisterStatus registerStatus;

  const AuthState({
    required this.registerStatus,
  });

  AuthState copyWith({
    RegisterStatus? newRegisterStatus,
  }) {
    return AuthState(
      registerStatus: newRegisterStatus ?? registerStatus,
    );
  }

  @override
  List<Object> get props => [
        registerStatus,
      ];
}
