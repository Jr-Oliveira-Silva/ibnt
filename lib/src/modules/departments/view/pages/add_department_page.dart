import 'package:app_ibnt/src/app_imports.dart';

class AddDepartmentPage extends StatefulWidget {
  const AddDepartmentPage({super.key});

  @override
  State<AddDepartmentPage> createState() => AddDepartmentPageState();
}

class AddDepartmentPageState extends State<AddDepartmentPage> {
  DepartmentEntity newDepartment = DepartmentEntity();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final titleFontSize = height * 0.035;
    final pagePadding = width * 0.035;
    final labelFontSize = height * 0.025;
    final fontSize = height * 0.024;

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
                  "Departamentos",
                  style: TextStyle(
                    fontSize: titleFontSize,
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFieldLabel(label: "Título do Departamento", fontSize: labelFontSize),
                    AppTextField(
                      fieldName: 'o título',
                      onChanged: (value) => newDepartment.title = value,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: TextFieldLabel(
                  label: "Membros",
                  fontSize: fontSize,
                ),
              ),
              AppSearchWidget(
                onChanged: (value) {},
              ),
              SizedBox(height: height * 0.01),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (_, i) {
                    /* return DepartmentMemberTile(
                          member: member,
                          onTap: () {
                            callAppDialog(
                              context,
                              "Remover Membro",
                              "Deseja remover ${member.fullName} do departamento ${widget.department.title}?",
                              () {
                                bloc.add(RemoveMemberFromDepartmentEvent(widget.department, member));
                                ScaffoldMessenger.of(context).clearMaterialBanners();
                              },
                              () {
                                ScaffoldMessenger.of(context).clearMaterialBanners();
                              },
                            );
                          },
                        ); */
                    return Container(
                      color: AppThemes.secondaryColor1,
                      height: 150, width: width);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
