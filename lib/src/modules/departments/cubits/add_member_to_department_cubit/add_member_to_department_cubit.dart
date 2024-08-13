import 'package:app_ibnt/src/app_imports.dart';

class AddMemberToDepartmentCubit extends Cubit<List<DepartmentMember>> {
  AddMemberToDepartmentCubit(List<DepartmentMember> members) : super(members);

  bool addedMember(DepartmentMember member) {
    return state.any((m) => m.email == member.email);
  }

  void defineDepartmentsMembersList(DepartmentMember member) {
    if (addedMember(member)) {
      _removeDepartmentMember(member);
    } else {
      _addDepartmentMember(member);
    }
  }

  void _addDepartmentMember(DepartmentMember member) {
    List<DepartmentMember> members = [];
    members.addAll(state);
    members.add(member);
    emit(members);
  }

  void _removeDepartmentMember(DepartmentMember member) {
    List<DepartmentMember> members = [];
    members.addAll(state);
    members.removeWhere((m) => m.email == member.email);
    emit(members);
  }

  void filterMembers(String value, List<DepartmentMember> members) {
    List<DepartmentMember> filteredMembers = [];
    filteredMembers = members.where((member) {
      bool existingMember = member.fullName!.toLowerCase().contains(value.toLowerCase()) || member.email!.toLowerCase().contains(value.toLowerCase());
      return existingMember;
    }).toList();

    if (filteredMembers.isNotEmpty) {
      state.clear();
      emit(filteredMembers);
    } else {
      state.clear();
      emit([]);
    }
  }
}
