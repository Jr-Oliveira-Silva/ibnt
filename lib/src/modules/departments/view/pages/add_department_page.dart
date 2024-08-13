import 'package:app_ibnt/src/app_imports.dart';
import 'package:app_ibnt/src/modules/departments/cubits/add_member_to_department_cubit/add_member_to_department_cubit.dart';

class AddDepartmentPage extends StatefulWidget {
  const AddDepartmentPage({super.key});

  @override
  State<AddDepartmentPage> createState() => AddDepartmentPageState();
}

class AddDepartmentPageState extends State<AddDepartmentPage> {
  DepartmentEntity newDepartment = DepartmentEntity(members: []);

  late UserBloc homeBloc;
  late CreateDepartmentBloc createDepartmentBloc;

  @override
  void initState() {
    super.initState();
    homeBloc = context.read<UserBloc>();
    createDepartmentBloc = context.read<CreateDepartmentBloc>();
    homeBloc.add(GetMembersEvent());
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final titleFontSize = height * 0.035;
    final pagePadding = width * 0.035;
    final labelFontSize = height * 0.025;
    final buttonFontSize = height * 0.02;
    final fontSize = height * 0.024;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        preferredSize: Size(width, height * 0.08),
      ),
      body: BlocBuilder(
        bloc: homeBloc,
        builder: (context, state) {
          if (state is GetUserLoadingUserState) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (state is GetUsersSuccessState) {
            final members = state.users;
            final departmentMembers = members
                .map((member) => DepartmentMember(
                      id: member.id,
                      fullName: member.fullName,
                      email: member.userCredential!.email,
                      profileImage: member.profileImage,
                    ))
                .toList();
            final cubit = AddMemberToDepartmentCubit([]);
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
                    /*  AppSearchWidget(
                      onChanged: (value) {},
                    ), */
                    SizedBox(height: height * 0.01),
                    Expanded(
                      child: BlocBuilder(
                        bloc: cubit,
                        builder: (context, state) {
                          return ListView.builder(
                            itemCount: members.length,
                            itemBuilder: (_, i) {
                              final departmentMember = departmentMembers[i];

                              return DepartmentMemberTile(
                                member: departmentMember,
                                button: AppButton(
                                  showBorder: cubit.addedMember(departmentMember) ? true : false,
                                  height: height * 0.035,
                                  width: width * 0.25,
                                  text: cubit.addedMember(departmentMember) ? "Remover" : "Adicionar",
                                  primaryColor: cubit.addedMember(departmentMember) ? AppThemes.primaryColor1 : Colors.white,
                                  backgroundColor: cubit.addedMember(departmentMember) ? Colors.white : AppThemes.primaryColor1,
                                  onTap: () {
                                    newDepartment.members!.clear();
                                    cubit.defineDepartmentsMembersList(departmentMember);
                                    newDepartment.members!.addAll(cubit.state);
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    BlocConsumer(
                      listener: (context, state) {
                        if (state is CreateDepartmentSuccessState) {
                          Modular.to.navigate("./");
                        }
                        if (state is CreateDepartmentFailureState) {
                          callAppToast(context, state.message);
                        }
                      },
                      bloc: createDepartmentBloc,
                      builder: (context, state) {
                        if (state is CreateDepartmentLoadingState) {
                          return const Center(child: CircularProgressIndicator.adaptive());
                        }
                        return AppButton(
                          primaryColor: Colors.white,
                          backgroundColor: AppThemes.primaryColor1,
                          fontSize: buttonFontSize,
                          text: "Adicionar",
                          onTap: () {
                            if (formKey.currentState!.validate() && newDepartment.members!.isNotEmpty) {
                              createDepartmentBloc.add(CreateDepartmentEvent(newDepartment));
                            } else {
                              callAppToast(
                                context,
                                "Por favor, adicione um título ao departamento, e pelo menos 1 membro.",
                              );
                            }
                          },
                        );
                      },
                    ),
                    SizedBox(height: height * 0.02),
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
