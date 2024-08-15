import 'package:app_ibnt/src/modules/splash/splash_imports.dart';

class SplashModule extends Module {
  @override
  List<Module> get imports => [
        CommonModule(),
      ];
  @override
  void binds(Injector i) {
    i.addSingleton<ISplashRepository>(SplashRepository.new);
    i.addSingleton<TokenVerifierBloc>(TokenVerifierBloc.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => BlocProvider(create: (_) => Modular.get<TokenVerifierBloc>(), child: const SplashPage()));
  }
}
