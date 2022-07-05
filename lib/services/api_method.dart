import 'dart:io';
import 'package:http/http.dart' as http;

enum ApiMethod{
  getWithoutToken,
  getUsingToken,
  postUsingToken,
  postMultiPart,
  put
}

Future callService(ApiMethod method, String url, {String? token, Map<String, dynamic>? data, File? file}) async {
  if (method == ApiMethod.getWithoutToken) {
    return http.get(
      Uri.parse(url),
      headers: {
        "Content-Type":"application/json"
      }
    );
  }
}