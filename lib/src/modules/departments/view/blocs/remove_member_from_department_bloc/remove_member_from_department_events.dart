part of 'remove_member_from_department_bloc.dart';

sealed class RemoveMemberFromDepartmentEvents extends Equatable {
  const RemoveMemberFromDepartmentEvents();

  @override
  List<Object> get props => [];
}

final class RemoveMemberFromDepartmentEvent extends RemoveMemberFromDepartmentEvents {
  final DepartmentEntity department;
  final DepartmentMember member;

  const RemoveMemberFromDepartmentEvent(this.department, this.member);
}
