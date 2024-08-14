import 'package:app_ibnt/src/modules/departments/departments_imports.dart';

class DepartmentsModule extends Module {
  @override
  List<Module> get imports => [
        HomeModule(),
      ];

  @override
  void binds(Injector i) {
    i.addSingleton<IDepartmentsRepository>(DepartmentsRepository.new);
    i.addLazySingleton(CreateDepartmentBloc.new);
    i.add(GetDepartmentsBloc.new);
    i.addLazySingleton(RemoveDepartmentBloc.new);
    i.addLazySingleton(RemoveMemberFromDepartmentBloc.new);
    i.add(DepartmentMembersCubit.new);
    i.add(AddMemberToDepartmentCubit.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/',
        child: (_) => MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => Modular.get<GetDepartmentsBloc>()),
                BlocProvider.value(value: Modular.get<RemoveDepartmentBloc>()),
                BlocProvider.value(value: Modular.get<RemoveMemberFromDepartmentBloc>()),
              ],
              child: const DepartmentsPage(),
            ));
    r.child('/add_department',
        child: (_) => MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => Modular.get<UserBloc>()),
                BlocProvider.value(value: Modular.get<DepartmentMembersCubit>()),
                BlocProvider(create: (_) => Modular.get<AddMemberToDepartmentCubit>()),
                BlocProvider.value(value: Modular.get<CreateDepartmentBloc>()),
              ],
              child: const AddDepartmentPage(),
            ));
    r.child('/department',
        child: (_) => MultiBlocProvider(
              providers: [
                BlocProvider.value(value: Modular.get<RemoveMemberFromDepartmentBloc>()),
                BlocProvider(create: (_) => Modular.get<DepartmentMembersCubit>()),
              ],
              child: DepartmentPage(department: r.args.data),
            ));
  }
}
