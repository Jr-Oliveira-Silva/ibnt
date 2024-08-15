// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ibnt/src/app_imports.dart';

abstract class TimeLineContent {
  String? id;
  EntityType? type;

  TimeLineContent({
    this.id,
    this.type,
  });
}
