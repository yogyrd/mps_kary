import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_kary_corenitymps_kbm/models/erorr/error_response.dart';
import 'package:mobile_kary_corenitymps_kbm/pages/login/bloc/login_bloc_event.dart';
import 'package:mobile_kary_corenitymps_kbm/pages/login/bloc/login_bloc_model.dart';
import 'package:mobile_kary_corenitymps_kbm/pages/login/bloc/login_bloc_state.dart';
import 'package:mobile_kary_corenitymps_kbm/pages/login/data/login_repository.dart';

class LoginBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginBloc() : super(LoginStateInit(LoginBlocModel.init())) {
    on<LoginBlocEventAuthProcess>((event, emit) async {
        emit(LoginBlocStateInProgress(state.model));
        try {
          var map = event.body?.toMap();
          final loginResponse = await LoginRepository().auth(map!);
          if (loginResponse == null) {
            emit(LoginBlocStateFailed(state.model));
          } else {
            if (loginResponse is ErrorResponse) {
              emit(LoginBlocStateRequestFailed(state.model));
            } else {
              emit(
              LoginBlocStateSuccesed(
                state.model.copyWith(
                  loginResponse: loginResponse.item1
                )
              )
            );
            }
          }
        } catch (e) {
          emit(LoginBlocStateFailed(state.model));
        }
    });
  }
}