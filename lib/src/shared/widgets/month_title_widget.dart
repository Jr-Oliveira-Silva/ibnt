// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ibnt/src/modules/warnings/warnings_imports.dart';

class MonthTitleWidget extends StatelessWidget {
  const MonthTitleWidget({Key? key, required this.month}) : super(key: key);

  final int month;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final announcementFontSize = height * 0.02;
    final monthFontSize = height * 0.04;
    final monthComponentPadding = height * 0.02;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: monthComponentPadding),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Avisos",
              style: TextStyle(
                fontSize: announcementFontSize,
              ),
            ),
            Text(
              getMonthName(month),
              style: TextStyle(
                fontSize: monthFontSize,
                fontFamily: "Karma",
                color: AppThemes.primaryColor1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}