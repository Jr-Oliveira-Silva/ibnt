// ignore_for_file: constant_identifier_names, non_constant_identifier_names
import 'package:app_ibnt/src/app_imports.dart';

const API_URL = "https://ibnt-api.up.railway.app/api";
const BIBLE_API_URL = "https://www.abibliadigital.com.br/api";
String user_token = "";
String bible_api_user_token = "";

Future<void> setUserTokenToGlobalVariable(String token, String? bibleApitoken) async {
  user_token = token;
  log("USER_BEARER_TOKEN: $user_token");
  if (bibleApitoken != null) {
    bible_api_user_token = bibleApitoken;
    log("API_USER_TOKEN: $bible_api_user_token");
  }
}

abstract class StatusCodes {
  static int OK = 200;
  static int CREATED = 201;
  static int NO_CONTENT = 204;
  static int BAD_REQUEST = 400;
  static int NOT_FOUND = 404;
}
