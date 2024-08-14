import 'package:app_ibnt/src/app_imports.dart';

class DepartmentMembersCubit extends Cubit<List<DepartmentMember>> {
  DepartmentMembersCubit() : super([]);
  List<DepartmentMember> departmentMembers = [];

  void fillDepartmentMembersList(List<DepartmentMember> members) {
    departmentMembers = members;
    emit(departmentMembers);
  }

  void filterMembers(String value, List<DepartmentMember> members) {
    List<DepartmentMember> filteredMembers = [];
    filteredMembers = members.where((member) {
      bool existingMember = member.fullName!.toLowerCase().contains(value.toLowerCase()) || //
          member.email!.toLowerCase().contains(value.toLowerCase());
      return existingMember;
    }).toList();

    if (filteredMembers.isNotEmpty) {
      emit(filteredMembers);
    } else {
      emit([]);
    }
    if (value.isEmpty) {
      emit(departmentMembers);
    }
  }
}
