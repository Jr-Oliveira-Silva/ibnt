// ignore_for_file: constant_identifier_names, non_constant_identifier_names
import 'package:app_ibnt/src/app_imports.dart';

const API_URL = "https://ibnt-api.up.railway.app/api";
const API_IMAGE_URL = "https://ibnt-api.up.railway.app/";
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