import 'package:app_ibnt/src/services/services_imports.dart';
import 'package:http/http.dart' as http;

class AppHttpClient implements AppClient {
  @override
  Future<Response> get(String url, {Map<String, String>? headers}) async {
    final response = await http.get(Uri.parse(url), headers: headers);
    logger(
      url: url,
      method: response.request?.method.toUpperCase() ?? "",
      statusCode: response.statusCode,
      logValue: response.body,
    );
    return response;
  }

  @override
  Future<Response> post(String url, Object requestBody, {Map<String, String>? headers}) async {
    final response = await http.post(Uri.parse(url), body: jsonEncode(requestBody), headers: headers);
    logger(
      url: url,
      method: response.request?.method.toUpperCase() ?? "",
      statusCode: response.statusCode,
      logValue: response.body,
    );
    return response;
  }

  @override
  Future<Response> put(String url, Object body, {Map<String, String>? headers}) async {
    final response = await http.put(Uri.parse(url), body: jsonEncode(body), headers: headers);
    logger(
      url: url,
      method: response.request?.method.toUpperCase() ?? "",
      statusCode: response.statusCode,
      logValue: response.body,
    );
    return response;
  }

  @override
  Future<Response> delete(String url, {Object? body, Map<String, String>? headers}) async {
    final response = await http.delete(Uri.parse(url), body: jsonEncode(body), headers: headers);
    logger(
      url: url,
      method: response.request?.method.toUpperCase() ?? "",
      statusCode: response.statusCode,
      logValue: response.body,
    );
    return response;
  }

  @override
  Future<StreamedResponse> formDataHandler(File file, String fieldName, String url, String method, {Map<String, String>? headers}) async {
    final request = MultipartRequest(method, Uri.parse(url));
    final formFile = await MultipartFile.fromPath(fieldName, file.path, filename: file.path);

    formFile.contentType.change(type: "multipart/form-data");
    if (headers != null) {
      request.headers["authorization"] = headers["authorization"]!;
    }
    request.files.add(formFile);

    request.fields;

    final response = await request.send();
    final byteStream = response.stream;
    logger(
      url: url,
      method: request.method.toUpperCase(),
      statusCode: response.statusCode,
      logValue: await byteStream.bytesToString(),
    );

    return response;
  }
}
