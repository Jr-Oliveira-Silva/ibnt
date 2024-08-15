import 'package:app_ibnt/src/app_imports.dart';

part 'create_department_eventa.dart';
part 'create_department_statea.dart';

class CreateDepartmentBloc extends Bloc<CreateDepartmentEvents, CreateDepartmentStates> {
  CreateDepartmentBloc(this._repository) : super(CreateDepartmentInitialState()) {
    on<CreateDepartmentEvent>(_mapCreateDepartmentEventToState);
  }

  final IDepartmentsRepository _repository;

  Future<void> _mapCreateDepartmentEventToState(CreateDepartmentEvent event, Emitter<CreateDepartmentStates> state) async {
    state(CreateDepartmentLoadingState());
    final (exception, department) = await _repository.createDepartment(event.department);
    if (exception != null) {
      state(CreateDepartmentFailureState(exception.exception));
    } else {
      state(CreateDepartmentSuccessState(department!));
    }
  }
}
