part of 'remove_member_from_department_bloc.dart';

sealed class RemoveMemberFromDepartmentStates extends Equatable {
  const RemoveMemberFromDepartmentStates();

  @override
  List<Object> get props => [];
}

final class RemoveMemberFromDepartmentInitialState extends RemoveMemberFromDepartmentStates {}

final class RemoveMemberFromDepartmentLoadingState extends RemoveMemberFromDepartmentStates {}

final class RemoveMemberFromDepartmentFailureState extends RemoveMemberFromDepartmentStates {
  final String message;

  const RemoveMemberFromDepartmentFailureState(this.message);
}

final class RemoveMemberFromDepartmentSuccessState extends RemoveMemberFromDepartmentStates {}
