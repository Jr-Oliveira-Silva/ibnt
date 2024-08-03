import 'package:app_ibnt/src/modules/auth/auth_imports.dart';

part 'recovery_password_events.dart';
part 'recovery_password_states.dart';

class RecoveryPasswordBloc extends Bloc<RecoveryPasswordEvents, RecoveryPasswordStates> {
  RecoveryPasswordBloc(this._repository) : super(RecoveryPasswordInitialState()) {
    on<SendVerificationCodeEvent>(_mapSendVerificationCodeEventToState);
    on<RedefinePasswordEvent>(_mapRedefinePasswordEventToState);
  }

  final IAuthRepository _repository;

  void _mapSendVerificationCodeEventToState(SendVerificationCodeEvent event, Emitter<RecoveryPasswordStates> state) async {
    state(RecoveryPasswordLoadingState());
    final result = await _repository.sendVerificationCode(event.recoveryEmail);
    result.fold(
      (left) => state(RecoveryPasswordFailureState(left.exception)),
      (right) => state(RecoveryPasswordSuccessState(right)),
    );
  }

  void _mapRedefinePasswordEventToState(RedefinePasswordEvent event, Emitter<RecoveryPasswordStates> state) async {
    state(RecoveryPasswordLoadingState());
    final result = await _repository.changePassword(event.recoveryEntity);
    result.fold(
      (left) => state(PasswordDefinitionFailureState(left.exception)),
      (right) => state(PasswordDefinitionSuccessState()),
    );
  }
}
