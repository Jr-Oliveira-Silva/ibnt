abstract class AppClient {
  Future get(String url, {Map<String, String>? headers});
  Future post(String url, Object requestBody, {Map<String, String>? headers});
  Future put(String url, Object body, {Map<String, String>? headers});
  Future delete(String url, {Object body, Map<String, String>? headers});
}
