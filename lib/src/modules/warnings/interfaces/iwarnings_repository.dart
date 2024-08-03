import 'package:app_ibnt/src/modules/warnings/warnings_imports.dart';

abstract class IWarningsRepository {
  Future<(WarningException?, AnnouncementEntity?)> createAnnouncement(AnnouncementEntity announcement);
  Future<(WarningException?, void)> createAnnouncements(AnnouncementEntity announcement);
  Future<(WarningException?, List<AnnouncementEntity>)> getAnnouncements();
  Future<(WarningException?, void)> deleteAnnouncement(AnnouncementEntity announcement);
}
