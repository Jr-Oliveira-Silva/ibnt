import 'package:app_ibnt/src/modules/scale/scale_imports.dart';

class ScaleModule extends Module {
  @override
  List<Module> get imports => [
        HomeModule(),
      ];
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const SchedulesPage());
    r.child('/add_schedules', child: (_) => const AddSchedulesPage());
    r.child('/schedule', child: (_) => const SchedulePage());
  }
}
