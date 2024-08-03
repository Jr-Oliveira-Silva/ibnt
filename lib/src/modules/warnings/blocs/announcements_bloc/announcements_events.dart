// ignore_for_file: must_be_immutable

part of 'announcements_bloc.dart';

sealed class AnnouncementsEvents extends Equatable {
  const AnnouncementsEvents();

  @override
  List<Object> get props => [];
}

final class GetAllAnnouncementsEvent extends AnnouncementsEvents {}

final class DeleteAnnouncementEvent extends AnnouncementsEvents {
  AnnouncementEntity announcement;
  DeleteAnnouncementEvent(this.announcement);
}
