import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/constant/app_color.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonText2 extends StatelessWidget {
  ButtonText2({Key? key,

    required this.text,
    required this.fontSize,
    this.color = AppColor.white,
    this.fontFamily,
    required this.fontWeight,
  }) : super(key: key);

  final String text;
  final double fontSize;
  Color color;
  String? fontFamily = "Poppins";
  FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,

    //  textDirection: TextDirection.ltr,
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: AppColor.fontColorButton,
      ),
    );
  }
}
