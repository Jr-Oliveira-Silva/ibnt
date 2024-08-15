part of 'create_user_bloc.dart';

abstract class CreateUserStates extends Equatable {
  @override
  List<Object> get props => [];
}

final class CreateUserInitialState extends CreateUserStates {}

final class CreateUserLoadingState extends CreateUserStates {}

final class CreateUserFailureState extends CreateUserStates {
  final String message;

  CreateUserFailureState(this.message);
}

final class CreateUserSuccessState extends CreateUserStates {
  final AuthResponseEntity authResponse;

  CreateUserSuccessState(this.authResponse);
}
