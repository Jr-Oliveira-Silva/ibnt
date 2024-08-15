// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ibnt/src/modules/warnings/warnings_imports.dart';

class AnnouncementEntity {
  String id;
  String title;
  String memberId;
  String description;
  String dateString;
  int announcementDay;
  int announcementMonth;
  bool fixedWarning;

  AnnouncementEntity({
    required this.id,
    required this.title,
    required this.memberId,
    required this.description,
    required this.dateString,
    required this.fixedWarning,
    this.announcementDay = 0,
    this.announcementMonth = 0,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'memberId': memberId,
      'description': description,
      'dateString': dateString,
      'fixedWarning': fixedWarning,
    };
  }

  Map<String, dynamic> creationMap() {
    return <String, dynamic>{
      'title': title,
      'memberId': memberId,
      'description': description,
      'dateString': dateString,
    };
  }

  factory AnnouncementEntity.fromMap(Map<String, dynamic> map) {
    return AnnouncementEntity(
      id: map['id'],
      title: map['title'],
      memberId: map['memberId'],
      description: map['description'],
      dateString: map['dateString'].split(" ").first,
      fixedWarning: map['fixedWarning'],
    );
  }

  String setAnnouncementWeekDay(String date) {
    final day = int.parse(date.split("/")[1]);
    final month = int.parse(date.split("/")[0]);
    final year = int.parse(date.split("/")[2]);
    final currentDate = DateTime(year, month, day);
    return getWeekdayName(currentDate.weekday);
  }

  int setAnnouncementMonth(String date) {
    int month = int.parse(date.split('/')[0]);
    return month;
  }

  AnnouncementEntity copyWith(AnnouncementEntity copy) {
    return AnnouncementEntity(
      id: copy.id,
      title: copy.title,
      memberId: copy.memberId,
      description: copy.description,
      dateString: copy.dateString,
      fixedWarning: copy.fixedWarning,
    );
  }
}
