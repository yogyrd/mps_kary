import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mobile_kary_corenitymps_kbm/components/popup_message.dart';
import 'package:mobile_kary_corenitymps_kbm/constants/colors.dart';
import 'package:mobile_kary_corenitymps_kbm/pages/login/login_screen.dart';
import 'package:mobile_kary_corenitymps_kbm/pages/splash/bloc/splash_bloc.dart';
import 'package:mobile_kary_corenitymps_kbm/pages/splash/bloc/splash_bloc_event.dart';
import 'package:mobile_kary_corenitymps_kbm/pages/splash/bloc/splash_bloc_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashBloc(),
      child: const SplashView(),
    );
  }
}

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => SplashViewState();
}

class SplashViewState extends State<SplashView> {

  @override
  void initState() {
    super.initState();
    var d = const Duration(seconds: 2);

    Future.delayed(d, () {
      context.read<SplashBloc>().add(SplashBlocEventCheckVersion());
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    return BlocListener<SplashBloc, SplashBlocState>(
      listener: (context, stateListener) {
        if (stateListener is SplashBlocStateVersionChecked) {
          if (stateListener.model.versionResponse?.version != stateListener.model.packageInfo?.version) {
            String message = 'Versi aplikasi sudah usang nih... \n'
                      'Yuk, update yang terbaru!';
            showAppDialogError(
              context, 
              'assets/images/smartphone_error.png', 
              message, 
              'Update', 
              true,
              Image.asset('assets/images/playstore.png',height: size.width * 0.05,), 
              AppColors.firebrik, 
              Colors.white,
              () => {}
            );
          } else {
            Navigator.pushAndRemoveUntil(
              context, 
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => const LoginScreen(),
                transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                transitionDuration: const Duration(milliseconds: 1000),
              ), 
              (route) => false
            );
          }
        } else {
          String message = 'Periksa koneksi internet kamu dulu ya..!';
          showAppDialogError(
            context, 
            'assets/images/no_connection.png', 
            message, 
            'OK', 
            false,
            null,
            AppColors.firebrik, 
            Colors.white,
            () => {
              SystemNavigator.pop()
            }
          );
        }
      },
      child: BlocBuilder<SplashBloc, SplashBlocState>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.5, 1.0],
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
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Image.asset(
                            "assets/images/logo_transparent.png",
                            width: width * 0.35,
                          ),
                        ),
                        const Text(
                          "Corenity MPS PT. KBM",
                          style: TextStyle(
                              fontFamily: 'NunitoBold',
                              fontSize: 25,
                              color: Colors.black87),
                        ),
                        Text(
                          state.model.packageInfo?.version ?? '',
                          style: const TextStyle(
                              fontFamily: 'NunitoBold',
                              fontSize: 16,
                              color: AppColors.darkGrey),
                        ),
                        Center(
                          child: loading(),
                        ),
                        const Text(
                          'Checking Version...',
                          style: TextStyle(
                              fontFamily: 'NunitoBold',
                              fontSize: 12,
                              color: Colors.black38),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          );
        },
      ),
    );
  }

  Widget loading() {
    double width = MediaQuery.of(context).size.width;

    return LoadingAnimationWidget.flickr(
      leftDotColor: AppColors.firebrik.withOpacity(0.7),
      rightDotColor: AppColors.firebrik.withOpacity(0.4),
      size: width * 0.1,
    );
  }
}