import 'package:app_ibnt/src/app_imports.dart';

part 'bible_messages_events.dart';
part 'bible_messages_states.dart';

class BibleMessagesBloc extends Bloc<BibleMessagesEvents, BibleMessagesStates> {
  BibleMessagesBloc(this._repository) : super(BibleMessagesInitialState()) {
    on<CreateMessageEvent>(_mapCreateMessageEventToState);
    on<GenerateMessageEvent>(_mapGenerateMessageEventToState);
    on<UpdateMessageEvent>(_mapUpdateMessageEventToState);
    on<PostMessageToTimelineEvent>(_mapPostMessageToTimelineEventToState);
  }

  final IBibleMessagesRepository _repository;

  Future<void> _mapCreateMessageEventToState(CreateMessageEvent event, Emitter<BibleMessagesStates> state) async {
    state(BibleMessagesLoadingState());
    final result = await _repository.createBibleMessage(event.newMessage);
    result.fold(
      (left) => state(BibleMessagesFailureState(left.exception)),
      (right) => state(BibleMessagesSuccessState(right)),
    );
  }

  Future<void> _mapGenerateMessageEventToState(GenerateMessageEvent event, Emitter<BibleMessagesStates> state) async {
    state(BibleMessagesLoadingState());
    final result = await _repository.generateBibleMessage(event.newMessage);
    result.fold(
      (left) => state(BibleMessagesFailureState(left.exception)),
      (right) => state(BibleMessagesSuccessState(right)),
    );
  }

  Future<void> _mapUpdateMessageEventToState(UpdateMessageEvent event, Emitter<BibleMessagesStates> state) async {
    state(BibleMessagesLoadingState());
    final result = await _repository.updateBibleMessage(event.message);
    result.fold(
      (left) => state(UpdateBibleMessageFailureState(left.exception)),
      (right) => state(UpdateBibleMessageSuccessState(right)),
    );
  }

  Future<void> _mapPostMessageToTimelineEventToState(PostMessageToTimelineEvent event, Emitter<BibleMessagesStates> state) async {
    state(BibleMessagesLoadingState());
    final result = await _repository.postBibleMessageInTimeline(event.message);
    result.$1 != null
        ? //
        state(PostBibleMessageToTimelineFailureState(result.$1!.exception))
        : //
        state(PostBibleMessageToTimelineSuccessState());
  }
}
