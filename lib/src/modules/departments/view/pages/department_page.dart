// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ibnt/src/app_imports.dart';

class DepartmentPage extends StatefulWidget {
  const DepartmentPage({Key? key, required this.department}) : super(key: key);

  final DepartmentEntity department;
  @override
  State<DepartmentPage> createState() => DepartmentPageState();
}

class DepartmentPageState extends State<DepartmentPage> {
  final _pageIndex = 1;
  late RemoveMemberFromDepartmentBloc bloc;
  late DepartmentMembersCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<DepartmentMembersCubit>();
    bloc = context.read<RemoveMemberFromDepartmentBloc>();

    cubit.fillDepartmentMembersList(widget.department.members ?? <DepartmentMember>[]);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final titleFontSize = height * 0.035;
    final pagePadding = width * 0.035;
    final fontSize = height * 0.024;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        preferredSize: Size(width, height * 0.08),
      ),
      body: BlocConsumer(
        bloc: bloc,
        listener: (context, state) async {
          if (state is RemoveMemberFromDepartmentFailureState) {
            callAppToast(context, state.message);
          }
          if (state is RemoveMemberFromDepartmentSuccessState) {
            callAppToast(context, "Usuário Removido!");
            await Future.delayed(const Duration(seconds: 2));
            Modular.to.navigate("./");
          }
        },
        builder: (context, blocState) {
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
                      widget.department.title ?? "",
                      style: TextStyle(
                        fontSize: titleFontSize,
                      ),
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
                    onChanged: (value) {
                      cubit.filterMembers(value, widget.department.members!);
                    },
                  ),
                  SizedBox(height: height * 0.01),
                  widget.department.members!.isNotEmpty
                      ? Visibility(
                          visible: blocState is! RemoveMemberFromDepartmentLoadingState,
                          replacement: const Expanded(
                            child: Center(
                              child: CircularProgressIndicator.adaptive(),
                            ),
                          ),
                          child: Expanded(
                            child: BlocBuilder<DepartmentMembersCubit, List<DepartmentMember>>(
                              bloc: cubit,
                              builder: (context, state) {
                                final members = state;
                                return ListView.builder(
                                  itemCount: members.length,
                                  itemBuilder: (_, i) {
                                    final member = members[i];
                                    return DepartmentMemberTile(
                                      member: member,
                                      button: AppButton(
                                        height: height * 0.035,
                                        width: width * 0.25,
                                        text: "Remover",
                                        primaryColor: Colors.white,
                                        backgroundColor: AppThemes.primaryColor1,
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
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        )
                      : const Center(
                          child: TransparentLogoWidget(),
                        ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: AppNavBarWidget(pageIndex: _pageIndex),
    );
  }
}
