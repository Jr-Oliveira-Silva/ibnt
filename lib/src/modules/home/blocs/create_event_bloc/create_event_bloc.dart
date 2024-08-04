// ignore_for_file: unused_field

import 'package:app_ibnt/src/modules/home/home_imports.dart';

part 'create_event_events.dart';
part 'create_event_states.dart';

class CreateEventBloc extends Bloc<CreateEventEvents, CreateEventStates> {
  CreateEventBloc(this._repository) : super(CreateEventInitialState()) {
    on<CreateEventEvent>(_mapCreateEventEvent);
  }

  final IHomeRepository _repository;

  Future<void> _mapCreateEventEvent(CreateEventEvent event, Emitter<CreateEventStates> state) async {
    state(CreateEventLoadingState());
    final (exception, newEvent) = await _repository.createEvent(event.event);
    if (exception != null) {
      state(CreateEventFailureState(exception.exception));
    } else {
      state(CreateEventSuccessState(newEvent!));
    }
  }
}
