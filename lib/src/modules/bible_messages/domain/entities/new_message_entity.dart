// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ibnt/src/modules/bible_messages/bible_messages_imports.dart';

class NewMessageEntity {
  String bibleVersion;
  String testment;
  String book;
  String? title;
  String? content;
  String? baseText;
  String? type;
  final String memberId;

  NewMessageEntity({
    this.bibleVersion = "",
    this.testment = "",
    this.book = "",
    this.title,
    this.content,
    this.baseText,
    this.type,
    required this.memberId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bibleVersion': bibleVersion,
      'testment': testment,
      'book': book,
      'title': title,
      'content': content,
      'baseText': baseText,
      'type': type,
      'memberId': memberId,
    };
  }

  factory NewMessageEntity.fromMap(Map<String, dynamic> map) {
    return NewMessageEntity(
      bibleVersion: map['bibleVersion'],
      testment: map['testment'],
      book: map['book'],
      title: map['title'],
      content: map['content'],
      baseText: map['baseText'],
      type: map['type'] == "created" ? BibleMessageType.created.name : BibleMessageType.generated.name,
      memberId: map['memberId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NewMessageEntity.fromJson(String source) => NewMessageEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  bool validMessage() {
    return bibleVersion.isNotEmpty && testment.isNotEmpty && book.isNotEmpty;
  }
}
