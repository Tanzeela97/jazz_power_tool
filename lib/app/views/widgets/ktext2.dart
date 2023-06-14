import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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
    String lang = Get.locale!.toLanguageTag();
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Text(

      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontFamily: lang == "ur"
            ? "Jameel Noori Nastaleeq"
            : "Poppins",
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: isDarkMode ? AppColor.white : AppColor.black,
      ),
    );
  }
}
