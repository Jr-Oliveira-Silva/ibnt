part of 'create_user_bloc.dart';

abstract class CreateUserEvents extends Equatable {
  @override
  List<Object> get props => [];
}

final class CreateUserEvent extends CreateUserEvents {
  final CreateUserEntity newUserEntity;

  CreateUserEvent(this.newUserEntity);
}
