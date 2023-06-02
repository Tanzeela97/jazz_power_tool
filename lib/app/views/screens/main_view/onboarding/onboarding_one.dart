import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../data/constant/app_color.dart';
import '../../../../data/constant/app_string.dart';
import '../../../../data/constant/image_string.dart';
import '../../../../data/constant/route_string.dart';

class OnboardingScreenOne extends StatelessWidget {
  OnboardingScreenOne({Key? key}) : super(key: key);
  DateTime currentBackPressTime = DateTime.now();

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > const Duration(seconds: 1)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: AppString.exit);

      return Future.value(false);
    }
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration:  const BoxDecoration(
                  image: DecorationImage(
                    image: ImageString.splashScreen1,
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Image(
                    //   image: ImageString.mosque,
                    //   width: 250.w,
                    //   // height: 50.h,
                    //   fit: BoxFit.fitWidth,
                    // ),
                    SizedBox(
                      height: 100.h,
                    ),
                    // Container(
                    //   constraints:
                    //   BoxConstraints(minHeight: 200.h, maxHeight: 500),
                    //   width: 300.w,
                    //   height: 200.h,
                    //   alignment: Alignment.center,
                    //   // decoration:  BoxDecoration(
                    //   //   image: DecorationImage(
                    //   //     image: ImageString.splashScreen1,
                    //   //     // fit: BoxFit.fill,
                    //   //   ),
                    //   // ),
                    //   child: Text(
                    //     "welcome".tr,
                    //     textAlign: TextAlign.center,
                    //     style: TextStyle(
                    //       fontSize: 35.sp,
                    //       color: AppColor.fontColor,
                    //       fontFamily: "j_n_n_k",
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 380.h,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RouteString.onboardingTwo);
                          },
                          child: Image(
                            image: ImageString.leftArrow,
                            height: 60.h,
                            width: 89.w,
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 50.h,
                    // ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 10.w),
                child: SmoothPageIndicator(
                  controller: PageController(initialPage: 0),
                  count: 3,
                  effect: WormEffect(
                    activeDotColor: AppColor.red,
                    spacing: 14.w,
                    dotWidth: 16.sp,
                    dotHeight: 16.sp,
                    dotColor: AppColor.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
