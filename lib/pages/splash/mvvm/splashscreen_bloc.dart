import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../data/splashscreen_repository.dart';
import 'splashscreen_bloc_event.dart';
import 'splashscreen_bloc_model.dart';
import 'splashscreen_bloc_state.dart';

class SplashScreenBloc
    extends Bloc<SplashScreenBlocEvent, SplashScreenBlocState> {
  SplashScreenBloc()
      : super(SplashScreenStateInit(SplashScreenBlocModel.init())) {
    on<SplashScreenBlocEventCheckVersion>(
      (event, emit) async {
        final info = await PackageInfo.fromPlatform();

        emit(SplashScreenBlocStatePackageInformed(
            state.model.copyWith(packageInfo: info)));

        try {
          final versionResponse = await SplashscreenRepository().getVersion();
          if (versionResponse == null) {
            emit(SplashScreenBlocStateVersionFailToCheck(state.model));
          } else {
            emit(
              SplashScreenBlocStateVersionChecked(
                state.model.copyWith(
                  versionResponse: versionResponse,
                  packageInfo: info,
                ),
              ),
            );
          }
        } catch (e) {
          emit(SplashScreenBlocStateVersionFailToCheck(state.model));
        }
      },
    );
  }
}
