part of 'create_event_bloc.dart';

sealed class CreateEventEvents extends Equatable {
  const CreateEventEvents();

  @override
  List<Object> get props => [];
}

class CreateEventEvent extends CreateEventEvents {
  final EventEntity event;

  const CreateEventEvent(this.event);
}
