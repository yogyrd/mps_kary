import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile_kary_corenitymps_kbm/pages/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}


 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Corenity MPS KBM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Nunito',
        primarySwatch: Colors.red,
      ),
      home: const SplashScreen(),
    );
  }
}
