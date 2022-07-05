// ignore_for_file: void_checks

import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:mobile_kary_corenitymps_kbm/blocs/splash/splashscreen_bloc_event.dart';
import 'package:mobile_kary_corenitymps_kbm/blocs/splash/splashscreen_bloc_model.dart';
import 'package:mobile_kary_corenitymps_kbm/blocs/splash/splashscreen_bloc_state.dart';
import 'package:mobile_kary_corenitymps_kbm/main.dart';
import 'package:mobile_kary_corenitymps_kbm/models/version/version_response.dart';
import 'package:mobile_kary_corenitymps_kbm/services/api_endpoint.dart';
import 'package:mobile_kary_corenitymps_kbm/services/api_method.dart';

class SplashScreenBloc extends Bloc<SplashScreenBlocEvent, SplashScreenBlocState> {
  SplashScreenBloc() : super(SplashScreenStateInit(SplashScreenBlocModel.init())) {
    on<SplashScreenBlocEventCheckVersion>((event, emit) async {
      try {
        final versionResponse = await getVersion();
        if (versionResponse == null) {
          emit(SplashScreenBlocStateVersionFailToCheck(state.model));
        } else {
          emit(SplashScreenBlocStateVersionChecked(state.model.copyWith(
            versionResponse: versionResponse
          )));
        }
      } catch (e) {
        emit(SplashScreenBlocStateVersionFailToCheck(state.model));
      }
    });
  }

  // Stream<SplashScreenBlocState> mapEventToState(SplashScreenBlocEvent event)async* {
  //   if (event is SplashScreenBlocEventCheckVersion) {
  //     try {
  //       final versionResponse = await getVersion();

  //       if (versionResponse == null) {
  //         yield SplashScreenBlocStateVersionFailToCheck(state.model);
  //       } else {
  //         yield SplashScreenBlocStateVersionChecked(state.model.copyWith(
  //           versionResponse: versionResponse
  //         ));
  //       }
  //     } catch (e) {
  //       yield SplashScreenBlocStateVersionFailToCheck(state.model);
  //     }
  //   }
  // }
  
  Future<VersionResponse?> getVersion()async{
    try {
      HttpOverrides.global = MyHttpOverrides();
      final Response response = await callService(ApiMethod.getWithoutToken, ApiEndpoint().appVersion());
      if(response.statusCode == 200){
        final jsonRes = json.decode(response.body);
        if(jsonRes['error']==false){
          return VersionResponse.fromJSON(jsonRes["values"]);
        }else{
          return null;
        }
      }else{
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}