// ignore_for_file: must_be_immutable
import 'package:app_ibnt/src/modules/home/home_imports.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  late BaseUserEntity user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageIndex = 1;
  late String _memberId;

  Future<void> _setUserData() async {
    final preferences = await SharedPreferences.getInstance();
    final userJson = preferences.getString("user");
    if (userJson != null) {
      final userMap = jsonDecode(userJson);
      _memberId = userMap["id"];
    }
  }

  late UserBloc userBloc;
  late HomeBloc homeBloc;
  late EventsReactionsBloc eventsReactionsBloc;
  late BibleMessagesReactionsBloc bibleMessagesReactionsBloc;

  @override
  void initState() {
    super.initState();
    userBloc = context.read<UserBloc>();
    homeBloc = context.read<HomeBloc>();
    eventsReactionsBloc = context.read<EventsReactionsBloc>();
    bibleMessagesReactionsBloc = context.read<BibleMessagesReactionsBloc>();
    eventsReactionsBloc.add(FetchEventsReactionsEvent());
    bibleMessagesReactionsBloc.add(FetchBibleMessagesReactionsEvent());

    Future.delayed(const Duration(milliseconds: 200)).whenComplete(() async {
      await _setUserData();
      if (!userBloc.isClosed) {
        userBloc.add(GetMemberByIdEvent(_memberId));
      }
      if (!homeBloc.isClosed) {
        homeBloc.add(FetchTimelineEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final titleFontSize = height * 0.035;
    final pagePadding = width * 0.035;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: AppDrawer(
        drawerOptions: [
          AppDrawerTile(
            tileName: 'Departamentos',
            leadingIcon: Icons.file_copy_outlined,
            onTap: () {
              Modular.to.pushNamed('./departments/');
              Navigator.of(context).pop();
            },
          ),
          AppDrawerTile(
            tileName: 'Eventos',
            leadingIcon: Icons.event,
            onTap: () {
              Modular.to.pushNamed('./events');
              Navigator.of(context).pop();
            },
          ),
          AppDrawerTile(
            tileName: 'Escalas',
            leadingIcon: Icons.view_comfortable_outlined,
            onTap: () {},
          ),
        ],
      ),
      appBar: AppBarWidget(
        preferredSize: Size(width, height * 0.08),
        actions: [
          IconButton(
            onPressed: () => Modular.to.pushNamed('./notifications'),
            icon: const Icon(
              Icons.notifications_none_outlined,
            ),
          ),
        ],
      ),
      body: BlocBuilder(
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
                                      eventsReactionsBloc.add(FetchEventsReactionsEvent());
                                      bibleMessagesReactionsBloc.add(FetchBibleMessagesReactionsEvent());
                                    },
                                    child: ListView.builder(
                                      itemCount: timeLine.length,
                                      itemBuilder: (_, i) {
                                        var timeLineData = timeLine[i];
                                        if (timeLineData.type == EntityType.event) {
                                          final event = timeLineData as EventEntity;
                                          return EventTypeWidget(
                                            onTap: () {
                                              Modular.to.pushNamed('./event', arguments: event);
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
                                        if (timeLineData.type == EntityType.message) {
                                          final message = timeLineData as MessageEntity;
                                          return MessageTypeWidget(
                                            message: message,
                                            onTap: () {
                                              Modular.to.pushNamed('./bible_messages/message_view', arguments: {"message": message});
                                            },
                                          );
                                        }
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 2.5),
                                          child: Container(height: height * 0.15, color: AppThemes.secondaryColor1),
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
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: height * 0.025),
        child: FloatingActionButton(
          onPressed: () => Modular.to.pushNamed('./add_events'),
          backgroundColor: AppThemes.primaryColor1,
          child: const Icon(
            Icons.add,
            size: 35,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: AppNavBarWidget(pageIndex: _pageIndex),
    );
  }
}
