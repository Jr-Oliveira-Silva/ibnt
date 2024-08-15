import 'package:app_ibnt/src/app_imports.dart';

class CommonModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.add<AppClient>(AppHttpClient.new);
    i.addSingleton<GoogleSignIn>(() => GoogleSignIn());
    i.addInstance<FirebaseAuth>(FirebaseAuth.instance);
  }
}
