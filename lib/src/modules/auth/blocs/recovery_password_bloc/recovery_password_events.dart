part of 'recovery_password_bloc.dart';

sealed class RecoveryPasswordEvents extends Equatable {
  @override
  List<Object> get props => [];
}

final class SendVerificationCodeEvent extends RecoveryPasswordEvents {
  SendVerificationCodeEvent(this.recoveryEmail);

  final String recoveryEmail;
}
final class RedefinePasswordEvent extends RecoveryPasswordEvents {
  RedefinePasswordEvent(this.recoveryEntity);

  final AuthRecoveryEntity recoveryEntity;
}
