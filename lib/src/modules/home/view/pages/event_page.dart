// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ibnt/src/modules/home/home_imports.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key, required this.event}) : super(key: key);
  final EventEntity event;

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final titleFontSize = height * 0.035;
    final pagePadding = width * 0.035;

    final commonEventBloc = context.read<CommonEventBloc>();

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
                  Text(
                    widget.event.title!,
                    style: TextStyle(
                      fontSize: titleFontSize,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              EventTypeWidget(
                event: widget.event,
                enableSimpleView: true,
              ),
              SizedBox(height: height * 0.064),
              BlocConsumer(
                bloc: commonEventBloc,
                listener: (context, state) {
                  if (state is ShareEventSuccessState) {
                    Modular.to.navigate("./");
                  }
                  if (state is RemoveFromTimelineSuccessState) {
                    Modular.to.navigate("./");
                  }
                },
                builder: (context, state) {
                  if (state is EventLoadingState) {
                    return const Center(child: CircularProgressIndicator.adaptive());
                  }
                  if (state is EventFailureState) {
                    callAppToast(context, state.exception);
                  }
                  return Column(
                    children: [
                      AppButton(
                        onTap: () {
                          callAppDialog(context, "Adicionar à Timeline", "Deseja adicionar o evento ${widget.event.title} à timeline?", () {
                            commonEventBloc.add(ShareInTimelineEvent(widget.event));
                            ScaffoldMessenger.of(context).clearMaterialBanners();
                          }, () {
                            ScaffoldMessenger.of(context).clearMaterialBanners();
                          });
                        },
                        height: 60,
                        width: width,
                        primaryColor: Colors.white,
                        backgroundColor: AppThemes.primaryColor1,
                        fontSize: 18,
                        text: "Compartilhar",
                      ),
                      SizedBox(height: height * 0.02),
                      AppButton(
                        onTap: () {
                          callAppDialog(context, "Remover da Timeline", "Deseja remover o evento ${widget.event.title} da timeline?", () {
                            commonEventBloc.add(RemoveFromTimelineEvent(widget.event));
                            ScaffoldMessenger.of(context).clearMaterialBanners();
                          }, () {
                            ScaffoldMessenger.of(context).clearMaterialBanners();
                          });
                        },
                        height: 60,
                        width: width,
                        primaryColor: Colors.white,
                        backgroundColor: AppThemes.secondaryColor1,
                        fontSize: 18,
                        text: "Remover",
                      ),
                      SizedBox(height: height * 0.02),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppNavBarWidget(pageIndex: 1),
    );
  }
}
