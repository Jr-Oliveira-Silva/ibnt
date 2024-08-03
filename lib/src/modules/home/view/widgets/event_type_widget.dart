// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:app_ibnt/src/modules/home/home_imports.dart';
import 'package:app_ibnt/src/modules/home/view/widgets/event_reactions_widget.dart';

class EventTypeWidget extends StatelessWidget {
  EventTypeWidget({
    Key? key,
    required this.memberId,
    required this.event,
    this.editable = false,
  }) : super(key: key);

  final EventEntity event;
  final String memberId;
  bool editable = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    const radius = 5.0;
    final widgetHeight = editable ? height * 0.45 : height * 0.51;
    final verticalPadding = height * 0.009;
    final iconSize = height * 0.04;
    final eventNameFontSize = height * 0.025;
    final eventDateFontSize = height * 0.017;
    final eventContentFontSize = height * 0.019;
    double stackOutlineMeasure = -10;
    String? eventDate = event.date?.split("T").first;
    final eventSplitDateList = eventDate?.split("-");
    final dateYear = eventSplitDateList?[0];
    final dateMonth = eventSplitDateList?[1];
    final dateDay = eventSplitDateList?[2];
    eventDate = "$dateDay - $dateMonth - $dateYear";
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Modular.to.pushNamed('./event');
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: SizedBox(
              height: widgetHeight,
              width: width,
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(radius),
                        image: DecorationImage(
                          image: NetworkImage(event.imageUrl ?? ""),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  editable ? SizedBox(height: height * 0.02) : Container(),
                  editable
                      ? Container()
                      : Padding(
                          padding: EdgeInsets.symmetric(vertical: verticalPadding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Text(
                                  event.title ?? "",
                                  style: TextStyle(fontSize: eventNameFontSize),
                                ),
                              ),
                              SizedBox(width: width * 0.02),
                              Text(
                                eventDate,
                                style: TextStyle(fontSize: eventDateFontSize),
                              ),
                            ],
                          ),
                        ),
                  editable
                      ? Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: verticalPadding),
                              child: Text(
                                event.description ?? "",
                                style: TextStyle(fontSize: eventContentFontSize),
                              ),
                            ),
                            Positioned(
                              top: stackOutlineMeasure,
                              right: stackOutlineMeasure,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.edit_note,
                                  size: iconSize,
                                  color: AppThemes.primaryColor1,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Padding(
                          padding: EdgeInsets.symmetric(vertical: verticalPadding),
                          child: Text(
                            event.description ?? "",
                            style: TextStyle(fontSize: eventContentFontSize),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
        editable
            ? Container()
            : EventReactionsWidget(
                eventReaction: EventReaction(
                  name: "",
                  memberId: memberId,
                  eventId: event.id!,
                ),
              ),
      ],
    );
  }
}
