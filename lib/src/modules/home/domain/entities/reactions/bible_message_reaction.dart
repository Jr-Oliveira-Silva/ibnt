// ignore_for_file: public_member_api_docs, sort_constructors_first

class BibleMessageReaction {
  String name;
  String memberId;
  String bibleMessageId;
  bool toggled;

  BibleMessageReaction({required this.name, required this.memberId, required this.bibleMessageId, this.toggled = false});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'memberId': memberId,
      'itemId': bibleMessageId,
    };
  }
}
