part of 'auth_bloc.dart';

abstract class AuthEvent {}

class RegisterEvent extends AuthEvent {
  final String email;

  RegisterEvent({required this.email});
}

class VerifyUserEvent extends AuthEvent {
  final VerifyUserParams verifyUserParams;

  VerifyUserEvent({required this.verifyUserParams});
}
