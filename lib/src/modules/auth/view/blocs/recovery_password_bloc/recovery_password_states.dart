part of 'recovery_password_bloc.dart';

sealed class RecoveryPasswordStates extends Equatable {
  @override
  List<Object> get props => [];
}

final class RecoveryPasswordInitialState extends RecoveryPasswordStates {}

final class RecoveryPasswordLoadingState extends RecoveryPasswordStates {}

final class RecoveryPasswordFailureState extends RecoveryPasswordStates {
  final String message;

  RecoveryPasswordFailureState(this.message);
}

final class RecoveryPasswordSuccessState extends RecoveryPasswordStates {
  final AuthRecoveryEntity recoveryEntity;

  RecoveryPasswordSuccessState(this.recoveryEntity);
}

final class PasswordDefinitionFailureState extends RecoveryPasswordStates {
  final String message;

  PasswordDefinitionFailureState(this.message);
}

final class PasswordDefinitionSuccessState extends RecoveryPasswordStates {}
