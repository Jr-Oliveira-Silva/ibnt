import 'package:app_ibnt/src/modules/splash/splash_imports.dart';

class SplashRepository implements ISplashRepository {
  SplashRepository(this._client);

  final AppClient _client;

  @override
  Future<Either<AuthException, bool>> verifyToken(String token) async {
    try {
      final response = await _client.post("$API_URL/auth/verify-token/$token") as Response;
      if (response.statusCode == HttpStatus.ok) {
        return right(true);
      } else {
        return left(InvalidTokenException(exception: "Falha no processo de validação de token."));
      }
    } catch (_) {
      return left(InvalidTokenException(exception: "Falha no processo de validação de token."));
    }
  }
}
