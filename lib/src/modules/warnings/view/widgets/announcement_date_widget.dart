// ignore_for_file: must_be_immutable

import 'package:app_ibnt/src/modules/warnings/warnings_imports.dart';

class AnnouncementDateWidget extends StatelessWidget {
  AnnouncementDateWidget({required this.announcement, super.key});

  AnnouncementEntity announcement;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AnnouncementCubit>();
    if (!cubit.isClosed) {
      cubit.loadAnnouncement(announcement);
    }
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final weekDayContainerHeight = height * 0.06;
    final monthDayContainerSize = height * 0.05;
    final labelFontSize = height * 0.03;
    final monthDayFontSize = height * 0.025;
    final currentDay = announcement.dateString.split("/")[1];
    final currentMonth = int.parse(announcement.dateString.split("/").first);
    final currentYear = announcement.dateString.split("/").last;
    final list = getMonthDays(currentMonth);

    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        if (cubit.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        return SizedBox(
          height: height * 0.45,
          width: width,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$currentDay-$currentMonth-$currentYear",
                    style: TextStyle(
                      fontSize: labelFontSize,
                    ),
                  ),
                  Text(
                    getMonthName(currentMonth),
                    style: TextStyle(
                      fontSize: labelFontSize,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.025),
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: width,
                  child: Column(
                    children: [
                      Row(
                        children: DaysOfWeek.values
                            .map(
                              (day) => Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppThemes.primaryColor1,
                                  ),
                                  height: weekDayContainerHeight,
                                  child: Center(
                                    child: Text(
                                      day.name,
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      SizedBox(height: height * 0.001),
                      Expanded(
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: list.length,
                          semanticChildCount: list.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: DaysOfWeek.values.length,
                            mainAxisExtent: monthDayContainerSize,
                            mainAxisSpacing: 2,
                          ),
                          itemBuilder: (_, i) {
                            var monthDay = list[i];
                            final selectedDay = int.parse(currentDay) == monthDay;
                            return Container(
                              decoration: BoxDecoration(
                                color: selectedDay ? AppThemes.primaryColor1 : Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                border: monthDay == 0
                                    ? null
                                    : Border.all(
                                        color: AppThemes.primaryColor1,
                                      ),
                              ),
                              child: Center(
                                child: Text(
                                  monthDay == 0 ? "" : "$monthDay",
                                  style: TextStyle(
                                    color: selectedDay ? Colors.white : AppThemes.primaryColor1,
                                    fontWeight: FontWeight.w400,
                                    fontSize: monthDayFontSize,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
