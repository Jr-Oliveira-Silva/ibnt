import 'app_imports.dart';

class AppModule extends Module {
  
  @override
  void exportedBinds(Injector i) {
    i.add<AppClient>(AppHttpClient.new);
    i.addSingleton<GoogleSignIn>(() => GoogleSignIn());
    i.addInstance<FirebaseAuth>(FirebaseAuth.instance); 
  }

  @override
  void routes(RouteManager r) {
    r.module('/', module: SplashModule(), transition: TransitionType.fadeIn);
    r.module('/auth', module: AuthModule(), transition: TransitionType.fadeIn);
  }
}
