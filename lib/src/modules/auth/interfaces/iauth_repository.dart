import 'package:app_ibnt/src/modules/auth/auth_imports.dart';

abstract class IAuthRepository {
  Future<Either<AuthException, BaseUserEntity>> createAccount(CreateUserEntity newUserEntity, {bool admin});
  Future<Either<AuthException, BaseUserEntity>> signInWithAuthEntity(Credential auth);
  Future<Either<AuthException, BaseUserEntity>> signInWithGoogleAccount({bool admin});
  Future<Either<AuthException, AuthRecoveryEntity>> sendVerificationCode(String recoveryEmail);
  Future<Either<AuthException, void>> changePassword(AuthRecoveryEntity recoveryEntity);
  Future<void> signOut();
}
