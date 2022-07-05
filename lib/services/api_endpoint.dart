import 'package:flutter/cupertino.dart';

class ApiEndpoint {
  final String baseURL = 'http://localhost:3100';

  String appVersion() {
    return "$baseURL/version";
  }
}