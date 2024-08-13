// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ibnt/src/app_imports.dart';

class DepartmentEntity {
  String? id;
  String? title;
  List<DepartmentMember>? members;

  DepartmentEntity({
    this.id,
    this.title,
    this.members,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'members': members,
    };
  }

  Map<String, dynamic> createMap() {
    List<Map<String, dynamic>> departmentMembers = members!.isNotEmpty
        ? //
        members!.map((member) => member.createDepartmentMap()).toList()
        : [];
    return <String, dynamic>{
      'title': title,
      'members': departmentMembers,
    };
  }

  factory DepartmentEntity.fromMap(Map<String, dynamic> map) {
    List<DepartmentMember> members = [];
    final mapsList = map['members'] as List;
    for (var i = 0; i < mapsList.length; i++) {
      final json = mapsList[i];
      final member = DepartmentMember.fromMap(json);
      members.add(member);
    }
    return DepartmentEntity(
      id: map['id'],
      title: map['title'],
      members: members,
    );
  }
}
