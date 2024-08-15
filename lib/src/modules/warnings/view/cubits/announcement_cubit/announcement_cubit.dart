import 'package:app_ibnt/src/modules/warnings/warnings_imports.dart';

class AnnouncementCubit extends Cubit<AnnouncementEntity?> {
  AnnouncementCubit() : super(null);

  bool loading = false;

  void loadAnnouncement(AnnouncementEntity announcement) {
    loading = true;
    state?.copyWith(announcement);
    loading = false;
    emit(state);
  }
}
