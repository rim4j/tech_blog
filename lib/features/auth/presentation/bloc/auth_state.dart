part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final RegisterStatus registerStatus;
  final VerifyUserStatus verifyUserStatus;

  const AuthState({
    required this.registerStatus,
    required this.verifyUserStatus,
  });

  AuthState copyWith({
    RegisterStatus? newRegisterStatus,
    VerifyUserStatus? newVerifyUserStatus,
  }) {
    return AuthState(
      registerStatus: newRegisterStatus ?? registerStatus,
      verifyUserStatus: newVerifyUserStatus ?? verifyUserStatus,
    );
  }

  @override
  List<Object> get props => [
        registerStatus,
        verifyUserStatus,
      ];
}
