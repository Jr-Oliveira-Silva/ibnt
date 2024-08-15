part of 'announcements_bloc.dart';

sealed class AnnouncementsStates extends Equatable {
  const AnnouncementsStates();

  @override
  List<Object> get props => [];
}

final class AnnouncementsInitialState extends AnnouncementsStates {}

final class AnnouncementsLoadingState extends AnnouncementsStates {}

final class AnnouncementsFailureState extends AnnouncementsStates {
  final String exception;

  const AnnouncementsFailureState(this.exception);
}

final class AnnouncementsSuccessState extends AnnouncementsStates {
  final List<AnnouncementEntity> announcements;

  const AnnouncementsSuccessState(this.announcements);
}

final class DeleteAnnouncementSuccessState extends AnnouncementsStates {}
