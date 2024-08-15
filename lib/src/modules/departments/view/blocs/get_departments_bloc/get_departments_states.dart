part of 'get_departments_bloc.dart';

sealed class GetDepartmentsStates extends Equatable {
  const GetDepartmentsStates();

  @override
  List<Object> get props => [];
}

final class GetDepartmentsInitialState extends GetDepartmentsStates {}

final class GetDepartmentsLoadingState extends GetDepartmentsStates {}

final class GetDepartmentsFailureState extends GetDepartmentsStates {
  final String message;

  const GetDepartmentsFailureState(this.message);
}

final class GetDepartmentsSuccessState extends GetDepartmentsStates {
  final List<DepartmentEntity> departments;

  const GetDepartmentsSuccessState(this.departments);
}
