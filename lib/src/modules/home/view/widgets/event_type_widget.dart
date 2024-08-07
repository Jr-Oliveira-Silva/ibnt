// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:app_ibnt/src/modules/home/home_imports.dart';

class EventTypeWidget extends StatelessWidget {
  EventTypeWidget({
    Key? key,
    required this.event,
    this.reactions,
    this.enableSimpleView = false,
  }) : super(key: key);

  final EventEntity event;
  bool enableSimpleView;
  EventReactionsWidget? reactions;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    const radius = 5.0;
    final widgetHeight = height * 0.51;
    final verticalPadding = height * 0.009;
    final eventNameFontSize = height * 0.025;
    final eventDateFontSize = height * 0.017;
    final eventContentFontSize = height * 0.019;
    
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Modular.to.pushNamed('./event', arguments: event);
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
                          image: NetworkImage(event.imageUrlPath()),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  enableSimpleView ? SizedBox(height: height * 0.02) : Container(),
                  enableSimpleView
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
                                event.eventDate(),
                                style: TextStyle(fontSize: eventDateFontSize),
                              ),
                            ],
                          ),
                        ),
                  Padding(
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
        enableSimpleView ? Container() : reactions ?? Container(),
      ],
    );
  }
}
