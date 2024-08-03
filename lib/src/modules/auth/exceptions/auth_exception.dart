import 'package:app_ibnt/src/modules/auth/auth_imports.dart';

class AuthException extends AppException {
  AuthException({required this.exception}) : super(exception: exception);

  final String exception;
}

class CreateMemberException extends AuthException {
  CreateMemberException({required super.exception});
}

class CreateApiUserException extends AuthException {
  CreateApiUserException({required super.exception});
}

class InvalidTokenException extends AuthException {
  InvalidTokenException({required super.exception});
}
