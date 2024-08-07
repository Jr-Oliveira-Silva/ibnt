import 'package:app_ibnt/src/app_imports.dart';

class DepartmentMember extends BaseUserEntity {
  DepartmentMember({
    required super.id,
    required super.fullName,
    required super.profileImage,
  });
  factory DepartmentMember.fromMap(Map<String, dynamic> map) {
    return DepartmentMember(
      id: map["id"],
      fullName: map["fullName"],
      profileImage: map["profileImage"],
    );
  }
}
