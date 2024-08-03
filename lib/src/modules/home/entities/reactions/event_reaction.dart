// ignore_for_file: public_member_api_docs, sort_constructors_first

class EventReaction {
  String name;
  final String memberId;
  final String eventId;

  EventReaction({required this.name, required this.memberId, required this.eventId});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'memberId': memberId,
      'itemId': eventId,
    };
  }
}
