import 'package:app_ibnt/src/modules/home/home_imports.dart';

part 'bible_messages_reactions_event.dart';
part 'bible_messages_reactions_state.dart';

class BibleMessagesReactionsBloc extends Bloc<BibleMessagesReactionsEvent, BibleMessagesReactionsStates> {
  BibleMessagesReactionsBloc(this._repository) : super(BibleMessagesReactionsInitialState()) {
    on<FetchBibleMessagesReactionsEvent>(_mapFetchBibleMessagesReactionsToState);
    on<ReactionOnBibleMessageEvent>(_mapReactionOnBibleMessageEventToState);
    on<UpdateBibleMessageReactionEvent>(_mapUpdateBibleMessageReactionEventToState);
    on<RemoveBibleMessageReactionEvent>(_mapRemoveBibleMessageReactionEventToState);
  }
  final IHomeRepository _repository;

  Future<void> _mapFetchBibleMessagesReactionsToState(FetchBibleMessagesReactionsEvent event, Emitter<BibleMessagesReactionsStates> state) async {
    state(BibleMessageReactionsLoadingState());
    final result = await _repository.getBibleMessagesReactions();
    result.fold(
      (left) => state(BibleMessageReactionsFailureState(left.exception)),
      (right) => state(BibleMessageReactionSuccessState(right)),
    );
  }

  Future<void> _mapReactionOnBibleMessageEventToState(ReactionOnBibleMessageEvent event, Emitter<BibleMessagesReactionsStates> state) async {
    state(BibleMessageReactionsLoadingState());
    final result = await _repository.setBibleMessageReaction(event.reaction);
    result.fold(
      (left) => state(BibleMessageReactionsFailureState(left.exception)),
      (right) => state(BibleMessageReactionSuccessState(right)),
    );
  }

  Future<void> _mapUpdateBibleMessageReactionEventToState(UpdateBibleMessageReactionEvent event, Emitter<BibleMessagesReactionsStates> state) async {
    state(BibleMessageReactionsLoadingState());
    final result = await _repository.updateBibleMessageReaction(event.updateReaction);
    result.fold(
      (left) => state(BibleMessageReactionsFailureState(left.exception)),
      (right) => state(BibleMessageReactionSuccessState(right)),
    );
  }

  Future<void> _mapRemoveBibleMessageReactionEventToState(RemoveBibleMessageReactionEvent event, Emitter<BibleMessagesReactionsStates> state) async {
    state(BibleMessageReactionsLoadingState());
    final result = await _repository.removeBibleMessageReaction(event.removeReaction);
    result.fold(
      (left) => state(BibleMessageReactionsFailureState(left.exception)),
      (right) => state(BibleMessageReactionSuccessState(right)),
    );
  }

  bool bibleMessageReactedByMember(List<BibleMessageReactionResponse> bibleMessagesReactions, String memberId, String bibleMessageId) {
    if (bibleMessagesReactions.isNotEmpty) {
      bool bibleMessageReactedByMember = bibleMessagesReactions.any((bibleMessageReaction) =>
          bibleMessageReaction.bibleMessageId == bibleMessageId && //
          bibleMessageReaction.memberId == memberId);

      return bibleMessageReactedByMember;
    } else {
      return false;
    }
  }

  bool selectedReaction(List<BibleMessageReactionResponse> bibleMessagesReactions, String memberId, String bibleMessageId, String reactionTagName) {
    if (bibleMessageReactedByMember(bibleMessagesReactions, memberId, bibleMessageId)) {
      late bool selectedTag;
      final bibleMessageReaction = bibleMessagesReactions.firstWhere((bibleMessageReaction) =>
          bibleMessageReaction.memberId == memberId && //
          bibleMessageReaction.bibleMessageId == bibleMessageId);

      selectedTag = bibleMessageReaction.name == reactionTagName ? true : false;
      return selectedTag;
    } else {
      return false;
    }
  }
}
