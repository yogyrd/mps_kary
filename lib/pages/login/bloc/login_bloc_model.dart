import 'package:mobile_kary_corenitymps_kbm/models/login/login_reseponse.dart';

class LoginBlocModel {
  final LoginResponse? loginResponse;

  const LoginBlocModel({
    this.loginResponse
  });

  factory LoginBlocModel.init() {
    return const LoginBlocModel();
  }

  LoginBlocModel copyWith({
    LoginResponse? loginResponse
  }) => LoginBlocModel(
    loginResponse: loginResponse ?? this.loginResponse
  );
  
  @override
  List<Object?> get props => [loginResponse];
}