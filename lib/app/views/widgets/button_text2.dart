import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/constant/app_color.dart';

class ButtonText2 extends StatelessWidget {
  const ButtonText2({
    //super.key,
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
      textAlign: TextAlign.center,
      style: GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: AppColor.fontColorButton,
      ),
    );
  }
}
