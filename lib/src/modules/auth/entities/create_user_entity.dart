// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ibnt/src/modules/auth/auth_imports.dart';

class CreateUserEntity {
  String fullName;
  String? profileImage;
  Credential credential;

  CreateUserEntity({required this.fullName, required this.credential, this.profileImage});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'fullName': fullName, 'profileImage': profileImage, 'credential': credential.toMap()};
  }

  factory CreateUserEntity.fromMap(Map<String, dynamic> map) {
    return CreateUserEntity(
      fullName: map['fullName'] as String,
      profileImage: map['profileImage'] != null ? map['profileImage'] as String : null,
      credential: Credential.fromMap(map['credential'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateUserEntity.fromJson(String source) => CreateUserEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
