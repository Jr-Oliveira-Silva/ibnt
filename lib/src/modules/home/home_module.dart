import 'package:app_ibnt/src/modules/home/home_imports.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        AuthModule(),
      ];

  @override
  void binds(Injector i) {
    i.addSingleton<IHomeRepository>(HomeRepository.new);
    i.add<UserBloc>(UserBloc.new);
    i.add<HomeBloc>(HomeBloc.new);
    i.add<EventsReactionsBloc>(EventsReactionsBloc.new);
    i.add<BibleMessagesReactionsBloc>(BibleMessagesReactionsBloc.new);
    i.add<CreateEventBloc>(CreateEventBloc.new);
    i.add<CommonEventBloc>(CommonEventBloc.new);
    i.add<GetEventsBloc>(GetEventsBloc.new);
    i.add<DateCubit>(DateCubit.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => MultiBlocProvider(providers: [
        BlocProvider.value(value: Modular.get<UserBloc>()),
        BlocProvider.value(value: Modular.get<HomeBloc>()),
        BlocProvider.value(value: Modular.get<EventsReactionsBloc>()),
        BlocProvider.value(value: Modular.get<BibleMessagesReactionsBloc>()),
      ], child: HomePage()),
      guards: [userGuard],
    );
    r.child(
      '/home_user',
      child: (_) => MultiBlocProvider(providers: [
        BlocProvider.value(value: Modular.get<UserBloc>()),
        BlocProvider.value(value: Modular.get<HomeBloc>()),
        BlocProvider.value(value: Modular.get<EventsReactionsBloc>()),
        BlocProvider.value(value: Modular.get<BibleMessagesReactionsBloc>()),
      ], child: HomePageUser()),
    );
    r.child(
      '/add_events/:memberId',
      child: (_) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => Modular.get<CreateEventBloc>()),
          BlocProvider(create: (context) => Modular.get<DateCubit>()),
        ],
        child: const AddEventsPage(),
      ),
    );
    r.child('/event',
        child: (_) => MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => Modular.get<CommonEventBloc>()),
                BlocProvider(create: (context) => Modular.get<DateCubit>()),
              ],
              child: EventPage(event: r.args.data),
            ));
    r.child('/events',
        child: (_) => MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => Modular.get<CommonEventBloc>()),
                BlocProvider(create: (context) => Modular.get<GetEventsBloc>()),
              ],
              child: const EventsPage(),
            ));
    r.child(
      '/notifications',
      child: (_) => const NotificationsPage(),
      transition: TransitionType.rightToLeft,
    );
    r.child('/profile/:memberId',
        child: (_) => MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => Modular.get<AuthBloc>()),
                BlocProvider(create: (_) => Modular.get<UserBloc>()),
              ],
              child: const ProfilePage(),
            ));
    r.module('/bible_messages', module: BibleMessagesModule(), transition: TransitionType.fadeIn);
    r.module('/warnings', module: WarningsModule(), transition: TransitionType.fadeIn);
    r.module('/posts', module: PostsModule(), transition: TransitionType.fadeIn);
    r.module('/departments', module: DepartmentsModule(), transition: TransitionType.fadeIn);
    r.module('/scale', module: ScaleModule(), transition: TransitionType.fadeIn);
  }

  final userGuard = UserGuard(redirectTo: './home_user');
}
