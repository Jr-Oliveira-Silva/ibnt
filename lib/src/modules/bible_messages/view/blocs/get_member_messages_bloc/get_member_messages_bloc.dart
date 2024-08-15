import 'package:app_ibnt/src/modules/bible_messages/bible_messages_imports.dart';

part 'get_member_messages_events.dart';
part 'get_member_messages_states.dart';

class GetMemberMessagesBloc extends Bloc<GetMemberMessagesEvents, GetMemberMessagesStates> {
  GetMemberMessagesBloc(this._repository) : super(GetMemberMessagesInitialState()) {
    on<GetMemberMessagesEvent>(_mapGetMemberMessagesEventToState);
  }

  final IBibleMessagesRepository _repository;

  Future<void> _mapGetMemberMessagesEventToState(
      GetMemberMessagesEvent event, Emitter<GetMemberMessagesStates> state) async {
    state(GetMemberMessagesLoadingState());
    final result = await _repository.getMemberMessages(event.memberId);
    result.fold(
      (left) => state(GetMemberMessagesFailureState(left.exception)),
      (right) => state(GetMemberMessagesSuccessState(right)),
    );
  }
}
