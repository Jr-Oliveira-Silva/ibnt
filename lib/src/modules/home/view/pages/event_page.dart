import 'package:app_ibnt/src/modules/home/home_imports.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final titleFontSize = height * 0.035;
    final iconSize = height * 0.04;
    final pagePadding = width * 0.035;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const AppDrawer(),
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
                    "Nome do Evento",
                    style: TextStyle(
                      fontSize: titleFontSize,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.camera_alt,
                      color: AppThemes.primaryColor1,
                      size: iconSize,
                    ),
                  )
                ],
              ),
              SizedBox(height: height * 0.02),
              EventTypeWidget(
                memberId: "ID",
                event: EventEntity(),
                editable: true,
              ),
              const AppDateWidget(),
              AppButton(
                onTap: () {},
                height: 60,
                width: width,
                primaryColor: Colors.white,
                backgroundColor: AppThemes.primaryColor1,
                fontSize: 18,
                text: "Adicionar",
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
