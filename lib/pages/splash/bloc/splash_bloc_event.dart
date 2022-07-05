import 'package:equatable/equatable.dart';

abstract class SplashBlocEvent extends Equatable {
  const SplashBlocEvent();

  @override
  List<Object> get props => [];
}

class SplashBlocEventRemember extends SplashBlocEvent {}

class SplashBlocEventCheckVersion extends SplashBlocEvent {}
