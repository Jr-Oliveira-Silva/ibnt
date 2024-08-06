import 'package:app_ibnt/src/modules/warnings/warnings_imports.dart';

class AnnouncementPage extends StatefulWidget {
  const AnnouncementPage({required this.announcement, super.key});

  final AnnouncementEntity announcement;
  @override
  State<AnnouncementPage> createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> {
  final _memberId = Modular.args.params["memberId"];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final pagePadding = width * 0.035;
    final titleFontSize = height * 0.04;
    final iconSize = height * 0.025;
    final descriptionFontSize = height * 0.025;
    final iconButtonSize = height * 0.045;

    final currentMonth = DateTime.now().month;
    final bloc = context.watch<AnnouncementsBloc>();

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: AppDrawer(
        drawerOptions: [
          AppDrawerTile(
            tileName: 'Perfil',
            leadingIcon: Icons.person_2_outlined,
            onTap: () {},
          ),
          AppDrawerTile(
            tileName: 'Departamentos',
            leadingIcon: Icons.file_copy_outlined,
            onTap: () {},
          ),
          AppDrawerTile(
            tileName: 'Eventos',
            leadingIcon: Icons.event,
            onTap: () {},
          ),
          AppDrawerTile(
            tileName: 'Escalas',
            leadingIcon: Icons.view_comfortable_outlined,
            onTap: () {},
          ),
        ],
      ),
      appBar: AppBarWidget(preferredSize: Size(width, height * 0.08)),
      body: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: pagePadding),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MonthTitleWidget(month: currentMonth),
                  BlocConsumer(
                    bloc: bloc,
                    listener: (context, state) {
                      if (state is AnnouncementsFailureState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            margin: EdgeInsets.symmetric(vertical: height * 0.116, horizontal: 10),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: AppThemes.secondaryColor1,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                            content: Center(
                              child: Text(
                                state.exception,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        );
                      }
                      if (state is DeleteAnnouncementSuccessState) {
                        Modular.to.navigate("/auth/home/warnings/$_memberId");
                      }
                    },
                    builder: (context, state) {
                      return IconButton(
                          onPressed: () {
                            if (!bloc.isClosed) {
                              bloc.add(DeleteAnnouncementEvent(widget.announcement));
                            } else {
                              final bloc = context.read<AnnouncementsBloc>();
                              bloc.add(DeleteAnnouncementEvent(widget.announcement));
                            }
                          },
                          icon: Container(
                            height: iconButtonSize,
                            width: iconButtonSize,
                            decoration: const BoxDecoration(
                              color: AppThemes.primaryColor1,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Icon(
                              Icons.delete_forever_outlined,
                              size: iconSize,
                              color: Colors.white,
                            ),
                          ));
                    },
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.announcement.title,
                    style: TextStyle(
                      fontSize: titleFontSize,
                    ),
                  ),
                  SizedBox(height: height * 0.025),
                  Text(
                    widget.announcement.description,
                    style: TextStyle(
                      fontSize: descriptionFontSize,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.065),
              AnnouncementDateWidget(announcement: widget.announcement),
              SizedBox(height: height * 0.025),
              widget.announcement.fixedWarning ? const Text("Anúncio Fixado") : Container(),
              SizedBox(height: height * 0.025),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppNavBarWidget(pageIndex: 3),
    );
  }
}
