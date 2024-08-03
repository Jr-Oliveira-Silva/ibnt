// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'token_verifier_bloc.dart';

sealed class TokenVerifierEvents extends Equatable {
  const TokenVerifierEvents();

  @override
  List<Object> get props => [];
}

class VerifyTokenEvent extends TokenVerifierEvents {
  const VerifyTokenEvent(this.token);
  final String token;
}
