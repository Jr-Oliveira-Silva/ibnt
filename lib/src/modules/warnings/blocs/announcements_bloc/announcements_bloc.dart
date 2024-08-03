import 'package:app_ibnt/src/modules/warnings/warnings_imports.dart';

part 'announcements_events.dart';
part 'announcements_states.dart';

class AnnouncementsBloc extends Bloc<AnnouncementsEvents, AnnouncementsStates> {
  AnnouncementsBloc(this._repository) : super(AnnouncementsInitialState()) {
    on<GetAllAnnouncementsEvent>(_mapGetAllAnnouncementsEventToState);
    on<DeleteAnnouncementEvent>(_mapDeleteAnnouncementEventToState);
  }
  final IWarningsRepository _repository;

  Future<void> _mapGetAllAnnouncementsEventToState(GetAllAnnouncementsEvent event, Emitter<AnnouncementsStates> state) async {
    state(AnnouncementsLoadingState());
    final (exception, announcements) = await _repository.getAnnouncements();
    if (exception != null) {
      state(AnnouncementsFailureState(exception.exception));
    } else {
      state(AnnouncementsSuccessState(announcements));
    }
  }

  Future<void> _mapDeleteAnnouncementEventToState(DeleteAnnouncementEvent event, Emitter<AnnouncementsStates> state) async {
    state(AnnouncementsLoadingState());
    final (exception) = await _repository.deleteAnnouncement(event.announcement);
    if (exception.$1 != null) {
      state(AnnouncementsFailureState(exception.$1!.exception));
    } else {
      state(DeleteAnnouncementSuccessState());
    }
  }
}
