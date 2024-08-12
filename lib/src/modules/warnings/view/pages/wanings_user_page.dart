import 'package:app_ibnt/src/modules/home/home_imports.dart';

class WarningsUserPage extends StatefulWidget {
  const WarningsUserPage({super.key});

  @override
  State<WarningsUserPage> createState() => _WarningsPageState();
}

class _WarningsPageState extends State<WarningsUserPage> {

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
                final announcements = state.announcements;
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
                              onTap: () {},
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
      bottomNavigationBar: AppNavBarWidget(pageIndex: 3),
    );
  }
}
