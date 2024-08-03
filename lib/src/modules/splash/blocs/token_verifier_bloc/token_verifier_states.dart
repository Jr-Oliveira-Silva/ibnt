part of 'token_verifier_bloc.dart';

sealed class TokenVerifierStates extends Equatable {
  const TokenVerifierStates();

  @override
  List<Object> get props => [];
}

final class TokenVerifierInitialState extends TokenVerifierStates {}

final class TokenVerifierLoadingState extends TokenVerifierStates {}

final class TokenVerifierFailureState extends TokenVerifierStates {}

final class TokenVerifierSuccessState extends TokenVerifierStates {}
