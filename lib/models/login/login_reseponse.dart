import 'dart:ffi';

class LoginResponse {
  final String? id;
  final String? username;
  final String? token;
  final String? message;
  final int? code;

  LoginResponse({
    this.id,
    this.username,
    this.token,
    this.message,
    this.code
  });

  factory LoginResponse.fromJSON(Map<String, dynamic> json) {
    if (json["code"] == 200) {
      return LoginResponse(
        code: json['code'],
        message: json['message'],
        id: json['values']['id'], 
        username: json['values']['username'], 
        token: json['values']['token']
      );
    } else {
      return LoginResponse(
        code: json['code'], 
        message: json['message']
      );
    }
  }
}