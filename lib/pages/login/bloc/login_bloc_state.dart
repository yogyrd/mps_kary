import 'package:equatable/equatable.dart';
import 'package:mobile_kary_corenitymps_kbm/pages/login/bloc/login_bloc_model.dart';

class LoginBlocState extends Equatable {
  final LoginBlocModel model;

  const LoginBlocState(this.model);

  @override
  List<Object> get props => [];
}

class LoginStateInit extends LoginBlocState {
  const LoginStateInit(LoginBlocModel model) : super(model);

  @override
  List<Object> get props => [model];
}

class LoginBlocStateInProgress extends LoginBlocState {
  const LoginBlocStateInProgress(super.model);
}

class LoginBlocStateSuccesed extends LoginBlocState {
  const LoginBlocStateSuccesed(LoginBlocModel model) : super(model);

  @override
  List<Object> get props => [model];
}

class LoginBlocStateFailed extends LoginBlocState {
  const LoginBlocStateFailed(LoginBlocModel model) : super(model);

  @override
  List<Object> get props => [model];
}

class LoginBlocStateRequestFailed extends LoginBlocState {
  const LoginBlocStateRequestFailed(LoginBlocModel model) : super(model);
  
  @override
  List<Object> get props => [model];
}