import 'package:app_ibnt/src/modules/bible_messages/bible_messages_imports.dart';

class BibleMessagesModule extends Module {
  @override
  List<Module> get imports => [
        HomeModule(),
      ];

  @override
  void binds(Injector i) {
    i.addSingleton<IBibleMessagesRepository>(BibleMessagesRepository.new);
    i.add(BibleMessagesBloc.new);
    i.add(GetMemberMessagesBloc.new);
    i.add(BibleBookCubit.new);
    i.add(BibleMessagesFilterCubit.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/:memberId',
      child: (_) => MultiBlocProvider(providers: [
        BlocProvider.value(value: Modular.get<UserBloc>()),
        BlocProvider(create: (context) => Modular.get<GetMemberMessagesBloc>()),
        BlocProvider(create: (context) => Modular.get<BibleMessagesFilterCubit>()),
      ], child: const MessagesPage()),
    );

    r.child(
      '/add_messages/:memberId',
      child: (_) => const AddMessagesPage(),
    );

    r.child(
      '/message_generation/:memberId',
      child: (_) => MultiBlocProvider(providers: [
        BlocProvider(create: (context) => Modular.get<BibleMessagesBloc>()),
        BlocProvider(create: (context) => Modular.get<BibleBookCubit>()),
      ], child: const MessageGenerationPage()),
    );

    r.child(
      '/create_message/:memberId',
      child: (_) => MultiBlocProvider(providers: [
        BlocProvider(create: (context) => Modular.get<BibleMessagesBloc>()),
      ], child: const CreateMessagePage()),
    );

    r.child(
      '/edit_message',
      child: (_) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => Modular.get<BibleMessagesBloc>()),
          ],
          child: EditMessagePage(
            message: r.args.data["message"],
          )),
    );

    r.child(
      '/message',
      child: (_) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => Modular.get<BibleMessagesBloc>()),
          ],
          child: MessagePage(
            message: r.args.data["message"],
          )),
    );
  }
}
