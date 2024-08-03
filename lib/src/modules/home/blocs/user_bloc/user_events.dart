part of 'user_bloc.dart';

abstract class UserEvents extends Equatable {
  @override
  List<Object> get props => [];
}

final class GetMemberByIdEvent extends UserEvents {
  final String memberId;

  GetMemberByIdEvent(this.memberId);
}

