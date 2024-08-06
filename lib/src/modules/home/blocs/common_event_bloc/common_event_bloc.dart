// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ibnt/src/app_imports.dart';

part 'common_event_events.dart';
part 'common_event_states.dart';

class CommonEventBloc extends Bloc<CommonEventEvents, CommonEventStates> {
  CommonEventBloc(
    this._repository,
  ) : super(CommonEventInitialState()) {
    on<DeleteCommonEventEvent>(_mapDeleteCommonEventEvent);
  }

  final IHomeRepository _repository;

  _mapDeleteCommonEventEvent(DeleteCommonEventEvent event, Emitter<CommonEventStates> state) async {
    state(EventLoadingState());
    final (exception, _) = await _repository.deleteEvent(event.event.id!);
    if (exception != null) {
      state(EventFailureState(exception.exception));
    } else {
      state(DeleteEventSuccessState());
    }
  }
}
