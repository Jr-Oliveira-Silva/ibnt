part of 'user_bloc.dart';

abstract class UserEvents extends Equatable {
  @override
  List<Object> get props => [];
}

final class GetMembersEvent extends UserEvents {
  GetMembersEvent();
}

final class GetMemberByIdEvent extends UserEvents {
  final String memberId;

  GetMemberByIdEvent(this.memberId);
}

final class SetMemberProfileImageEvent extends UserEvents {
  final XFile imageFile;
  final String memberId;

  SetMemberProfileImageEvent(this.imageFile, this.memberId);
}
