part of 'create_announcement_bloc.dart';

sealed class CreateAnnouncementStates extends Equatable {
  const CreateAnnouncementStates();

  @override
  List<Object> get props => [];
}

final class CreateAnnouncementInitialState extends CreateAnnouncementStates {}

final class CreateAnnouncementLoadingState extends CreateAnnouncementStates {}

final class CreateAnnouncementFailureState extends CreateAnnouncementStates {
  final String exception;

  const CreateAnnouncementFailureState(this.exception);
}

final class CreateAnnouncementSuccessState extends CreateAnnouncementStates {
  final AnnouncementEntity announcement;

  const CreateAnnouncementSuccessState(this.announcement);
}

final class CreateAnnouncementsListSuccessState extends CreateAnnouncementStates {

  const CreateAnnouncementsListSuccessState();
}
