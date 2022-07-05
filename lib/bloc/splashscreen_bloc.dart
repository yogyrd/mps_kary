import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splashscreen_event.dart';
part 'splashscreen_state.dart';

class SplashscreenBloc extends Bloc<SplashscreenEvent, SplashscreenState> {
  SplashscreenBloc() : super(SplashscreenInitial()) {
    on<SplashscreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
