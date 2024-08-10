// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ibnt/src/app_imports.dart';

class MemberDto extends BaseUserEntity{
  MemberDto({
    required super.id,
    required super.fullName,
    required super.profileImage,
  });

  factory MemberDto.fromMap(Map<String, dynamic> map) {
    return MemberDto(
      id: map['id'] as String,
      fullName: map['fullName'] as String,
      profileImage: map['profileImage'] ?? "",
    );
  }
}
