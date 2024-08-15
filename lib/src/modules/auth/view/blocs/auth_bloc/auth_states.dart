part of 'auth_bloc.dart';


@immutable
sealed class AuthStates extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AuthInitialState extends AuthStates {}

final class AuthLoadingState extends AuthStates {}

final class AuthFailureState extends AuthStates {
  final String message;

  AuthFailureState(this.message);
  @override
  List<Object?> get props => [message];
}

final class AuthSuccessState extends AuthStates {
  final AuthResponseEntity authEntity;

  AuthSuccessState(this.authEntity);
  @override
  List<Object?> get props => [authEntity];
}

final class AuthSignOutState extends AuthStates {}
