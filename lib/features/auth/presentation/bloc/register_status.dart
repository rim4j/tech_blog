import 'package:equatable/equatable.dart';

abstract class RegisterStatus extends Equatable {}

//RegisterInitial
class RegisterInitial extends RegisterStatus {
  @override
  List<Object?> get props => [];
}

//loading
class RegisterLoading extends RegisterStatus {
  @override
  List<Object?> get props => [];
}

//success
class RegisterSuccess extends RegisterStatus {
  final String userId;

  RegisterSuccess({
    required this.userId,
  });

  @override
  List<Object?> get props => [userId];
}

//failed
class RegisterFailed extends RegisterStatus {
  final String message;

  RegisterFailed({
    required this.message,
  });
  @override
  List<Object?> get props => [message];
}
