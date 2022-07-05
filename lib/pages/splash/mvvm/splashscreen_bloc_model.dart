import 'package:equatable/equatable.dart';
import 'package:mobile_kary_corenitymps_kbm/models/version/version_response.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashScreenBlocModel extends Equatable {
  const SplashScreenBlocModel({
    this.versionResponse,
    this.packageInfo,
  });

  final VersionResponse? versionResponse;
  final PackageInfo? packageInfo;

  factory SplashScreenBlocModel.init() {
    return const SplashScreenBlocModel();
  }

  SplashScreenBlocModel copyWith({
    VersionResponse? versionResponse,
    PackageInfo? packageInfo,
  }) =>
      SplashScreenBlocModel(
        versionResponse: versionResponse ?? this.versionResponse,
        packageInfo: packageInfo ?? this.packageInfo,
      );

  @override
  List<Object?> get props => [versionResponse, packageInfo];
}
