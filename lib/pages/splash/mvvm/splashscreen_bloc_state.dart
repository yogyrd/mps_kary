import 'package:equatable/equatable.dart';

import 'splashscreen_bloc_model.dart';

abstract class SplashScreenBlocState extends Equatable {
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

class SplashScreenBlocStatePackageInformed extends SplashScreenBlocState {
  const SplashScreenBlocStatePackageInformed(SplashScreenBlocModel model)
      : super(model);

  @override
  List<Object> get props => [model];
}

class SplashScreenBlocStateVersionChecked extends SplashScreenBlocState {
  const SplashScreenBlocStateVersionChecked(SplashScreenBlocModel model)
      : super(model);

  @override
  List<Object> get props => [model];
}

class SplashScreenBlocStateVersionFailToCheck extends SplashScreenBlocState {
  const SplashScreenBlocStateVersionFailToCheck(SplashScreenBlocModel model)
      : super(model);

  @override
  List<Object> get props => [model];
}
