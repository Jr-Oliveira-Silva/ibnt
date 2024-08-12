import 'package:app_ibnt/src/modules/warnings/warnings_imports.dart';

class WarningsModule extends Module {
  @override
  List<Module> get imports => [
        HomeModule(),
      ];

  @override
  void binds(Injector i) {
    i.addSingleton<IWarningsRepository>(WarningsRepository.new);
    i.add<AnnouncementsBloc>(AnnouncementsBloc.new);
    i.add<CreateAnnouncementBloc>(CreateAnnouncementBloc.new);
    i.add<AnnouncementCubit>(AnnouncementCubit.new);
    i.add<DateCubit>(DateCubit.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/:memberId',
        child: (_) => MultiBlocProvider(
              providers: [
                BlocProvider.value(value: Modular.get<UserBloc>()),
                BlocProvider(create: (_) => Modular.get<CreateAnnouncementBloc>()),
                BlocProvider(create: (_) => Modular.get<AnnouncementsBloc>()),
              ],
              child: const WarningsPage(),
            ),
        guards: [
          UserGuard(redirectTo: './warnings_user'),
        ]);
    r.child(
      '/warnings_user',
      child: (_) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => Modular.get<CreateAnnouncementBloc>()),
          BlocProvider(create: (_) => Modular.get<AnnouncementsBloc>()),
        ],
        child: const WarningsUserPage(),
      ),
    );
    r.child(
      '/add_warnings/:memberId',
      child: (_) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => Modular.get<CreateAnnouncementBloc>()),
          BlocProvider(create: (_) => Modular.get<DateCubit>()),
        ],
        child: const AddWarningsPage(),
      ),
    );
    r.child(
      '/warning/:memberId',
      child: (_) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => Modular.get<AnnouncementsBloc>()),
          BlocProvider(create: (_) => Modular.get<AnnouncementCubit>()),
        ],
        child: AnnouncementPage(announcement: r.args.data),
      ),
    );
  }
}
