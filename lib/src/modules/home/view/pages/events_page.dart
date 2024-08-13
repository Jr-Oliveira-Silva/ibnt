import 'package:app_ibnt/src/app_imports.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  late GetEventsBloc getEventsBloc;
  @override
  void initState() {
    getEventsBloc = context.read<GetEventsBloc>();
    getEventsBloc.add(GetEventsEvent());
    final commonEventBloc = context.read<CommonEventBloc>();
    commonEventBloc.stream.listen((event) {
      getEventsBloc.add(GetEventsEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    final titleFontSize = height * 0.035;
    final pagePadding = width * 0.035;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(preferredSize: Size(width, height * 0.08)),
      body: BlocBuilder(
        bloc: getEventsBloc,
        builder: (context, state) {
          if (state is GetEventsLoadingState) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (state is GetEventsFailureState) {
            return const Center(
              child: TransparentLogoWidget(),
            );
          }
          if (state is GetEventsSuccessState) {
            final events = state.events;
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
                        "Eventos",
                        style: TextStyle(
                          fontSize: titleFontSize,
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    events.isNotEmpty
                        ? Expanded(
                            child: ListView.builder(
                              itemCount: events.length,
                              itemBuilder: (_, i) {
                                return EventBanner(
                                  widgetHeight: height * 0.15,
                                  event: events[i],
                                  onTap: () => Modular.to.pushNamed("./event", arguments: events[i]),
                                );
                              },
                            ),
                          )
                        : const Center(
                            child: TransparentLogoWidget(),
                          )
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
