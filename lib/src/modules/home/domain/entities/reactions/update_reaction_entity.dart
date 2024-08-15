// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ibnt/src/modules/home/home_imports.dart';

class UpdateReactionEntity {
  final String name;
  final String memberId;
  final String itemId;
  EntityType type;

  UpdateReactionEntity(
    this.name,
    this.memberId,
    this.itemId,
    this.type,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'memberId': memberId,
      'itemId': itemId,
    };
  }
}
