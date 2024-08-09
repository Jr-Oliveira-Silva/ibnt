part of 'remove_department_bloc.dart';

sealed class RemoveDepartmentStates extends Equatable {
  const RemoveDepartmentStates();

  @override
  List<Object> get props => [];
}

final class RemoveDepartmentInitialState extends RemoveDepartmentStates {}

final class RemoveDepartmentLoadingState extends RemoveDepartmentStates {}

final class RemoveDepartmentFailureState extends RemoveDepartmentStates {
  final String message;

  RemoveDepartmentFailureState(this.message);
}

final class RemoveDepartmentSuccessState extends RemoveDepartmentStates {}
