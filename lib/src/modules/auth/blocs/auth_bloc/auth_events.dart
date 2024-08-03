part of 'auth_bloc.dart';

@immutable
sealed class AuthEvents {}

final class AuthEvent extends AuthEvents {
  final AuthResponseEntity authEntity;

  AuthEvent(this.authEntity);
}

final class SignInWithAuthEntityEvent extends AuthEvents {
  final Credential authEntity;

  SignInWithAuthEntityEvent(this.authEntity);
}

final class GoogleSignInEvent extends AuthEvents {}

final class SignOutEvent extends AuthEvents {}
