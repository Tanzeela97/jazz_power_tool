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

class OnboardingScreenThree extends StatelessWidget {
  OnboardingScreenThree({Key? key}) : super(key: key);
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
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration:   const BoxDecoration(
                image: DecorationImage(
                  image: ImageString.welcomeScreen,
                  fit: BoxFit.fill,
                ),
              ),
              child: Center(
                child: Container(
                  // width: 300.w,
                  // height: 200.h,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20.h,),
                      // Text(
                      //   "اب حاصل کرے بھرپور سہولت جاز جذبہ کے ساتھ",
                      //   textAlign: TextAlign.center,
                      //   maxLines: 4,
                      //   style: TextStyle(
                      //     fontSize: 55.sp,
                      //
                      //     color: AppColor.white,
                      //     fontFamily: "Jameel Noori Nastaleeq",
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      SizedBox(
                        height: 360.h,
                      ),
                      // TextButton(
                      //   onPressed: () {
                      //     Navigator.popAndPushNamed(
                      //         context, RouteString.home);
                      //   },
                      //   child: Container(
                      //     padding: const EdgeInsets.symmetric(
                      //         horizontal: 20, vertical: 10),
                      //     width: 150.w,
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(18),
                      //       gradient: const LinearGradient(
                      //         colors: [AppColor.white, AppColor.red],
                      //         begin: Alignment.topLeft,
                      //         end: Alignment.bottomRight,
                      //       ),
                      //     ),
                      //     child: Text(
                      //       "start".tr,
                      //       textAlign: TextAlign.center,
                      //       style: TextStyle(
                      //         fontSize: 20.sp,
                      //         color: AppColor.white,
                      //         fontFamily: "j_n_n_k",
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.popAndPushNamed(
                                           context, RouteString.home);

                            },
                            child: Image(
                              image: ImageString.start,
                              height: 80.h,
                              width: 320.w,
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
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 10.h),
              child: SmoothPageIndicator(
                controller: PageController(initialPage: 2),
                count: 3,
                effect: WormEffect(
                  activeDotColor: AppColor.red,
                  spacing: 14.w,
                  dotWidth: 16.sp,
                  dotHeight: 16.sp,
                  dotColor: AppColor.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
