// ignore_for_file: prefer_const_constructors_in_immutables
part of 'bible_messages_bloc.dart';

sealed class BibleMessagesStates {}

final class BibleMessagesInitialState extends BibleMessagesStates {}

final class BibleMessagesLoadingState extends BibleMessagesStates {}

final class BibleMessagesFailureState extends BibleMessagesStates {
  final String exception;

  BibleMessagesFailureState(this.exception);
}

final class BibleMessagesSuccessState extends BibleMessagesStates {
  final BibleMessageEntity message;

  BibleMessagesSuccessState(this.message);
}

final class UpdateBibleMessageFailureState extends BibleMessagesStates {
  final String exception;

  UpdateBibleMessageFailureState(this.exception);
}

final class UpdateBibleMessageSuccessState extends BibleMessagesStates {
  final BibleMessageEntity message;

  UpdateBibleMessageSuccessState(this.message);
}

final class PostBibleMessageToTimelineFailureState extends BibleMessagesStates {
  final String exception;

  PostBibleMessageToTimelineFailureState(this.exception);
}

final class PostBibleMessageToTimelineSuccessState extends BibleMessagesStates {}
