import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_kary_corenitymps_kbm/components/button_rounded.dart';
import 'package:mobile_kary_corenitymps_kbm/components/button_icon_rounded.dart';
import 'package:mobile_kary_corenitymps_kbm/constants/colors.dart';

void showAppDialogError(BuildContext context, img_asset, message, textButton, isIcon, icon, btnColor, txtColor, pressButton) {
  Size size = MediaQuery.of(context).size;
  showGeneralDialog(
    barrierLabel: 'label',
    transitionDuration: const Duration(milliseconds: 200),
    context: context,
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(anim1),
        child: child,
      );
    },
    pageBuilder: (context, anim1, anim2) {
      return WillPopScope(
        onWillPop: () async => false,
        child: Align(
          alignment: Alignment.center,
          child: Container(
            height: size.height * 0.4,
            width: size.width * 0.7,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Material(
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(img_asset,
                      height: 100,
                    ),
                    const Text(
                      'Opppssss...',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      message ?? '',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: Column(
                        children: [
                          isIcon ?
                          ButtonIconRounded(textButton: textButton, press: pressButton, color: btnColor, textColor: txtColor, icon: icon)
                          :
                          ButtonRounded(textButton: textButton, press: pressButton, color: btnColor, textColor: txtColor, isLoading: false)
                        ]
                      )
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  );
}