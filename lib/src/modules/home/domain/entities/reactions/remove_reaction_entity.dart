// ignore_for_file: public_member_api_docs, sort_constructors_first

class RemoveReactionEntity {
  final String memberId;
  final String itemId;

  RemoveReactionEntity(this.memberId, this.itemId);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'memberId': memberId,
      'itemId': itemId,
    };
  }
}
