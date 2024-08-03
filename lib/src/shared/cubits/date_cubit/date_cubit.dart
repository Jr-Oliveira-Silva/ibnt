import 'package:app_ibnt/src/modules/warnings/warnings_imports.dart';

class DateCubit extends Cubit<DateModel> {
  DateCubit() : super(DateModel());

  bool loading = false;
  void changeAnnouncementDate(int day) {
    final date = DateTime.now();
    final newDate = DateModel(
      day: day,
      month: date.month,
      year: date.year,
    );
    loading = true;
    state.day = day;
    emit(newDate);
    loading = false;
  }
}
