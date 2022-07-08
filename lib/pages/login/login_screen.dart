import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_kary_corenitymps_kbm/components/button_icon_rounded.dart';
import 'package:mobile_kary_corenitymps_kbm/components/button_rounded.dart';
import 'package:mobile_kary_corenitymps_kbm/components/passwrod_input.dart';
import 'package:mobile_kary_corenitymps_kbm/components/popup_message.dart';
import 'package:mobile_kary_corenitymps_kbm/components/rounded_input.dart';
import 'package:mobile_kary_corenitymps_kbm/constants/colors.dart';
import 'package:mobile_kary_corenitymps_kbm/models/login/login_body.dart';
import 'package:mobile_kary_corenitymps_kbm/pages/login/bloc/login_bloc.dart';
import 'package:mobile_kary_corenitymps_kbm/pages/login/bloc/login_bloc_event.dart';
import 'package:mobile_kary_corenitymps_kbm/pages/login/bloc/login_bloc_state.dart';
import 'package:mobile_kary_corenitymps_kbm/pages/root/root_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _isObscured = true;

  final _formKey = GlobalKey<FormState>();
  TextEditingController idCon = TextEditingController();
  TextEditingController pwdCon = TextEditingController();


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void showPassword() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double defaultLoginSize = size.height - (size.height * 0.2);

    return BlocListener<LoginBloc, LoginBlocState>(
      listener: (context, stateListener) {
        if (stateListener is LoginBlocStateFailed) {
          if (stateListener.model.loginResponse == null) {
            String message = 'Terjadi kesalahan pada koneksi \n'
            'Periksa koneksi internet kamu dulu ya!';
            showAppDialogError(
              context, 
              'assets/images/smartphone_error.png', 
              message, 
              'OK', 
              false,
              null, 
              AppColors.firebrik, 
              Colors.white,
              () => {
                Navigator.pop(context, false)
              }
            );
          }
        } else if (stateListener is LoginBlocStateRequestFailed) {
          String message = 'Terjadi kesalahan pada server \n'
            'Tolong hubungi korlap atau Tim IT PT. KBM';
          showAppDialogError(
            context, 
            'assets/images/smartphone_error.png', 
            message, 
            'OK', 
            false,
            Image.asset('assets/images/playstore.png',height: size.width * 0.05,), 
            AppColors.firebrik, 
            Colors.white,
            () => {
              Navigator.pop(context, false)
            }
          );
        } else if (stateListener is LoginBlocStateSuccesed) {
          var state = stateListener.model.loginResponse;
          if (state?.code == 200) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_)=> const RootScreen())
            );
          } else {
            String? message = state?.message;
            showAppDialogError(
              context, 
              'assets/images/unauthorized.png', 
              message, 
              'OK', 
              false,
              null,
              AppColors.firebrik, 
              Colors.white,
              () => {
                Navigator.pop(context, false)
              }
            );
          }
        }
      },
      child: BlocBuilder<LoginBloc, LoginBlocState>(
        builder: (context, state) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Form(
                key: _formKey,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: const [0.5, 1.0],
                      colors: [Colors.white, Colors.red.shade300]
                    )
                  ),
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    body: Stack(
                      children: [
                        Positioned(
                          top: -70,
                          right: 220,
                          child: Container(
                            width: 250,
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              color: Colors.red.shade200,
                            ),
                          ),
                        ),
                        Positioned(
                          top: -70,
                          right: 150,
                          child: Container(
                            width: 160,
                            height: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.red.shade300,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SingleChildScrollView(
                            child: Container(
                              width: size.width,
                              height: defaultLoginSize,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/images/logo_transparent.png",
                                    width: size.width * 0.30
                                  ),
                                  const Text(
                                    'CorenityMPS PT. KBM',
                                    style: TextStyle(color: AppColors.darkGrey, fontSize: 18, fontFamily: 'NunitoBold', fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 50),
                                  
                                  RoundedInput(icon: Icons.person, hint: 'USER ID', controller: idCon),

                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  
                                  PasswordInput(icon: Icons.key, hint: 'PASSWORD', controller: pwdCon, isObsecured: _isObscured, tap: showPassword),
                                  
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  state is LoginBlocStateInProgress ?
                                  ButtonRounded(
                                    textButton: '', 
                                    press: () => {}, 
                                    color: AppColors.firebrik, 
                                    textColor: Colors.white, 
                                    isLoading: true
                                  )
                                  :
                                  ButtonIconRounded(
                                    textButton: 'Login', 
                                    press: () {
                                      if (_formKey.currentState!.validate()) {
                                        context.read<LoginBloc>().add(LoginBlocEventAuthProcess(
                                          body: LoginBody(
                                            id: idCon.text,
                                            password: pwdCon.text
                                          )
                                        ));
                                      }
                                    },
                                    color: AppColors.firebrik,
                                    textColor: Colors.white, 
                                    icon: const Icon(Icons.login)
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ),
              )
            )
          );
        },
      )
    );
  }
}