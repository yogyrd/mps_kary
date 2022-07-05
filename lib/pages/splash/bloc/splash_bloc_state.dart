import 'package:equatable/equatable.dart';

import 'splash_bloc_model.dart';

abstract class SplashBlocState extends Equatable {
  const SplashBlocState(this.model);

  final SplashBlocModel model;

  @override
  List<Object> get props => [];
}

class SplashStateInit extends SplashBlocState {
  const SplashStateInit(SplashBlocModel model) : super(model);

  @override
  List<Object> get props => [model];
}

class SplashBlocStatePackageInformed extends SplashBlocState {
  const SplashBlocStatePackageInformed(SplashBlocModel model) : super(model);

  @override
  List<Object> get props => [model];
}

class SplashBlocStateVersionChecked extends SplashBlocState {
  const SplashBlocStateVersionChecked(SplashBlocModel model) : super(model);

  @override
  List<Object> get props => [model];
}

class SplashBlocStateVersionFailToCheck extends SplashBlocState {
  const SplashBlocStateVersionFailToCheck(SplashBlocModel model) : super(model);

  @override
  List<Object> get props => [model];
}
