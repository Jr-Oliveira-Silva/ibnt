import 'package:app_ibnt/src/app_imports.dart';

class UserGuard extends RouteGuard {
  UserGuard({required super.redirectTo});

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) async {
    var preferences = await SharedPreferences.getInstance();
    final userData = jsonDecode(preferences.getString("user") ?? '{}') as Map;
    return userData["role"] == "admin";
  }
}
