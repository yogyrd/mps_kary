import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_kary_corenitymps_kbm/constants/colors.dart';

class InputContainer extends StatelessWidget {
  const InputContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary:AppColors.prurussianBlue,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),

        child: child
      )
    );
  }
}