import 'package:app_ibnt/src/modules/splash/splash_imports.dart';

part 'token_verifier_events.dart';
part 'token_verifier_states.dart';

class TokenVerifierBloc extends Bloc<TokenVerifierEvents, TokenVerifierStates> {
  TokenVerifierBloc(this._repository) : super(TokenVerifierInitialState()) {
    on<VerifyTokenEvent>(_mapVerifyTokenEventToState);
  }

  final ISplashRepository _repository;

  Future<void> _mapVerifyTokenEventToState(VerifyTokenEvent event, Emitter<TokenVerifierStates> state) async {
    state(TokenVerifierLoadingState());
    final result = await _repository.verifyToken(event.token);
    result.fold(
      (left) => state(TokenVerifierFailureState()),
      (right) => state(TokenVerifierSuccessState()),
    );
  }
}
