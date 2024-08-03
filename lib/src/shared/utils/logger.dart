import 'package:app_ibnt/src/shared/shared_imports.dart';

void logger({required String url, required String method, required int statusCode, required String logValue}) {
  logValue = logValue
      .replaceAll('{', '{\n') //
      .replaceAll('}', '\n}') //
      .replaceAll(',', ',\n')
      .replaceAll('[', '[\n')
      .replaceAll(']', '\n]');

  return log('''URL: $url \nMETHOD: $method \nSTATUS CODE: $statusCode \nREQUEST BODY: \n$logValue \n \n''');
}
