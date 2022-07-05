// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:mobile_kary_corenitymps_kbm/components/login-screen/passwrod-input.dart';
import 'package:mobile_kary_corenitymps_kbm/components/rounded_input.dart';
import 'package:mobile_kary_corenitymps_kbm/constants/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double viewInset = MediaQuery.of(context).viewInsets.bottom;
    double defaultLoginSize = size.height - (size.height * 0.2);

    return Scaffold(
      backgroundColor: AppColors.grey,
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
                    Text(
                      'CorenityMPS PT. KBM',
                      style: TextStyle(color: AppColors.prurussianBlue, fontSize: 18, fontFamily: 'NunitoBold'),
                    ),
                    SizedBox(height: 50),
                    
                    RoundedInput(icon: Icons.person, hint: 'USER ID'),

                    SizedBox(
                      height: 20.0,
                    ),
                    
                    PasswordInput(icon: Icons.key, hint: 'PASSWORD'),
                    
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: Column(
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.prurussianBlue,
                              minimumSize: Size(4000, 45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            label: Text('Login', style: TextStyle(fontSize: 18),),
                            icon: Icon(Icons.login),
                          )
                        ]
                      )
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}