import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class BibleMessageReactionResponse {
  String name;
  String bibleMessageId;
  String memberId;
  bool toggled;

  BibleMessageReactionResponse({
    required this.name,
    required this.bibleMessageId,
    required this.memberId,
    this.toggled = false,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'bibleMessageId': bibleMessageId,
      'memberId': memberId,
      'toggled': toggled,
    };
  }

  factory BibleMessageReactionResponse.fromMap(Map<String, dynamic> map) {
    return BibleMessageReactionResponse(
      name: map['name'] as String,
      bibleMessageId: map['bibleMessageId'] as String,
      memberId: map['memberId'] as String,
      toggled: map['toggled'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory BibleMessageReactionResponse.fromJson(String source) => BibleMessageReactionResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
