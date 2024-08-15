part of 'get_member_messages_bloc.dart';

abstract class GetMemberMessagesEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class GetMemberMessagesEvent extends GetMemberMessagesEvents {
  final String memberId;

  GetMemberMessagesEvent(this.memberId);
}
