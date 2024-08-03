import 'package:app_ibnt/src/modules/warnings/warnings_imports.dart';

part 'create_announcement_events.dart';
part 'create_announcement_states.dart';

class CreateAnnouncementBloc extends Bloc<CreateAnnouncementEvents, CreateAnnouncementStates> {
  CreateAnnouncementBloc(this._repository) : super(CreateAnnouncementInitialState()) {
    on<CreateAnnouncementEvent>(_mapCreateAnnouncementEventToState);
    on<CreateAnnouncementsListEvent>(_mapCreateAnnouncementsListEventToState);
  }

  final IWarningsRepository _repository;
  Future<void> _mapCreateAnnouncementEventToState(CreateAnnouncementEvent event, Emitter<CreateAnnouncementStates> state) async {
    state(CreateAnnouncementLoadingState());
    final (exception, announcement) = await _repository.createAnnouncement(event.announcement);
    if (exception != null) {
      state(CreateAnnouncementFailureState(exception.exception));
    } else {
      state(CreateAnnouncementSuccessState(announcement!));
    }
  }

  Future<void> _mapCreateAnnouncementsListEventToState(CreateAnnouncementsListEvent event, Emitter<CreateAnnouncementStates> state) async {
    state(CreateAnnouncementLoadingState());
    final (exception) = await _repository.createAnnouncements(event.announcement);
    if (exception.$1 != null) {
      state(CreateAnnouncementFailureState(exception.$1!.exception));
    } else {
      state(const CreateAnnouncementsListSuccessState());
    }
  }
}
