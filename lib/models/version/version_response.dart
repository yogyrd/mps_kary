class VersionResponse {
  final int? id;
  final String? apps;
  final String? version;
  final String? desc;

  VersionResponse({this.id, this.apps, this.version, this.desc});

  factory VersionResponse.fromJSON(Map<String, dynamic> json) {
    return VersionResponse(
      id : json['id'] ?? "",
      apps : json['apps'] ?? "",
      version : json['version'] ?? "",
      desc : json['desc'] ?? ""
    );
  }
}