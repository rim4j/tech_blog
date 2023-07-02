part of 'intro_bloc.dart';

class IntroState extends Equatable {
  final CheckConnectionStatus checkConnectionStatus;

  const IntroState({
    required this.checkConnectionStatus,
  });

  IntroState copyWith({
    CheckConnectionStatus? newCheckConnectionStatus,
  }) {
    return IntroState(
      checkConnectionStatus: newCheckConnectionStatus ?? checkConnectionStatus,
    );
  }

  @override
  List<Object> get props => [checkConnectionStatus];
}
