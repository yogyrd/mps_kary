import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobile_kary_corenitymps_kbm/constants/colors.dart';

class ButtonIconRounded extends StatelessWidget {
  final String textButton;
  final VoidCallback press;
  final Color color, textColor;
  final Widget icon;

  const ButtonIconRounded({
    Key? key,
    required this.textButton,
    required this.press,
    required this.color,
    required this.textColor,
    required this.icon,
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
      // child: Column(
      //   children: [
          child: ElevatedButton.icon(
            onPressed: press,
            style: ElevatedButton.styleFrom(
              primary: color,
              minimumSize: const Size(4000, 45),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            label: Text(
              textButton, 
              style: TextStyle(
                fontSize: 18,
                color: textColor,
                  fontWeight: FontWeight.bold
              )
            ),
            icon: icon,
          )
      //   ]
      // )
    );
  }
}