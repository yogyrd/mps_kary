import 'package:equatable/equatable.dart';
import 'package:mobile_kary_corenitymps_kbm/models/version/version_response.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashBlocModel extends Equatable {
  const SplashBlocModel({
    this.versionResponse,
    this.packageInfo,
  });

  final VersionResponse? versionResponse;
  final PackageInfo? packageInfo;

  factory SplashBlocModel.init() {
    return const SplashBlocModel();
  }

  SplashBlocModel copyWith({
    VersionResponse? versionResponse,
    PackageInfo? packageInfo,
  }) =>
      SplashBlocModel(
        versionResponse: versionResponse ?? this.versionResponse,
        packageInfo: packageInfo ?? this.packageInfo,
      );

  @override
  List<Object?> get props => [versionResponse, packageInfo];
}
