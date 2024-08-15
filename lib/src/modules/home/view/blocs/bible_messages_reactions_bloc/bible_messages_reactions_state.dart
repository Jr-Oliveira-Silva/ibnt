part of 'bible_messages_reactions_bloc.dart';

sealed class BibleMessagesReactionsStates extends Equatable {
  const BibleMessagesReactionsStates();

  @override
  List<Object> get props => [];
}

final class BibleMessagesReactionsInitialState extends BibleMessagesReactionsStates {}

final class BibleMessageReactionsLoadingState extends BibleMessagesReactionsStates {}

final class BibleMessageReactionsFailureState extends BibleMessagesReactionsStates {
  final String exception;

  const BibleMessageReactionsFailureState(this.exception);
}

final class BibleMessageReactionSuccessState extends BibleMessagesReactionsStates {
  final List<BibleMessageReactionResponse> bibleMessages;

  const BibleMessageReactionSuccessState(this.bibleMessages);
}
