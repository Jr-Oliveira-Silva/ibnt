import 'package:app_ibnt/src/modules/home/home_imports.dart';

class AddEventsPage extends StatefulWidget {
  const AddEventsPage({super.key});

  @override
  State<AddEventsPage> createState() => _AddEventsPageState();
}

class _AddEventsPageState extends State<AddEventsPage> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final titleFontSize = height * 0.04;
    final cameraIconSize = height * 0.04;
    final labelFontSize = height * 0.025;
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
                    "Eventos",
                    style: TextStyle(
                      fontSize: titleFontSize,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.camera_alt,
                      color: AppThemes.primaryColor1,
                      size: cameraIconSize,
                    ),
                  )
                ],
              ),
              SizedBox(height: height * 0.05),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFieldLabel(label: "Nome", fontSize: labelFontSize),
                    AppTextField(
                      onChanged: (value) {},
                    ),
                    TextFieldLabel(label: "Descrição", fontSize: labelFontSize),
                    AppTextField(
                      onChanged: (value) {},
                    ),
                    SizedBox(height: height * 0.025),
                  ],
                ),
              ),
              const AppDateWidget(),
              SizedBox(height: height * 0.02),
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
