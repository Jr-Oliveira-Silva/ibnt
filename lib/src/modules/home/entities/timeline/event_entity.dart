// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ibnt/src/modules/home/home_imports.dart';

class EventEntity extends TimeLineContent {
  String? title;
  String? imageUrl;
  XFile? imageField;
  String? postDate;
  String? date;
  String? description;

  EventEntity({super.id, this.title, this.imageUrl, this.imageField, this.postDate, this.date, this.description, super.type}) {
    super.type = EntityType.event;
  }

  factory EventEntity.fromMap(Map<String, dynamic> map) {
    return EventEntity(
      id: map["id"],
      title: map['title'],
      imageUrl: map['imageUrl'],
      postDate: map['postDate'],
      date: map['date'],
      description: map['description'],
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

  String imageUrlPath() => "$API_IMAGE_URL$imageUrl";

  String eventDate() {
    final dateSection = date?.split("T").first;
    final eventDay = int.parse(dateSection!.split("-").last);
    final eventMonth = int.parse(dateSection.split("-")[1]);
    final eventYear = int.parse(dateSection.split("-").first);

    return "$eventDay/$eventMonth/$eventYear";
  }
}
