part of 'get_events_bloc.dart';

sealed class GetEventsEvents extends Equatable {
  const GetEventsEvents();

  @override
  List<Object> get props => [];
}

final class GetEventsEvent extends GetEventsEvents {}
