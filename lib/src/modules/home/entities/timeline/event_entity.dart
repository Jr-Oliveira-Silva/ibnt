// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ibnt/src/modules/home/home_imports.dart';

class EventEntity extends TimeLineContent {
  String? title;
  String? imageUrl;
  File? imageField;
  String? postDate;
  String? date;
  String? description;

  EventEntity({super.id, this.title, this.imageUrl, this.imageField, this.postDate, this.date, this.description, super.type}) {
    super.type = EntityType.event;
  }

  factory EventEntity.fromMap(Map<String, dynamic> map) {
    return EventEntity(
      id: map["id"],
      title: map['title'] != null ? map['title'] as String : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      postDate: map['postDate'] != null ? map['postDate'] as String : null,
      date: map['date'] != null ? map['date'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "postDate": postDate,
      "date": date,
      "imageField": imageField,
      "description": description,
    };
  }
}
