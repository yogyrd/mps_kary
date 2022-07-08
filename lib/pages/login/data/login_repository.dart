import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mobile_kary_corenitymps_kbm/main.dart';
import 'package:mobile_kary_corenitymps_kbm/models/erorr/error_response.dart';
import 'package:mobile_kary_corenitymps_kbm/models/login/login_reseponse.dart';
import 'package:mobile_kary_corenitymps_kbm/services/api_endpoint.dart';
import 'package:mobile_kary_corenitymps_kbm/services/api_method.dart';
import 'package:tuple/tuple.dart';

class LoginRepository {
  LoginRepository();

  Future<Tuple2<LoginResponse?, ErrorResponse?>> auth(Map<String, dynamic> map) async {
    try {
      HttpOverrides.global = MyHttpOverrides();
      final Response response = await callService(
        ApiMethod.postWithoutToken,
        ApiEndpoint().login(),
        data: map
      );
      if (response.statusCode == 200) {
        final jsonRes = json.decode(response.body);
        return Tuple2(LoginResponse.fromJSON(jsonRes), ErrorResponse.fromJSON(jsonRes));
      } else {
        final jsonRes = json.decode(response.body);
        return Tuple2(LoginResponse.fromJSON(jsonRes), ErrorResponse.fromJSON(jsonRes));
      }
    } catch (e) {
      return const Tuple2(null, null);
    }
  }
}