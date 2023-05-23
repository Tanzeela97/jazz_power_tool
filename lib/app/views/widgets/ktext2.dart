import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/constant/app_color.dart';

class KText2 extends StatelessWidget {
  const KText2({
 //   super.key,
    required this.text,
    required this.fontSize,
  });

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(

      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontFamily: 'Jameel Noori Nastaleeq',
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: AppColor.fontColor,
      ),
    );
  }
}
