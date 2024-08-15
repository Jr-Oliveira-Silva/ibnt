import 'package:app_ibnt/src/app_imports.dart';

part 'events_reactions_events.dart';
part 'events_reactions_states.dart';

class EventsReactionsBloc extends Bloc<ReactionsEvents, ReactionsStates> {
  EventsReactionsBloc(this._repository) : super(ReactionsInitialState()) {
    on<FetchEventsReactionsEvent>(_mapFetchEventsReactionsToState);
    on<ReactionOnEventOfTimelineEvent>(_mapReactionOnEventOfTimelineEventToState);
    on<UpdateEventReactionEvent>(_mapUpdateReactionEventToState);
    on<RemoveEventReactionEvent>(_mapRemoveEventReactionEventToState);
  }

  final IHomeRepository _repository;
  final List<EventReactionResponse> eventsReactions = [];
  final List<BibleMessageReactionResponse> bibleMessagesReactions = [];

  Future<void> _mapReactionOnEventOfTimelineEventToState(ReactionOnEventOfTimelineEvent event, Emitter<ReactionsStates> state) async {
    state(ReactionsLoadingState());
    eventsReactions.clear();
    final result = await _repository.setEventReaction(event.reaction);
    result.fold(
      (left) => state(ReactionsFailureState(left.exception)),
      (right) {
        eventsReactions.addAll(right);
        return state(EventReactionSuccessState(right));
      },
    );
  }

  Future<void> _mapFetchEventsReactionsToState(FetchEventsReactionsEvent event, Emitter<ReactionsStates> state) async {
    state(ReactionsLoadingState());
    eventsReactions.clear();
    final result = await _repository.getEventsReactions();
    result.fold((left) => state(ReactionsFailureState(left.exception)), (right) {
      eventsReactions.addAll(right);
      return state(EventReactionSuccessState(right));
    });
  }

  Future<void> _mapUpdateReactionEventToState(UpdateEventReactionEvent event, Emitter<ReactionsStates> state) async {
    state(ReactionsLoadingState());
    final result = await _repository.updateEventReaction(event.updateReaction);
    result.fold(
      (left) => state(ReactionsFailureState(left.exception)),
      (right) => state(EventReactionSuccessState(right)),
    );
  }

  Future<void> _mapRemoveEventReactionEventToState(RemoveEventReactionEvent event, Emitter<ReactionsStates> state) async {
    state(ReactionsLoadingState());
    final result = await _repository.removeEventReaction(event.removeReaction);
    result.fold(
      (left) => state(ReactionsFailureState(left.exception)),
      (right) => state(EventReactionSuccessState(right)),
    );
  }

  bool eventReactedByMember(List<EventReactionResponse> eventsReactions, String memberId, String eventId) {
    if (eventsReactions.isNotEmpty) {
      bool eventReactedByMember = eventsReactions.any((eventReaction) =>
          eventReaction.eventId == eventId && //
          eventReaction.memberId == memberId);

      return eventReactedByMember;
    } else {
      return false;
    }
  }

  bool selectedReaction(List<EventReactionResponse> eventsReactions, String memberId, String eventId, String reactionTagName) {
    if (eventReactedByMember(eventsReactions, memberId, eventId)) {
      late bool selectedTag;
      final eventReaction = eventsReactions.firstWhere((eventReaction) =>
          eventReaction.memberId == memberId && //
          eventReaction.eventId == eventId);

      selectedTag = eventReaction.name == reactionTagName ? true : false;
      return selectedTag;
    } else {
      return false;
    }
  }
}
