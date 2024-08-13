import 'package:app_ibnt/src/app_imports.dart';

class DepartmentMember extends BaseUserEntity {
  DepartmentMember({
    required super.id,
    required super.fullName,
    required super.email,
    required super.profileImage,
  });

  factory DepartmentMember.fromMap(Map<String, dynamic> map) {
    return DepartmentMember(
      id: map["id"],
      fullName: map["fullName"],
      email: map["credential"]["email"],
      profileImage: map["profileImage"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": super.id,
      "fullName": super.fullName,
      "email": super.email,
      "profileImage": super.profileImage,
    };
  }

  Map<String, dynamic> createDepartmentMap() {
    return {
      "id": super.id,
      "fullName": fullName,
      "email": email,
    };
  }
}
