part of 'create_event_bloc.dart';

sealed class CreateEventStates extends Equatable {
  const CreateEventStates();

  @override
  List<Object> get props => [];
}

final class CreateEventInitialState extends CreateEventStates {}

final class CreateEventLoadingState extends CreateEventStates {}

final class CreateEventFailureState extends CreateEventStates {
  final String message;

  const CreateEventFailureState(this.message);
}

final class CreateEventSuccessState extends CreateEventStates {
  final EventEntity event;

  const CreateEventSuccessState(this.event);
}
