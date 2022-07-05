import 'package:equatable/equatable.dart';
import 'package:mobile_kary_corenitymps_kbm/blocs/splash/splashscreen_bloc_model.dart';

class SplashScreenBlocState extends Equatable {
  const SplashScreenBlocState(this.model);

  final SplashScreenBlocModel model;

  @override
  List<Object> get props => [];
}

class SplashScreenStateInit extends SplashScreenBlocState {
  const SplashScreenStateInit(SplashScreenBlocModel model) : super(model);

  @override
  List<Object> get props => [model];
}

class SplashScreenBlocStateVersionChecked extends SplashScreenBlocState {
  const SplashScreenBlocStateVersionChecked(SplashScreenBlocModel model) : super(model);

  @override
  List<Object> get props => [model];
}

class SplashScreenBlocStateVersionFailToCheck extends SplashScreenBlocState {
  const SplashScreenBlocStateVersionFailToCheck(SplashScreenBlocModel model) : super(model);

  @override
  List<Object> get props => [model];
}