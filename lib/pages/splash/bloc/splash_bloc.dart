import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:mobile_kary_corenitymps_kbm/main.dart';
import 'package:mobile_kary_corenitymps_kbm/models/version/version_response.dart';
import 'package:mobile_kary_corenitymps_kbm/pages/splash/bloc/splash_bloc_event.dart';
import 'package:mobile_kary_corenitymps_kbm/pages/splash/bloc/splash_bloc_model.dart';
import 'package:mobile_kary_corenitymps_kbm/pages/splash/bloc/splash_bloc_state.dart';
import 'package:mobile_kary_corenitymps_kbm/pages/splash/data/splash_repository.dart';
import 'package:mobile_kary_corenitymps_kbm/services/api_endpoint.dart';
import 'package:mobile_kary_corenitymps_kbm/services/api_method.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashBloc extends Bloc<SplashBlocEvent, SplashBlocState> {
  SplashBloc() : super(SplashStateInit(SplashBlocModel.init())) {
    on<SplashBlocEventCheckVersion>(
      (event, emit) async {
        final info = await PackageInfo.fromPlatform();

        try {            
          final versionResponse = await SplashRepository().getVersion();
          if (versionResponse == null) {
            emit(SplashBlocStateVersionFailToCheck(state.model));
          } else {
            emit(
              SplashBlocStateVersionChecked(
                state.model.copyWith(
                  versionResponse: versionResponse,
                  packageInfo: info,
                )
              )
            );
          }
        } catch (e) {
          emit(SplashBlocStateVersionFailToCheck(state.model));
        }
      }
    );
  }
}