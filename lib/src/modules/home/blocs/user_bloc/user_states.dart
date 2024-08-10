// ignore_for_file: must_be_immutable

part of 'user_bloc.dart';

sealed class UserStates extends Equatable {
  const UserStates();

  @override
  List<Object> get props => [];
}

final class UserInitialState extends UserStates {}

final class GetUserLoadingUserState extends UserStates {}

final class GetUserFailureUserState extends UserStates {
  final String exception;

  const GetUserFailureUserState(this.exception);
}

final class GetUserSuccessState extends UserStates {
  BaseUserEntity user;
  GetUserSuccessState(this.user);
}