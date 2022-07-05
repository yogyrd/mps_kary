import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mobile_kary_corenitymps_kbm/constants/colors.dart';

import 'bloc/splash_bloc.dart';
import 'bloc/splash_bloc_event.dart';
import 'bloc/splash_bloc_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (_) => SplashBloc(),
      child: const SplashView(),
    );
  }
}

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  double? width, height, heightContent;

  @override
  void initState() {
    super.initState();
    context.read<SplashBloc>().add(SplashBlocEventCheckVersion());
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return BlocListener<SplashBloc, SplashBlocState>(
      listener: (context, stateListener) {
        if (stateListener is SplashBlocStateVersionChecked) {
          debugPrint(stateListener.model.packageInfo?.version);
        }
      },
      child: BlocBuilder<SplashBloc, SplashBlocState>(
        builder: (context, state) {
          return Scaffold(
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
                      color: AppColors.firebrik.withOpacity(0.2),
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
                      color: AppColors.firebrik.withOpacity(0.3),
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
                            color: AppColors.darkGrey),
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
                            color: AppColors.darkGrey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget loading() {
    double width = MediaQuery.of(context).size.width;

    return LoadingAnimationWidget.flickr(
      leftDotColor: AppColors.prurussianBlue.withOpacity(0.7),
      rightDotColor: AppColors.firebrik.withOpacity(0.5),
      size: width * 0.1,
    );
  }
}
