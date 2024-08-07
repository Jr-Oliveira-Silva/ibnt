// ignore_for_file: public_member_api_docs, sort_constructors_first

class MemberDto {
  final String id;
  final String fullName;
  final String profileImage;

  MemberDto({
    required this.id,
    required this.fullName,
    required this.profileImage,
  });

  factory MemberDto.fromMap(Map<String, dynamic> map) {
    return MemberDto(
      id: map['id'] as String,
      fullName: map['fullName'] as String,
      profileImage: map['profileImage'] ?? "",
    );
  }
}
