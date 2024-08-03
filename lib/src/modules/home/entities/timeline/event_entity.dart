// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ibnt/src/modules/home/home_imports.dart';

class EventEntity extends TimeLineContent {
  String? title;
  String? imageUrl;
  String? postDate;
  String? date;
  String? description;

  EventEntity({
    super.id,
    this.title,
    this.imageUrl,
    this.postDate,
    this.date,
    this.description,
    super.type
  }) {
    super.type = EntityType.event;
    imageUrl = "https://images.pexels.com/photos/2351722/pexels-photo-2351722.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2";
  }

  factory EventEntity.fromMap(Map<String, dynamic> map) {
    return EventEntity(
      id:map["id"],
      title: map['title'] != null ? map['title'] as String : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      postDate: map['postDate'] != null ? map['postDate'] as String : null,
      date: map['date'] != null ? map['date'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
    );
  }
}
