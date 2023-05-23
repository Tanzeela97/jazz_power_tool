import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/constant/app_color.dart';

class Heading2 extends StatelessWidget {
  const Heading2({
   // super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.inter(
        fontSize: 10.w,
        fontWeight: FontWeight.w400,
        color: AppColor.fontColorHeading,
      ),
    );
  }
}
