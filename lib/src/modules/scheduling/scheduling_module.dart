import 'package:app_ibnt/src/modules/scheduling/scheduling_imports.dart';

class SchedulingModule extends Module {
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
