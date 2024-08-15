part of 'bible_messages_reactions_bloc.dart';

sealed class BibleMessagesReactionsEvent extends Equatable {
  const BibleMessagesReactionsEvent();

  @override
  List<Object> get props => [];
}

final class FetchBibleMessagesReactionsEvent extends BibleMessagesReactionsEvent {}

class ReactionOnBibleMessageEvent extends BibleMessagesReactionsEvent {
  final BibleMessageReaction reaction;

  const ReactionOnBibleMessageEvent(this.reaction);
}

final class UpdateBibleMessageReactionEvent extends BibleMessagesReactionsEvent {
  final UpdateReactionEntity updateReaction;

  const UpdateBibleMessageReactionEvent(this.updateReaction);
}

final class RemoveBibleMessageReactionEvent extends BibleMessagesReactionsEvent {
  final RemoveReactionEntity removeReaction;

  const RemoveBibleMessageReactionEvent(this.removeReaction);
}
