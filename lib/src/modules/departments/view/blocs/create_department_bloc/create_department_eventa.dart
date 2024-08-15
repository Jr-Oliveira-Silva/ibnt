part of 'create_department_bloc.dart';

sealed class CreateDepartmentEvents extends Equatable {
  const CreateDepartmentEvents();

  @override
  List<Object> get props => [];
}

final class CreateDepartmentEvent extends CreateDepartmentEvents {
  final DepartmentEntity department;

  const CreateDepartmentEvent(this.department);
}
