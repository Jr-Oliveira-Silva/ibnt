part of 'events_reactions_bloc.dart';

sealed class ReactionsEvents extends Equatable {
  @override
  List<Object> get props => [];
}

final class FetchEventsReactionsEvent extends ReactionsEvents {}

class ReactionOnEventOfTimelineEvent extends ReactionsEvents {
  final EventReaction reaction;

  ReactionOnEventOfTimelineEvent(this.reaction);
}

final class UpdateEventReactionEvent extends ReactionsEvents {
  final UpdateReactionEntity updateReaction;

  UpdateEventReactionEvent(this.updateReaction);
}

final class RemoveEventReactionEvent extends ReactionsEvents {
  final RemoveReactionEntity removeReaction;

  RemoveEventReactionEvent(this.removeReaction);
}
