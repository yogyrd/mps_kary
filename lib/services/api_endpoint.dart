class ApiEndpoint {
  static const String baseURL = 'http://localhost:3100';

  static String appVersion() {
    return "$baseURL/version";
  }
}
