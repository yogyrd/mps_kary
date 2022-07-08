import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mobile_kary_corenitymps_kbm/main.dart';
import 'package:mobile_kary_corenitymps_kbm/models/version/version_response.dart';
import 'package:mobile_kary_corenitymps_kbm/services/api_endpoint.dart';
import 'package:mobile_kary_corenitymps_kbm/services/api_method.dart';

class SplashRepository {
  SplashRepository();

  Future<VersionResponse?> getVersion() async {
    try {
      HttpOverrides.global = MyHttpOverrides();
      final Response response = await callService(
        ApiMethod.getWithoutToken, ApiEndpoint().appVersion()
      );
      if (response.statusCode == 200) {
        final jsonRes = json.decode(response.body);
        if (jsonRes['error'] == false) {
          return VersionResponse.fromJSON(jsonRes['values']);
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}