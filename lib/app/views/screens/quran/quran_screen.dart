import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/constant/app_color.dart';
import '../../../data/constant/image_string.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen();

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  // color: Colors.black,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Container(
              height: 150.h,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColor.red,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Al-Fatihah',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.fontColorButton,
                    ),
                  ),
                  // SizedBox(
                  //   height: 10.h,
                  // ),
                  const Image(image: ImageString.namaz),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  padding: EdgeInsets.all(15),
                  child: SizedBox(
                    // width: 300.w,
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image(
                              image: ImageString.profileIcon,
                              width: 30.w,
                              height: 30.w,
                              // color: AppColor.fontColorHeading,
                            ),
                            Image(
                              image: ImageString.favoriteIcon,
                              width: 30.w,
                              height: 30.w,
                              // color: AppColor.fontColorHeading,
                            ),
                          ],
                        ),
                        Divider(
                          color: AppColor.dividerColor,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "اَلۡحَمۡدُ لِلّٰہِ رَبِّ الۡعٰلَمِیۡنَ ۙ",
                            // maxLines: 1,
                            // overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.right,
                            style: GoogleFonts.inter(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w600,
                              // color: AppColor.fontColorButton,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "All praise is due to Allah, the Sustainer of all the worlds.",
                            // maxLines: 1,
                            // overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.inter(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              // color: AppColor.fontColorButton,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "سب تعریف اللہ تعالٰی کے لیے ہے جو تمام جہانوں کا پالنے والا ہے ۔",
                            // maxLines: 1,
                            // overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.right,
                            style: GoogleFonts.inter(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              // color: AppColor.fontColorButton,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
