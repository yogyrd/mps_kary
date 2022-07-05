import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mobile_kary_corenitymps_kbm/blocs/splash/splashscreen_bloc_event.dart';
import 'package:mobile_kary_corenitymps_kbm/blocs/splash/splashscreen_bloc_state.dart';
import 'package:mobile_kary_corenitymps_kbm/blocs/splash/splashscreen_block.dart';
import 'package:mobile_kary_corenitymps_kbm/constants/colors.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashScreenBloc(),
      child: SplashScreen(),
    );
  }
  
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashScreenBloc provider;
  double? width, height, heightContent;
  PackageInfo _packageInfo = PackageInfo(
    appName: '',
    packageName: '',
    version: '',
    buildNumber: '',
    buildSignature: ''
  );

  @override
  void initState() {
    super.initState();
     _initPackageInfo();
    provider = BlocProvider.of<SplashScreenBloc>(context);
    provider.add(SplashScreenBlocEventCheckVersion());
  }

  @override
  void dispose() {
    super.dispose();
    provider.close();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return BlocListener<SplashScreenBloc, SplashScreenBlocState>(
      listener: (context, stateListener) {
        if (stateListener is SplashScreenBlocStateVersionChecked) {
          print(_packageInfo.version);
        } else {
          print('testtse');
          provider.add(SplashScreenBlocEventRemember());
        }
      },
      child: Scaffold(
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
                  Text(
                    "Corenity MPS PT. KBM",
                    style: TextStyle(
                      fontFamily: 'NunitoBold',
                      fontSize: 25,
                      color: AppColors.darkGrey
                    ),
                  ),
                  Text(
                    _packageInfo.version,
                    style: TextStyle(
                      fontFamily: 'NunitoBold',
                      fontSize: 16,
                      color: AppColors.darkGrey
                    ),
                  ),
                  Center(
                    child: loading(),
                  ),
                  Text(
                    'Checking Version...',
                    style: TextStyle(
                      fontFamily: 'NunitoBold',
                      fontSize: 12,
                      color: AppColors.darkGrey
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget loading() {
    double width = MediaQuery.of(context).size.width;

    return LoadingAnimationWidget.flickr(
      leftDotColor: AppColors.prurussianBlue.withOpacity(0.7), 
      rightDotColor: AppColors.firebrik.withOpacity(0.5), 
      size: width * 0.1
    );
  }
}

