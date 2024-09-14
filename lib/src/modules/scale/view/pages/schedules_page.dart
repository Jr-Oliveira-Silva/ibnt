import 'package:app_ibnt/src/modules/scale/scale_imports.dart';

class SchedulesPage extends StatefulWidget {
  const SchedulesPage({super.key});

  @override
  State<SchedulesPage> createState() => SchedulesPageState();
}

class SchedulesPageState extends State<SchedulesPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final titleFontSize = height * 0.035;
    final pagePadding = width * 0.035;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        preferredSize: Size(width, height * 0.08),
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: pagePadding),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Escalas",
                  style: TextStyle(
                    fontSize: titleFontSize,
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),

            ],
          ),
        ),
      ), /*BlocBuilder(
        bloc: userBloc,
        builder: (context, userState) {
          if (userState is GetUserLoadingUserState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (userState is GetUserSuccessState) {
            return SizedBox(
              height: height,
              width: width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: pagePadding),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Início",
                        style: TextStyle(
                          fontSize: titleFontSize,
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    BlocBuilder(
                      bloc: homeBloc,
                      builder: (context, state) {
                        if (state is HomeLoadingState) {
                          return const Expanded(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ));
                        }
                        if (state is HomeFailureState) {
                          return const Center(
                            child: TransparentLogoWidget(),
                          );
                        }
                        if (state is HomeSuccessState) {
                          final timeLine = state.timelineEntity.timeline;
                          return timeLine.isNotEmpty
                              ? Expanded(
                            child: RefreshIndicator(
                              onRefresh: () async {
                                homeBloc.add(FetchTimelineEvent());
                                eventsReactionsBloc
                                    .add(FetchEventsReactionsEvent());
                                bibleMessagesReactionsBloc.add(
                                    FetchBibleMessagesReactionsEvent());
                              },
                              child: ListView.builder(
                                itemCount: timeLine.length,
                                itemBuilder: (_, i) {
                                  var timeLineData = timeLine[i];
                                  if (timeLineData.type ==
                                      EntityType.event) {
                                    final event =
                                    timeLineData as EventEntity;
                                    return EventTypeWidget(
                                      onTap: () {
                                        Modular.to.pushNamed('./event',
                                            arguments: event);
                                      },
                                      event: event,
                                      reactions: EventReactionsWidget(
                                        eventReaction: EventReaction(
                                          eventId: event.id!,
                                          memberId: _memberId,
                                          name: "",
                                        ),
                                      ),
                                    );
                                  }
                                  if (timeLineData.type ==
                                      EntityType.message) {
                                    final message =
                                    timeLineData as MessageEntity;
                                    return MessageTypeWidget(
                                      message: message,
                                      onTap: () {
                                        Modular.to.pushNamed(
                                            './bible_messages/message_view',
                                            arguments: {
                                              "message": message
                                            });
                                      },
                                    );
                                  }
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2.5),
                                    child: Container(
                                        height: height * 0.15,
                                        color: AppThemes.secondaryColor1),
                                  );
                                },
                              ),
                            ),
                          )
                              : const Center(
                            child: TransparentLogoWidget(),
                          );
                        }
                        return Container();
                      },
                    ),
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      )*/
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: height * 0.075),
        child: FloatingActionButton(
          onPressed: () => Modular.to.pushNamed('./add_schedules'),
          backgroundColor: AppThemes.primaryColor1,
          child: const Icon(
            Icons.add,
            size: 35,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
