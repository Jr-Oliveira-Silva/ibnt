import 'package:app_ibnt/src/app_imports.dart';

abstract class AppException implements Exception {
  AppException({required String exception}) {
    _showException(exception);
  }

  _showException(String exception) => FlutterError.presentError(FlutterErrorDetails(exception: exception));
}
