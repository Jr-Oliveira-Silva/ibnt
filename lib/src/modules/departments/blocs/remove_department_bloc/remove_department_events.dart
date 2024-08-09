part of 'remove_department_bloc.dart';

sealed class RemoveDepartmentEvents extends Equatable {
  const RemoveDepartmentEvents();

  @override
  List<Object> get props => [];
}

final class RemoveDepartmentEvent extends RemoveDepartmentEvents {
  final DepartmentEntity department;

  const RemoveDepartmentEvent(this.department);
}
