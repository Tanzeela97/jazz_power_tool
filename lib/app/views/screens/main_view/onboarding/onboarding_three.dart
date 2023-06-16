import 'package:cache_manager/core/write_cache_service.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:jazzpowertoolsapp/app/controller/home_screen/home_screen_controller.dart';
import 'package:jazzpowertoolsapp/app/controller/language/language.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../data/constant/app_color.dart';
import '../../../../data/constant/app_string.dart';
import '../../../../data/constant/image_string.dart';
import '../../../../data/constant/route_string.dart';

class OnboardingScreenThree extends StatelessWidget {
  OnboardingScreenThree({Key? key}) : super(key: key);
  DateTime currentBackPressTime = DateTime.now();
  final languageController = Get.put(MoreScreenController());
  HomeScreenController homeScreenController = Get.find();

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
    String lang = Get.locale!.languageCode;
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
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: ImageString.background,
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Container(
                    width: double.infinity,
                    // height: 200.h,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            width: 120,
                            child: GetBuilder<MoreScreenController>(
                              builder: (_) => DropdownButton2(
                                isExpanded: true,
                                items: languageController.listOfLanguage
                                    .map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Text(
                                        items,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.normal,
                                          color: AppColor.white,
                                          fontFamily: lang == "ur"
                                              ? "j_n_n"
                                              : "Poppins",
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                                value: languageController.language,
                                underline: SizedBox.shrink(),
                                onChanged: (String? newValue) async {
                                  languageController.setLanguage(newValue!);
                                  var locale = const Locale("ur", "PK");
                                  if (newValue == "English") {
                                    if (homeScreenController.login) {
                                      await WriteCache.setString(
                                          key: "lang", value: "en");
                                      locale = const Locale("en", "US");
                                    } else {
                                      await WriteCache.setString(
                                          key: "lang", value: "ur");
                                      locale = const Locale("en", "PK");
                                    }
                                  } else {
                                    if (homeScreenController.login) {
                                      await WriteCache.setString(
                                          key: "lang", value: "en");
                                      // locale = const Locale("en", "US");
                                    } else {
                                      await WriteCache.setString(
                                          key: "lang", value: "ur");
                                      // locale = const Locale("ur", "PK");
                                    }
                                  }
                                  // Navigator.pop(context);
                                  Get.updateLocale(locale);
                                  print(lang);
                                  // setState(() {});
                                },
                                buttonStyleData: ButtonStyleData(
                                  // height: 50,
                                  width: 120,
                                  // padding: const EdgeInsets.only(left: 14, right: 14),

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    border: Border.all(
                                      color: Colors.black26,
                                    ),
                                    // color: AppColor.white,
                                    gradient: const LinearGradient(
                                      colors: [
                                        AppColor.red,
                                        AppColor.red,
                                        AppColor.red,
                                        AppColor.colorDemo,
                                      ],
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                    ),
                                  ),

                                  elevation: 2,
                                ),
                                iconStyleData: const IconStyleData(
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                  ),
                                  iconEnabledColor: AppColor.white,
                                ),
                                dropdownStyleData: DropdownStyleData(
                                  // maxHeight: 200,
                                  width: 120,
                                  padding: null,

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    gradient: const LinearGradient(
                                      colors: [
                                        AppColor.red,
                                        AppColor.red,
                                        AppColor.red,
                                        AppColor.colorDemo,
                                      ],
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                    ),
                                  ),
                                  elevation: 8,
                                  offset: const Offset(0, -5),
                                  scrollbarTheme: ScrollbarThemeData(
                                    radius: const Radius.circular(40),
                                    thickness:
                                        MaterialStateProperty.all<double>(6),
                                    thumbVisibility:
                                        MaterialStateProperty.all<bool>(true),
                                  ),
                                ),
                                menuItemStyleData: const MenuItemStyleData(
                                  height: 40,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "آپ کی ڈیجیٹل لائف اسٹائل",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 50.sp,
                              color: AppColor.white,
                              fontFamily: "Jameel Noori Nastaleeq",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Your digital lifestyle companion",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 40.sp,
                              color: AppColor.white,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.popAndPushNamed(
                                context, RouteString.home);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            width: 300.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: const Color(0xffC12727),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Start",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color: AppColor.yellow,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  " | ",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color: AppColor.white,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  "شروع کریں",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 24.sp,
                                    color: AppColor.yellow,
                                    fontFamily: "Jameel Noori Nastaleeq",
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
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
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 10.h),
              //   child: SmoothPageIndicator(
              //     controller: PageController(initialPage: 2),
              //     count: 3,
              //     effect: WormEffect(
              //       activeDotColor: AppColor.pink,
              //       spacing: 14.w,
              //       dotWidth: 16.sp,
              //       dotHeight: 16.sp,
              //       dotColor: AppColor.lightPink,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
