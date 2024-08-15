// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ibnt/src/app_imports.dart';

part 'get_events_event.dart';
part 'get_events_state.dart';

class GetEventsBloc extends Bloc<GetEventsEvents, GetEventsStates> {
  GetEventsBloc(this._repository) : super(GetEventsInitialState()) {
    on<GetEventsEvent>(_mapGetEventsEvent);
  }

  final IHomeRepository _repository;

  Future<void> _mapGetEventsEvent(GetEventsEvent event, Emitter<GetEventsStates> state) async {
    state(GetEventsLoadingState());
    final (exception, events) = await _repository.getEvents();
    if (exception != null) {
      state(GetEventsFailureState(exception.exception));
    } else {
      state(GetEventsSuccessState(events!));
    }
  }
}
