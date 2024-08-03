// ignore_for_file: constant_identifier_names

import '../shared_imports.dart';

List<int> getMonthDays(int selectedMonth) {
  final date = DateTime.now();
  List<int> month = [];
  var monthSize = getTotalDaysInCurrentMonth(selectedMonth);
  for (var i = 0; i < monthSize; i++) {
    month.add(i + 1);
  }
  var dayInWeekIndex = DateTime(date.year, selectedMonth).weekday + 1;
  for (var i = 1; i < dayInWeekIndex; i++) {
    month.insert(0, 0);
  }
  return month;
}

int getTotalDaysInCurrentMonth(int referenceMonth) {
  final date = DateTime.now();
  int daysInMonth = DateTimeRange(
    start: DateTime(date.year, referenceMonth),
    end: DateTime(date.year, referenceMonth + 1),
  ).duration.inDays;
  return daysInMonth;
}

String getMonthName(int month) {
  String monthName = "";
  switch (month) {
    case 1:
      monthName = MonthName.Janeiro.name;
      break;
    case 2:
      monthName = MonthName.Fevereiro.name;
      break;
    case 3:
      monthName = MonthName.Marco.name.replaceAll("c", "ç");
      break;
    case 4:
      monthName = MonthName.Abril.name;
      break;
    case 5:
      monthName = MonthName.Maio.name;
      break;
    case 6:
      monthName = MonthName.Junho.name;
      break;
    case 7:
      monthName = MonthName.Julho.name;
      break;
    case 8:
      monthName = MonthName.Agosto.name;
      break;
    case 9:
      monthName = MonthName.Setembro.name;
      break;
    case 10:
      monthName = MonthName.Outubro.name;
      break;
    case 11:
      monthName = MonthName.Novembro.name;
      break;
    case 12:
      monthName = MonthName.Dezembro.name;
      break;

    default:
      monthName = "";
  }
  return monthName;
}

String getWeekdayName(int weekDay) {
  String weekDayName = "";
  switch (weekDay) {
    case 1:
      weekDayName = DaysOfWeek.Seg.weekName;
      break;
    case 2:
      weekDayName = DaysOfWeek.Ter.weekName;
      break;
    case 3:
      weekDayName = DaysOfWeek.Qua.weekName;
      break;
    case 4:
      weekDayName = DaysOfWeek.Qui.weekName;
      break;
    case 5:
      weekDayName = DaysOfWeek.Sex.weekName;
      break;
    case 6:
      weekDayName = DaysOfWeek.Sab.weekName;
      break;
    case 7:
      weekDayName = DaysOfWeek.Dom.weekName;
      break;

    default:
      weekDayName = "";
  }
  return weekDayName;
}

enum DaysOfWeek {
  Dom(weekName: "Domingo"),
  Seg(weekName: "Segunda - feira"),
  Ter(weekName: "Terça - feira"),
  Qua(weekName: "Quarta - feira"),
  Qui(weekName: "Quinta - feira"),
  Sex(weekName: "Sexta - feira"),
  Sab(weekName: "Sábado");

  final String weekName;
  const DaysOfWeek({required this.weekName});
}

enum MonthName {
  Janeiro,
  Fevereiro,
  Marco,
  Abril,
  Maio,
  Junho,
  Julho,
  Agosto,
  Setembro,
  Outubro,
  Novembro,
  Dezembro;
}
