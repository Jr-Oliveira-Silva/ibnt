import 'package:app_ibnt/src/modules/home/home_imports.dart';

class MemberEntity extends BaseUserEntity {
  MemberEntity({
    super.id,
    super.fullName,
    super.profileImage,
    super.departmentAssociation = false,
    super.userCredential,
    super.role
  });
}
