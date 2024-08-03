// ignore_for_file: unused_field

import 'package:app_ibnt/src/modules/home/home_imports.dart';

part 'create_event_events.dart';
part 'create_event_states.dart';

class CreateEventBloc extends Bloc<CreateEventEvents, CreateEventState> {
  CreateEventBloc(this._repository) : super(CreateEventInitial()) {
    on<CreateEventEvents>((event, emit) {});
  }

  final IHomeRepository _repository;
}
