part of 'create_announcement_bloc.dart';

sealed class CreateAnnouncementEvents extends Equatable {
  const CreateAnnouncementEvents();

  @override
  List<Object> get props => [];
}

final class CreateAnnouncementEvent extends CreateAnnouncementEvents {
  final AnnouncementEntity announcement;

  const CreateAnnouncementEvent(this.announcement);
}

final class CreateAnnouncementsListEvent extends CreateAnnouncementEvents {
  final AnnouncementEntity announcement;

  const CreateAnnouncementsListEvent(this.announcement);
}
