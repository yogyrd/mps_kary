// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobile_kary_corenitymps_kbm/components/input_container.dart';
import 'package:mobile_kary_corenitymps_kbm/constants/colors.dart';

class RoundedInput extends StatelessWidget {
  const RoundedInput({
    Key? key,
    required this.icon,
    required this.hint,
    required this.controller
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Mohon input $hint';
          } else {
            return null;
          }
        },
        autofocus: false,
        controller: controller,
        cursorColor: AppColors.firebrik,
        decoration: InputDecoration(
          fillColor: Colors.white, filled: true,
          contentPadding: EdgeInsets.symmetric(
              vertical: 3.0, horizontal: 10.0
          ),
          labelStyle: TextStyle(fontSize: 14, fontFamily: 'Nunito'),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.firebrik, width: 1
            ),
            borderRadius: BorderRadius.all(Radius.circular(15.0))
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.firebrik, 
              width: 1
            ),
            borderRadius: BorderRadius.all(Radius.circular(15.0))
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.firebrik, width: 1
            ),
            borderRadius:BorderRadius.all(Radius.circular(15.0))
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: AppColors.firebrik, width: 1
            ),
            borderRadius: BorderRadius.all(Radius.circular(15.0))
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: AppColors.firebrik, width: 1
            ),
            borderRadius:
              BorderRadius.all(Radius.circular(15.0))
          ),
          prefixIcon: Icon(Icons.person,),
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.grey, // <-- Change this
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
          ),
        )
      )
    );
  }
}