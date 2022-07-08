import 'package:flutter/cupertino.dart';

class ApiEndpoint {
  final String baseURL = 'http://159.65.137.87:3000/api';

  String appVersion() {
    return "$baseURL/version?apps=mobile_karyawan";
  }

  String login() {
    return "$baseURL/auth/sign-in";
  }
}