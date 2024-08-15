part of 'get_events_bloc.dart';

sealed class GetEventsStates extends Equatable {
  const GetEventsStates();

  @override
  List<Object> get props => [];
}

final class GetEventsInitialState extends GetEventsStates {}

final class GetEventsLoadingState extends GetEventsStates {}

final class GetEventsFailureState extends GetEventsStates {
  final String exception;

  const GetEventsFailureState(this.exception);
}

final class GetEventsSuccessState extends GetEventsStates {
  final List<EventEntity> events;

  const GetEventsSuccessState(this.events);
}
