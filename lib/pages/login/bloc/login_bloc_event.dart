import 'package:equatable/equatable.dart';
import 'package:mobile_kary_corenitymps_kbm/models/login/login_body.dart';

class LoginBlocEvent extends Equatable {
  const LoginBlocEvent();

  @override
  List<Object> get props => [];
}

class LoginBlocEventAuthProcess extends LoginBlocEvent {
  final LoginBody? body;
  
  const LoginBlocEventAuthProcess({this.body});

  @override
  List<Object> get props => [];
}

class LoginBlocEventSuccess extends LoginBlocEvent {
  final String id;
  final String passowrd;

  const LoginBlocEventSuccess(this.id, this.passowrd);

  @override
  List<Object> get props => [id, passowrd]; 
}