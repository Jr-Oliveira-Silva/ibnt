part of 'common_event_bloc.dart';

sealed class CommonEventEvents extends Equatable {
  const CommonEventEvents();

  @override
  List<Object> get props => [];
}

final class DeleteCommonEventEvent extends CommonEventEvents {
  final EventEntity event;

  const DeleteCommonEventEvent(this.event);
}
