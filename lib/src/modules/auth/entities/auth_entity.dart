// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ibnt/src/modules/auth/auth_imports.dart';

class Credential {
  String email;
  String password;
  UserRole role;

  Credential({required this.email, required this.password, this.role = UserRole.user});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'email': email, 'password': password, 'role': role == UserRole.user ? "user" : "admin"};
  }

  factory Credential.fromMap(Map<String, dynamic> map) {
    return Credential(email: map['email'] as String, password: map['password'] as String, role: map["role"] == "user" ? UserRole.user : UserRole.admin);
  }

  String  toJson() => json.encode(toMap());

  factory Credential.fromJson(String source) => Credential.fromMap(json.decode(source) as Map<String, dynamic>);
}
