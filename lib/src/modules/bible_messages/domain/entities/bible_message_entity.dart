// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ibnt/src/modules/bible_messages/bible_messages_imports.dart';

class BibleMessageEntity {
  String? id;
  String title;
  String content;
  String baseText;
  String memberId;
  String? postDate;
  String? creationDate;
  String? creatorImage;
  BibleMessageType type;

  BibleMessageEntity({
    this.id,
    this.title = "",
    this.content = "",
    this.baseText = "",
    this.memberId = "",
    this.postDate,
    this.creationDate,
    this.creatorImage,
    this.type = BibleMessageType.created,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'content': content,
      'baseText': baseText,
      'memberId': memberId,
      'postDate': postDate,
      'creationDate': creationDate,
      'creatorImage': creatorImage,
      'type': type.name,
    };
  }

  factory BibleMessageEntity.fromMap(Map<String, dynamic> map) {
    return BibleMessageEntity(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      baseText: map['baseText'],
      memberId: map['memberId'],
      postDate: map['postDate'],
      type: map['type'] == "created" ? BibleMessageType.created : BibleMessageType.generated,
      creationDate: map['creationDate'],
      creatorImage: map['creatorImage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BibleMessageEntity.fromJson(String source) => BibleMessageEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
