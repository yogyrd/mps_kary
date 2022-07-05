import 'package:equatable/equatable.dart';

abstract class SplashScreenBlocEvent extends Equatable {
  const SplashScreenBlocEvent();

  @override
  List<Object> get props => [];
}

class SplashScreenBlocEventRemember extends SplashScreenBlocEvent {}

class SplashScreenBlocEventCheckVersion extends SplashScreenBlocEvent {}
