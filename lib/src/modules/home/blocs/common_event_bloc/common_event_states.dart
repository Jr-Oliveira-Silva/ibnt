part of 'common_event_bloc.dart';

sealed class CommonEventStates extends Equatable {
  const CommonEventStates();

  @override
  List<Object> get props => [];
}

final class CommonEventInitialState extends CommonEventStates {}

final class EventLoadingState extends CommonEventStates {}

final class EventFailureState extends CommonEventStates {
  final String exception;

  const EventFailureState(this.exception);
}

final class ShareEventSuccessState extends CommonEventStates {}

final class RemoveFromTimelineSuccessState extends CommonEventStates {}

final class DeleteEventSuccessState extends CommonEventStates {}
