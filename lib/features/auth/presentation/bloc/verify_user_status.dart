import 'package:equatable/equatable.dart';

abstract class VerifyUserStatus extends Equatable {}

//VerifyInitial
class VerifyUserInitial extends VerifyUserStatus {
  @override
  List<Object?> get props => [];
}

//loading
class VerifyUserLoading extends VerifyUserStatus {
  @override
  List<Object?> get props => [];
}

//success
class VerifyUserSuccess extends VerifyUserStatus {
  @override
  List<Object?> get props => [];
}

//failed
class VerifyUserFailed extends VerifyUserStatus {
  final String message;

  VerifyUserFailed({
    required this.message,
  });
  @override
  List<Object?> get props => [message];
}
