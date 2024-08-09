// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ibnt/src/app_imports.dart';

part 'remove_department_events.dart';
part 'remove_department_states.dart';

class RemoveDepartmentBloc extends Bloc<RemoveDepartmentEvents, RemoveDepartmentStates> {
  RemoveDepartmentBloc(this._repository) : super(RemoveDepartmentInitialState()) {
    on<RemoveDepartmentEvent>(_mapRemoveDepartmentEventToState);
  }

  final IDepartmentsRepository _repository;

  Future<void> _mapRemoveDepartmentEventToState(RemoveDepartmentEvent event, Emitter<RemoveDepartmentStates> state) async {
    state(RemoveDepartmentLoadingState());
    final (exception, _) = await _repository.removeDepartment(event.department);
    if (exception != null) {
      state(RemoveDepartmentFailureState(exception.exception));
    } else {
      state(RemoveDepartmentSuccessState());
    }
  }
}
