part of 'get_member_messages_bloc.dart';

sealed class GetMemberMessagesStates extends Equatable {
  const GetMemberMessagesStates();

  @override
  List<Object> get props => [];
}

final class GetMemberMessagesInitialState extends GetMemberMessagesStates {}

final class GetMemberMessagesLoadingState extends GetMemberMessagesStates {}

final class GetMemberMessagesFailureState extends GetMemberMessagesStates {
  final String exception;

  const GetMemberMessagesFailureState(this.exception);
}

final class GetMemberMessagesSuccessState extends GetMemberMessagesStates {
  final List<BibleMessageEntity> messages;

  const GetMemberMessagesSuccessState(this.messages);
}
