import 'dart:math';

import 'package:circular_rotation/circular_rotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../data/constant/app_color.dart';

class Randomizer extends StatefulWidget {
  const Randomizer();

  @override
  State<Randomizer> createState() => _RandomizerState();
}

class _RandomizerState extends State<Randomizer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mood Randomizer'),
        centerTitle: true,
        backgroundColor: AppColor.red,
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        alignment: Alignment.center,
        child: CircularRotation(
          circularRotationProperty: CircularRotationModel(
            // defaultCircleStrokeWidth: Dimens.strokeSmall,
            defaultCircleStrokeColor: Colors.transparent,
           // startAnimation: true,
          //  repeatAnimation: true,
            firstCircleAnimationDuration: 1200,
            // secondCircleAnimationDuration: 10000,
            // thirdCircleAnimationDuration: 10000,
            centerWidget: Container(
              width: 150.w,
              height: 150.h,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColor.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                'How is your Mood?',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 24.w,
                  fontWeight: FontWeight.w400,
                  color: AppColor.fontColorButton,
                ),
              ),
            ),
            visibleSecondCircle: false,
            visibleThirdCircle: false,
            firstCircleWidgets: [
              InkWell(
                onTap: CircularRotation.eitherStartOrStopAnimation,
                child: Container(
                  width: 100.w,
                  height: 100.h,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: AppColor.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    'Happy',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 24.w,
                      fontWeight: FontWeight.w400,
                      color: AppColor.fontColorButton,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: CircularRotation.eitherStartOrStopAnimation,
                child: Container(
                  width: 100.w,
                  height: 100.h,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: AppColor.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    'Sad',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 24.w,
                      fontWeight: FontWeight.w400,
                      color: AppColor.fontColorButton,
                    ),
                  ),
                ),
              ),  InkWell(
                onTap: CircularRotation.eitherStartOrStopAnimation,
                child: Container(
                  width: 100.w,
                  height: 100.h,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: AppColor.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    'Sad',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 24.w,
                      fontWeight: FontWeight.w400,
                      color: AppColor.fontColorButton,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: CircularRotation.eitherStartOrStopAnimation,
                child: Container(
                  width: 100.w,
                  height: 100.h,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: AppColor.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    'Angry',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 24.w,
                      fontWeight: FontWeight.w400,
                      color: AppColor.fontColorButton,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: CircularRotation.eitherStartOrStopAnimation,
                child: Container(
                  width: 100.w,
                  height: 100.h,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: AppColor.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    'Anxious',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 24.w,
                      fontWeight: FontWeight.w400,
                      color: AppColor.fontColorButton,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: CircularRotation.eitherStartOrStopAnimation,
                child: Container(
                  width: 100.w,
                  height: 100.h,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: AppColor.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    'Anxious',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 24.w,
                      fontWeight: FontWeight.w400,
                      color: AppColor.fontColorButton,
                    ),
                  ),
                ),
              ),
            ],
            // secondCircleWidgets: [
            //   InkWell(
            //     onTap: CircularRotation.eitherStartOrStopAnimation,
            //     child: Container(
            //       width: 100.w,
            //       height: 100.h,
            //       alignment: Alignment.center,
            //       decoration: const BoxDecoration(
            //         color: AppColor.red,
            //         shape: BoxShape.circle,
            //       ),
            //       child: Text(
            //         'Anxious',
            //         textAlign: TextAlign.center,
            //         style: GoogleFonts.inter(
            //           fontSize: 24.w,
            //           fontWeight: FontWeight.w400,
            //           color: AppColor.fontColorButton,
            //         ),
            //       ),
            //     ),
            //   ),
            // ],
            // thirdCircleWidgets: [
            //   InkWell(
            //     onTap: CircularRotation.eitherStartOrStopAnimation,
            //     child: Container(
            //       width: 100.w,
            //       height: 100.h,
            //       alignment: Alignment.center,
            //       decoration: const BoxDecoration(
            //         color: AppColor.red,
            //         shape: BoxShape.circle,
            //       ),
            //       child: Text(
            //         'Anxious',
            //         textAlign: TextAlign.center,
            //         style: GoogleFonts.inter(
            //           fontSize: 24.w,
            //           fontWeight: FontWeight.w400,
            //           color: AppColor.fontColorButton,
            //         ),
            //       ),
            //     ),
            //   ),
            //   InkWell(
            //     onTap: CircularRotation.eitherStartOrStopAnimation,
            //     child: Container(
            //       width: 100.w,
            //       height: 100.h,
            //       alignment: Alignment.center,
            //       decoration: const BoxDecoration(
            //         color: AppColor.red,
            //         shape: BoxShape.circle,
            //       ),
            //       child: Text(
            //         'Anxious',
            //         textAlign: TextAlign.center,
            //         style: GoogleFonts.inter(
            //           fontSize: 24.w,
            //           fontWeight: FontWeight.w400,
            //           color: AppColor.fontColorButton,
            //         ),
            //       ),
            //     ),
            //   ),
            // ],

            firstCircleRadius: 320.w,
             //secondCircleRadius: 150.w,
            // thirdCircleRadius: 150.w,
            // secondCircleWidgets: _secondCircleImages,
            // thirdCircleWidgets: _thirdCircleImages,
            // thirdCircleRadians: Dimens.thirdCircleRadians,
            // secondCircleRadians: Dimens.secondCircleRadians,
            // firstCircleRadians: Dimens.firstCircleRadians,
          ),
        ),
      ),
    );
  }
}


