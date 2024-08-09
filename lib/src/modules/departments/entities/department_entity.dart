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
    return <String, dynamic>{
      'title': title,
    };
  }

  factory DepartmentEntity.fromMap(Map<String, dynamic> map) {
    final mapsList = map['members'] as List;
    final List<DepartmentMember> members = mapsList.map((member) => DepartmentMember.fromMap(member)).toList();
    return DepartmentEntity(
      id: map['id'],
      title: map['title'],
      members: members,
    );
  }
}
