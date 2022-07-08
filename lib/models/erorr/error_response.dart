class ErrorResponse {
  final int? code;
  final String? message;

  ErrorResponse({this.code, this.message});

  factory ErrorResponse.fromJSON(Map<String, dynamic> json) {
    return ErrorResponse(
      code : json['code'] ?? "",
      message : json['message'] ?? ""
    );
  }
}