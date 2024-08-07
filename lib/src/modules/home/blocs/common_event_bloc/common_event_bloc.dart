// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ibnt/src/app_imports.dart';

part 'common_event_events.dart';
part 'common_event_states.dart';

class CommonEventBloc extends Bloc<CommonEventEvents, CommonEventStates> {
  CommonEventBloc(
    this._repository,
  ) : super(CommonEventInitialState()) {
    on<DeleteCommonEventEvent>(_mapDeleteCommonEventEvent);
    on<ShareInTimelineEvent>(_mapShareInTimelineEvent);
    on<RemoveFromTimelineEvent>(_mapRemoveFromTimelineEvent);
  }

  final IHomeRepository _repository;

  _mapShareInTimelineEvent(ShareInTimelineEvent event, Emitter<CommonEventStates> state) async {
    state(EventLoadingState());
    final (exception, _) = await _repository.postEventInTimeline(event.event.id!);
    if (exception != null) {
      state(EventFailureState(exception.exception));
    } else {
      state(ShareEventSuccessState());
    }
  }

  _mapRemoveFromTimelineEvent(RemoveFromTimelineEvent event, Emitter<CommonEventStates> state) async {
    state(EventLoadingState());
    final (exception, _) = await _repository.removeEventFromTimeline(event.event.id!);
    if (exception != null) {
      state(EventFailureState(exception.exception));
    } else {
      state(RemoveFromTimelineSuccessState());
    }
  }

  _mapDeleteCommonEventEvent(DeleteCommonEventEvent event, Emitter<CommonEventStates> state) async {
    state(EventLoadingState());
    final (exception, _) = await _repository.deleteEvent(event.event.id!);
    if (exception != null) {
      state(EventFailureState(exception.exception));
    } else {
      state(DeleteEventSuccessState());
    }
  }
}
