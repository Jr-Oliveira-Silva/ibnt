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
    final dateSection = widget.event.date?.split("T").first;
    final eventDay = int.parse(dateSection!.split("-").last);
    final eventMonth = int.parse(dateSection.split("-")[1]);
    final eventYear = int.parse(dateSection.split("-").first);

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
                memberId: "ID",
                event: widget.event,
                editable: true,
              ),
              FilledDateWidget(
                  dateModel: DateModel(
                day: eventDay,
                month: eventMonth,
                year: eventYear,
              )),
              AppButton(
                onTap: () {},
                height: 60,
                width: width,
                primaryColor: Colors.white,
                backgroundColor: AppThemes.primaryColor1,
                fontSize: 18,
                text: "Editar",
              ),
              SizedBox(height: height * 0.02),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppNavBarWidget(pageIndex: 1),
    );
  }
}
