import 'package:app_ibnt/src/modules/departments/departments_imports.dart';

class DepartmentsPage extends StatefulWidget {
  const DepartmentsPage({super.key});

  @override
  State<DepartmentsPage> createState() => DepartmentsPageState();
}

class DepartmentsPageState extends State<DepartmentsPage> {
  final _pageIndex = 1;
  late GetDepartmentsBloc getDepartmentsBloc;
  late RemoveMemberFromDepartmentBloc removeBloc;
  late RemoveDepartmentBloc removeDepartmentBloc;

  @override
  void initState() {
    super.initState();
    getDepartmentsBloc = context.read<GetDepartmentsBloc>();
    removeBloc = context.read<RemoveMemberFromDepartmentBloc>();
    removeDepartmentBloc = context.read<RemoveDepartmentBloc>();
    getDepartmentsBloc.add(GetDepartmentsEvent());

    removeBloc.stream.listen(
      (event) {
        getDepartmentsBloc.add(GetDepartmentsEvent());
      },
    );

    removeDepartmentBloc.stream.listen(
      (event) {
        getDepartmentsBloc.add(GetDepartmentsEvent());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final titleFontSize = height * 0.035;
    final pagePadding = width * 0.035;

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
              BlocBuilder(
                bloc: getDepartmentsBloc,
                builder: (context, state) {
                  if (state is GetDepartmentsLoadingState) {
                    return const Expanded(
                        child: Center(
                      child: CircularProgressIndicator(),
                    ));
                  }
                  if (state is GetDepartmentsSuccessState) {
                    final departments = state.departments;
                    return departments.isNotEmpty
                        ? Expanded(
                            child: RefreshIndicator(
                              onRefresh: () async {
                                getDepartmentsBloc.add(GetDepartmentsEvent());
                              },
                              child: ListView.builder(
                                itemCount: departments.length,
                                itemBuilder: (_, i) {
                                  final department = departments[i];

                                  return DepartmentTile(
                                    department: department,
                                    onTap: () {
                                      Modular.to.pushNamed('./department', arguments: department);
                                    },
                                  );
                                },
                              ),
                            ),
                          )
                        : const Center(
                            child: TransparentLogoWidget(),
                          );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: height * 0.025),
        child: FloatingActionButton(
          onPressed: () => Modular.to.pushNamed('./add_department'),
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
