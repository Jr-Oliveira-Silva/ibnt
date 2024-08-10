// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ibnt/src/app_imports.dart';

part 'remove_member_from_department_events.dart';
part 'remove_member_from_department_states.dart';

class RemoveMemberFromDepartmentBloc extends Bloc<RemoveMemberFromDepartmentEvents, RemoveMemberFromDepartmentStates> {
  RemoveMemberFromDepartmentBloc(this._repository) : super(RemoveMemberFromDepartmentInitialState()) {
    on<RemoveMemberFromDepartmentEvent>(_mapRemoveMemberFromDepartmentEventToState);
  }
  final IDepartmentsRepository _repository;

  Future<void> _mapRemoveMemberFromDepartmentEventToState(RemoveMemberFromDepartmentEvent event, Emitter<RemoveMemberFromDepartmentStates> state) async {
    state(RemoveMemberFromDepartmentLoadingState());
    final (exception, _) = await _repository.removeMemberFromDepartment(event.department, event.member);
    if (exception != null) {
      state(RemoveMemberFromDepartmentFailureState(exception.exception));
    } else {
      state(RemoveMemberFromDepartmentSuccessState());
    }
  }
}
