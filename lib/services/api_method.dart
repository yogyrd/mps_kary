import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

enum ApiMethod{
  getWithoutToken,
  getUsingToken,
  postWithoutToken,
  postUsingToken,
  postMultiPart,
  put
}

Future callService(ApiMethod method, String url, {String? token, Map<String, dynamic>? data, File? file}) async {
  switch(method) {
    case ApiMethod.getWithoutToken:
      return http.get(
        Uri.parse(url),
        headers: {
          "Content-Type":"application/json"
        }
      );
      break;
    case ApiMethod.getUsingToken:
      print('one!');
      break;
    case ApiMethod.postWithoutToken:
      return http.post(
        Uri.parse(url),
        body: data != null ? json.encode(data) : "{}",
        headers: {
          "Content-Type":"application/json"
        }
      );
      break;
    case ApiMethod.postUsingToken:
     print('two!');
      break;
    case ApiMethod.postMultiPart:
      print('two!');
      break;
    case ApiMethod.put:
      print('two!');
      break;
  }
}