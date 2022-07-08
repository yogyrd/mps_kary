import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobile_kary_corenitymps_kbm/constants/colors.dart';

class ButtonRounded extends StatelessWidget {
  final String textButton;
  final VoidCallback press;
  final Color color, textColor;
  final bool isLoading;

  const ButtonRounded({
    Key? key,
    required this.textButton,
    required this.press,
    required this.color,
    required this.textColor,
    required this.isLoading
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),

      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
            primary: color,
            minimumSize: const Size(4000, 40),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            textStyle: TextStyle(
              fontSize: 18,
              color: textColor,
              fontWeight: FontWeight.bold
            )
          ),
        child: isLoading ?  
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              child: CircularProgressIndicator(color: Colors.white),
              height: 12,
              width: 12,
            ),
            SizedBox(width: 10),
            Text('Sedang diproses...')
          ],
        )
        : 
        Text(textButton)
      )
    );
  }
}