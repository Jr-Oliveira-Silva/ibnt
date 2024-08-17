import 'package:app_ibnt/src/modules/home/home_imports.dart';

class WarningsPage extends StatefulWidget {
  const WarningsPage({super.key});

  @override
  State<WarningsPage> createState() => _WarningsPageState();
}

class _WarningsPageState extends State<WarningsPage> {
  final int _pageIndex = 3;
  final _memberId = Modular.args.params["memberId"];

  @override
  void initState() {
    super.initState();
    final announcementsBloc = context.read<AnnouncementsBloc>();
    announcementsBloc.add(GetAllAnnouncementsEvent());
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final pagePadding = width * 0.035;
    final announcementsBloc = context.watch<AnnouncementsBloc>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(preferredSize: Size(width, 80)),
      body: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: pagePadding),
          child: BlocBuilder(
            bloc: announcementsBloc,
            builder: (context, state) {
              if (state is AnnouncementsLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is AnnouncementsSuccessState) {
                final announcements = state.announcements //
                    .where((announcement) => announcement.setAnnouncementMonth(announcement.dateString) == DateTime.now().month)
                    .toList();

                return Column(
                  children: [
                    MonthTitleWidget(month: DateTime.now().month),
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async => announcementsBloc.add(GetAllAnnouncementsEvent()),
                        child: ListView.builder(
                          itemCount: announcements.length,
                          itemBuilder: (_, i) {
                            final announcement = announcements[i];
                            return AnnouncementWidget(
                              announcement: announcement,
                              onTap: () => Modular.to.pushNamed("./warning/$_memberId", arguments: announcement),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              }
              return Container();
            },
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: height * 0.025),
        child: FloatingActionButton(
          onPressed: () => Modular.to.pushNamed("./add_warnings/$_memberId"),
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
