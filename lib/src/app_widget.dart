import 'app_imports.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return MaterialApp.router(
      theme: ThemeData(
        colorSchemeSeed: AppThemes.primaryColor1,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          sizeConstraints: BoxConstraints(
            minHeight: height * 0.07,
            minWidth: width * 0.23,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: Modular.routerConfig,
    );
  }
}
