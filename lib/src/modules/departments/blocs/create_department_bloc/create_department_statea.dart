part of 'create_department_bloc.dart';

sealed class CreateDepartmentStates extends Equatable {
  const CreateDepartmentStates();

  @override
  List<Object> get props => [];
}

final class CreateDepartmentInitialState extends CreateDepartmentStates {}

final class CreateDepartmentLoadingState extends CreateDepartmentStates {}

final class CreateDepartmentFailureState extends CreateDepartmentStates {
  final String message;

  const CreateDepartmentFailureState(this.message);
}

final class CreateDepartmentSuccessState extends CreateDepartmentStates {
  final DepartmentEntity department;

  const CreateDepartmentSuccessState(this.department);
}
