part of 'common_event_bloc.dart';

sealed class CommonEventEvents extends Equatable {
  const CommonEventEvents();

  @override
  List<Object> get props => [];
}

final class ShareInTimelineEvent extends CommonEventEvents {
  final EventEntity event;

  const ShareInTimelineEvent(this.event);
}

final class RemoveFromTimelineEvent extends CommonEventEvents {
  final EventEntity event;

  const RemoveFromTimelineEvent(this.event);
}

final class DeleteCommonEventEvent extends CommonEventEvents {
  final EventEntity event;

  const DeleteCommonEventEvent(this.event);
}
