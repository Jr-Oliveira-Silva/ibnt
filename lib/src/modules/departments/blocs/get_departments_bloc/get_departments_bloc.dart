import 'package:app_ibnt/src/app_imports.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_departments_eventa.dart';
part 'get_departments_states.dart';

class GetDepartmentsBloc extends Bloc<GetDepartmentsEvents, GetDepartmentsStates> {
  GetDepartmentsBloc(this._repository) : super(GetDepartmentsInitialState()) {
    on<GetDepartmentsEvent>(_mapGetDepartmentsEventToState);
  }

  final IDepartmentsRepository _repository;

  Future<void> _mapGetDepartmentsEventToState(GetDepartmentsEvent event, Emitter<GetDepartmentsStates> state) async {
    state(GetDepartmentsLoadingState());
    final (exception, departments) = await _repository.getDepartments();
    if (exception != null) {
      state(GetDepartmentsFailureState(exception.exception));
    } else {
      state(GetDepartmentsSuccessState(departments!));
    }
  }
}
