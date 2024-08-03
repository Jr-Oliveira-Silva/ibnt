// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ibnt/src/modules/home/home_imports.dart';

abstract class BaseUserEntity {
  String? id;
  String? email;
  String? fullName;
  String? profileImage;
  bool? departmentAssociation;
  AppUserCredential? userCredential;
  Credential? credential;
  UserRole? role;

  BaseUserEntity({
    this.id,
    this.email,
    this.fullName,
    this.profileImage,
    this.departmentAssociation = false,
    this.userCredential,
    this.credential,
    this.role,
  });
}
