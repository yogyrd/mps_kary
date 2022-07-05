import 'package:mobile_kary_corenitymps_kbm/models/version/version_response.dart';

class SplashScreenBlocModel {
  SplashScreenBlocModel({
    required this.versionResponse
  });

  final VersionResponse? versionResponse;

  factory SplashScreenBlocModel.init()=>SplashScreenBlocModel(
    versionResponse: null
  );

  SplashScreenBlocModel copyWith({
    VersionResponse? versionResponse
  })=>SplashScreenBlocModel(
    versionResponse: versionResponse ?? this.versionResponse
  );
  
}