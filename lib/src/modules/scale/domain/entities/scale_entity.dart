import 'package:app_ibnt/src/app_imports.dart';

class ScaleEntity {
  final String id;
  final String title;
  final ScaleEventEntity scaleEvent;
  final List<ScaleUser> scaleUsers;

  ScaleEntity(
    this.id,
    this.title,
    this.scaleEvent,
    this.scaleUsers,
  );
}
