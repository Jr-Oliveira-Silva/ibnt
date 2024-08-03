// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ibnt/src/modules/home/home_imports.dart';

class AppUserCredential {
  String? email;
  UserRole? role = UserRole.user;

  AppUserCredential({this.email, this.role});
}
