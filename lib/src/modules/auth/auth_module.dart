import 'package:app_ibnt/src/modules/auth/auth_imports.dart';

class AuthModule extends Module {
  @override
  List<Module> get imports => [
        CommonModule(),
      ];

  @override
  void binds(Injector i) {
    i.addSingleton<IAuthRepository>(AuthRepository.new);
    i.add<AuthBloc>(AuthBloc.new);
    i.add<CreateUserBloc>(CreateUserBloc.new);
    i.add<RecoveryPasswordBloc>(RecoveryPasswordBloc.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/',
        child: (_) => BlocProvider(
              create: (context) => Modular.get<AuthBloc>(),
              child: const AuthOptionsPage(),
            ));
    r.child('/login',
        child: (_) => BlocProvider(
              create: (context) => Modular.get<AuthBloc>(),
              child: const LoginPage(),
            ));
    r.child('/register',
        child: (_) => BlocProvider(
              create: (context) => Modular.get<CreateUserBloc>(),
              child: const RegisterPage(),
            ));
    r.child('/send_email',
        child: (_) => BlocProvider(
              create: (context) => Modular.get<RecoveryPasswordBloc>(),
              child: const SendEmailPage(),
            ));
    r.child('/recovery_password',
        child: (_) => BlocProvider(
              create: (context) => Modular.get<RecoveryPasswordBloc>(),
              child: const RecoveryPasswordPage(),
            ));
    r.module('/home', module: HomeModule(), transition: TransitionType.fadeIn);
  }
}
