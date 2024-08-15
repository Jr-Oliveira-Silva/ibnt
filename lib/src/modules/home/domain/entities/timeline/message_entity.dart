// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ibnt/src/modules/home/home_imports.dart';

class MessageEntity extends TimeLineContent {
  final String title;
  final String content;
  String? baseText;
  final BibleMessageType messageType;
  final MemberDto? member;

  MessageEntity({
    super.id,
    required this.title,
    required this.content,
    required this.messageType,
    this.baseText,
    this.member,
    super.type,
  }) {
    super.type = EntityType.message;
  }

  factory MessageEntity.fromMap(Map<String, dynamic> map) {
    return MessageEntity(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      baseText: map['baseText'] ?? "",
      messageType: map['type'] == "created" ? BibleMessageType.created : BibleMessageType.generated,
      member: MemberDto.fromMap(map['member']),
    );
  }
}
