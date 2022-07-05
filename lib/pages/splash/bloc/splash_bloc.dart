import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../data/splash_repository.dart';
import 'splash_bloc_event.dart';
import 'splash_bloc_model.dart';
import 'splash_bloc_state.dart';

class SplashBloc extends Bloc<SplashBlocEvent, SplashBlocState> {
  SplashBloc() : super(SplashStateInit(SplashBlocModel.init())) {
    on<SplashBlocEventCheckVersion>(
      (event, emit) async {
        final info = await PackageInfo.fromPlatform();

        emit(SplashBlocStatePackageInformed(
            state.model.copyWith(packageInfo: info)));

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
                ),
              ),
            );
          }
        } catch (e) {
          emit(SplashBlocStateVersionFailToCheck(state.model));
        }
      },
    );
  }
}
