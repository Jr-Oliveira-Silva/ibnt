// ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'package:app_ibnt/src/modules/splash/splash_imports.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late TokenVerifierBloc bloc;
  late String? token;
  String? bibleApitoken;

  @override
  void initState() {
    super.initState();
    bloc = context.read<TokenVerifierBloc>();
    Future.microtask(() async {
      var prefereces = await SharedPreferences.getInstance();
      token = prefereces.getString("token");
      bibleApitoken = prefereces.getString("bible_api_user_token");
      if (token != null) {
        bloc.add(VerifyTokenEvent(token ?? ""));
      } else {
        await prefereces.clear();
        Modular.to.navigate('/auth/');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer(
        bloc: bloc,
        listener: (context, state) async {
          if (state is TokenVerifierSuccessState) {
            await setUserTokenToGlobalVariable(token!, bibleApitoken);
            Modular.to.navigate('/auth/home/');
          }
          if (state is TokenVerifierFailureState) {
            Modular.to.navigate('/auth/');
          }
        },
        builder: (context, state) {
          return const Center(
            child: LogoWidget(key: Key("logo_widget")),
          );
        },
      ),
    );
  }
}
