import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/constant/app_color.dart';

class KText1 extends StatelessWidget {
   KText1({Key? key,
  //  super.key,
    required this.text,
    required this.fontSize,
    required this.fontWeight, required String fontFamily, this. color,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  Color? color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: fontWeight,

      ),
    );
  }
}
