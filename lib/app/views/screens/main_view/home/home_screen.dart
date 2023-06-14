import 'dart:async';
import 'package:circular_rotation/circular_rotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jazzpowertoolsapp/app/model/news_feed.dart' as news_feed;
import 'package:jazzpowertoolsapp/app/views/widgets/widget_loader.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'package:shimmer/shimmer.dart';

import '../../../../controller/home_screen/home_screen_controller.dart';
import '../../../../data/constant/app_color.dart';
import '../../../../data/constant/image_string.dart';
import '../../../../data/constant/route_string.dart';
import '../../../../model/forex.dart' as for_ex;
import '../../../../services/remote_services.dart';

import '../../../widgets/button_text2.dart';
import '../../../widgets/ktext2.dart';
import '../ayat/ayat.dart';
import '../joke/joke.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Duration _duration = const Duration(minutes: 100);
  final Duration _elapsed = Duration.zero;
  final homeController = Get.put(
      HomeScreenController(const bool.fromEnvironment('dart.library.js_util')));
  List<news_feed.Data>? newsFeeds;
  List<for_ex.Data>? forex;
  bool kIsWeb = const bool.fromEnvironment('dart.library.js_util');
  int maxVisibleItems = 4;
  bool showAllItems = false;
  bool isLoading = true;

  @override
  void initState() {
    homeController.setWeb(kIsWeb);

    //getFetchNewsFeed();
    super.initState();
    // Timer.periodic(const Duration(minutes: 1), (timer) {
    //   setState(() {
    //     _elapsed += const Duration(minutes: 1);
    //   });
    //   if (_elapsed >= _duration) {
    //     timer.cancel();
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    String lang = Get.locale!.toLanguageTag();
    return Scaffold(
        backgroundColor: AppColor.scaffoldBackgroundColor,
        body: SafeArea(
            child: SingleChildScrollView(
                child: GetBuilder<HomeScreenController>(
          builder: (_) => homeController.isLoading == false
              ? Container(
                  color: isDarkMode ? AppColor.black : AppColor.white,
                  child: Column(
                    children: [
                      Container(
                        height: 200.h,
                        width: double.infinity,
                        // padding: const EdgeInsets.fromLTRB(25, 8, 25, 20),
                        decoration: BoxDecoration(
                            color: isDarkMode ? AppColor.black : AppColor.white,
                            // color: AppColor.white,
                            image: const DecorationImage(
                              image: ImageString.backgroundImage,
                              fit: BoxFit.fill,
                            ),
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10)),
                            gradient: const LinearGradient(
                              // begin: lang == "ur-PK"
                              //     ? Alignment.centerRight
                              //     : Alignment.centerLeft,
                              // end: lang == "ur-PK"
                              //     ? Alignment.centerLeft
                              //     : Alignment.centerRight,
                              colors: [
                                AppColor.red,
                                AppColor.red,
                              ],
                            )),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 30.h,
                            ),
                            Expanded(
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 14.w,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      if (homeController.login == false) {
                                        homeController
                                            .snackBar("login_first".tr);
                                        return;
                                      }
                                      Navigator.pushNamed(
                                          context, RouteString.profileDetail);

                                    },
                                    child: Container(
                                      constraints: const BoxConstraints(
                                        maxHeight: 60,
                                        maxWidth: 60,
                                      ),
                                      width: 60.w,
                                      height: 60.w,
                                      child: CircleAvatar(
                                        backgroundColor: AppColor.white,
                                        radius: 30,
                                        child: Image(
                                          image: homeController.genderImage,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    width: 55.w,
                                  ),
                                  Container(
                                    constraints: const BoxConstraints(
                                      maxWidth: 300,
                                    ),
                                    width: 120.w,
                                    child: Text(
                                      homeController.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: lang == "ur_PK"
                                            ? "Jameel Noori Nastaleeq"
                                            : "Poppins",
                                        fontSize:
                                            lang == "ur_PK" ? 50.sp : 35.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),

                                  // Align(
                                  //   alignment: lang == "ur-PK"? Alignment.topRight: Alignment.topRight,
                                  //   child: Text(
                                  //     'username'.tr,
                                  //     maxLines: 1,
                                  //     style:  TextStyle(
                                  //       fontFamily: lang == "ur-PK"
                                  //           ? "Jameel Noori Nastaleeq"
                                  //           : "Poppins",
                                  //    //   fontSize:
                                  //
                                  //
                                  //
                                  //
                                  //       color: AppColor.fontColorButton,
                                  //       fontWeight: FontWeight.bold,
                                  //     ),
                                  //   ),
                                  // ),
                                  SizedBox(
                                    width: 16.w,
                                  ),
                                  // ElevatedButton(
                                  //   onPressed: () {},
                                  //   child:  Text(
                                  //      "login".tr,
                                  //     style:  TextStyle(
                                  //       fontFamily: lang == "ur-PK"
                                  //           ? "Jameel Noori Nastaleeq"
                                  //           : "Poppins",
                                  //       color: Colors.black,
                                  //       fontSize: 18,
                                  //       fontWeight: FontWeight.w500,
                                  //     ),
                                  //   ),
                                  //   style: ElevatedButton.styleFrom(
                                  //     primary: Colors.white,
                                  //     // You can customize other properties like padding, shape, elevation, etc. here
                                  //   ),
                                  // ),
                                  if (homeController.login == false)
                                    SizedBox(
                                      height: 60.h,
                                      width: 110.w,
                                      child: Container(
                                        constraints:
                                             BoxConstraints(maxWidth: 300.w),
                                        height: 60.h,
                                        width: 100.w,
                                        child: TextButton(
                                          onPressed: () async {
                                            if (homeController.login == false) {
                                              Navigator.pushNamed(
                                                  context, RouteString.login);
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                            ),
                                          ),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            // width: 100.w,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: AppColor.white,
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                            ),
                                            child: Text(
                                              "login".tr,
                                              style: TextStyle(
                                                fontFamily: lang == "ur_PK"
                                                    ? "Jameel Noori Nastaleeq"
                                                    : "Poppins",
                                                color: AppColor.black,
                                                fontSize: lang == "ur_PK"
                                                    ? 22.sp
                                                    : 20.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  // if (homeController.login)
                                  //   Container(
                                  //     constraints: const BoxConstraints(
                                  //         maxHeight: 40, maxWidth: 40),
                                  //     width: 40.w,
                                  //     height: 40.w,
                                  //     decoration: BoxDecoration(
                                  //       shape: BoxShape.circle,
                                  //       color: AppColor.red,
                                  //     ),
                                  //     // child: Image(
                                  //     //   image: ImageString.bell,
                                  //     //   width: 30,
                                  //     //   height: 30,
                                  //     // ),
                                  //   ),
                                ],
                              ),
                            ),
                            // Text('منگل 14 اپریل 2023',
                            //     style: TextStyle(
                            //         fontFamily: 'Jameel Noori Nastaleeq',
                            //         fontSize: 19.w,
                            //         color: AppColor.white)),
                             SizedBox(
                              height: 10.h,
                            ),
                            Expanded(
                              child: Row(
                                textDirection: TextDirection.ltr,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                   SizedBox(
                                    width: 10.w,
                                  ),
                                  // Container(
                                  //   width: 75.w,
                                  //   alignment: lang == "ur"
                                  //       ? Alignment.centerRight
                                  //       : Alignment.centerLeft,
                                  //   // color: Colors.amber,
                                  //   child: FittedBox(
                                  //     child: Text(
                                  //       homeController
                                  //           .selectedCity.name,
                                  //       maxLines: 1,
                                  //       overflow:
                                  //       TextOverflow.ellipsis,
                                  //       textAlign: lang == "ur"
                                  //           ? TextAlign.right
                                  //           : TextAlign.left,
                                  //       style: TextStyle(
                                  //         fontFamily: lang == "ur"
                                  //             ? 'j_n_n'
                                  //             : "Poppins",
                                  //         fontWeight:
                                  //         FontWeight.normal,
                                  //         fontSize: lang == "ur"
                                  //             ? 22.sp
                                  //             : 18.sp,
                                  //         color: AppColor
                                  //             .fontColorButton,
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),

                                  InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, RouteString.cityListScreen);
                                      },
                                      child: const Image(
                                        image: ImageString.locationIcon,
                                        height: 25,
                                      )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 90.w,
                                    height: 50.h,
                                    constraints:
                                         BoxConstraints.expand(width: 90.w,
                                          height: 60.h,),
                                    decoration: const BoxDecoration(
                                      // color: Colors.pink[300],
                                      image: DecorationImage(
                                        image: ImageString.weather,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    child:  Padding(
                                        padding: const EdgeInsets.all(14),
                                        child: Text('20°C',
                                          textDirection: TextDirection.ltr,
                                            style: TextStyle(
                                                color: AppColor.white,
                                                fontSize: 16.sp,
                                                fontFamily: lang == "ur_PK"
                                                    ? "Jameel Noori Nastaleeq"
                                                    : "Poppins",
                                                fontWeight: FontWeight.normal,
                                              ))),
                                  ),
                                  // InkWell(onTap: () {},
                                  //     child: const Image(
                                  //       image: ImageString.weather, height: 90,width: 80,)),
                                  // InkWell(onTap: () {
                                  //   Navigator.pushReplacementNamed(
                                  //       context, RouteString.forexScreen);
                                  // },
                                  //     child: const Image(
                                  //       image: ImageString.forex, height: 80,)),
                                   SizedBox(
                                    width: 6.w,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushReplacementNamed(
                                          context, RouteString.forexScreen);
                                    },
                                    child: Container(
                                      width: 100.w,
                                      height: 42.h,
                                      constraints:
                                       BoxConstraints.expand(width: 80.w,
                                        height: 45.h,),
                                      decoration: const BoxDecoration(
                                        // color: Colors.pink[300],
                                        image: DecorationImage(
                                          image: ImageString.forex,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(6),
                                        child: Text(
                                          'forex'.tr,
                                          style: TextStyle(
                                            color: AppColor.white,
                                            fontSize: 16.sp,
                                            fontFamily: lang == "ur_PK"
                                                ? "Jameel Noori Nastaleeq"
                                                : "Poppins",
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                      onTap: () {},
                                      child: Container(
                                        //    color: AppColor.black,
                                        width: 120.w,
                                        height: 90.h,
                                        constraints:  BoxConstraints.expand(

                                          width: 110.w,
                                          height: 60.h,
                                        ),
                                        child: const Image(
                                          image: ImageString.balance,
                                          fit: BoxFit.cover,
                                        ),
                                      )),

                                  InkWell(
                                      onTap: () {},
                                      child: const Image(
                                        image: ImageString.bellIcon,
                                      )),

                                   SizedBox(
                                    width: 6.w,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Directionality(
                        textDirection: lang == "ur-PK"
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        child: Container(
                            height: 100.h,
                            width: 360.w,
                            child: Row(children: [
                              ClipRRect(
                                  borderRadius: lang == "ur-PK"
                                      ? const BorderRadius.only(
                                          topRight: Radius.circular(18),
                                          bottomRight: Radius.circular(18),
                                        )
                                      : const BorderRadius.only(
                                          topLeft: Radius.circular(18),
                                          bottomLeft: Radius.circular(18),
                                        ),
                                  child: Container(
                                      width: 360.w / 5,
                                      height: 120.h,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5.h, horizontal: 1.5),
                                      decoration: BoxDecoration(
                                        borderRadius: lang == "ur-PK"
                                            ? const BorderRadius.only(
                                                topRight: Radius.circular(18),
                                                bottomRight:
                                                    Radius.circular(18),
                                              )
                                            : const BorderRadius.only(
                                                topLeft: Radius.circular(18),
                                                bottomLeft: Radius.circular(18),
                                              ),
                                        // color: Colors.amber,
                                        image: const DecorationImage(
                                          image: ImageString.fajar,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Column(children: [
                                        ButtonText2(
                                          text: "fajr".tr,
                                          fontSize:
                                              lang == "ur-PK" ? 20.sp : 15.sp,
                                          fontFamily: lang == "ur-PK"
                                              ? "Jameel Noori Nastaleeq"
                                              : "Poppins",
                                          fontWeight: FontWeight.bold,

                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        if (lang == "ur-PK")
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                constraints: BoxConstraints(
                                                  maxWidth: (360.w / 5 - 3) / 2,
                                                ),
                                                child: FittedBox(
                                                  child: ButtonText2(
                                                    text:
                                                        "${homeController.timeDayFajr} ",
                                                    fontSize: 18.sp,
                                                    fontFamily:
                                                        'Jameel Noori Nastaleeq',
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                constraints: BoxConstraints(
                                                  maxWidth: (360.w / 5 - 3) / 2,
                                                ),
                                                child: FittedBox(
                                                  child: ButtonText2(
                                                    text:
                                                        " ${homeController.fajrTime.substring(0, homeController.fajrTime.length - 3)}",
                                                    fontSize: 18.sp,
                                                    fontFamily:
                                                        'Jameel Noori Nastaleeq',
                                                    fontWeight:
                                                        FontWeight.normal,

                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        if (lang != "ur-PK")
                                          FittedBox(
                                            child: ButtonText2(
                                              text: homeController.fajrTime,
                                              fontSize: 15.sp,
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                      ]))),
                              Container(
                                width: 360.w / 5,
                                height: 120.h,
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.h, horizontal: 1.5),
                                decoration: const BoxDecoration(
                                  // color: Colors.pink[300],
                                  image: DecorationImage(
                                    image: ImageString.zohar,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    ButtonText2(
                                      text: "duhr".tr,
                                      fontSize: lang == "ur-PK" ? 20.sp : 15.sp,
                                      fontFamily: lang == "ur-PK"
                                          ? "Jameel Noori Nastaleeq"
                                          : "Poppins",
                                      fontWeight: FontWeight.bold,
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    if (lang == "ur-PK")
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            constraints: BoxConstraints(
                                              maxWidth: (360.w / 5 - 3) / 2,
                                            ),
                                            // width: ((360.w / 5) - 2) / 2,
                                            child: FittedBox(
                                              child: ButtonText2(
                                                text:
                                                    "${homeController.timeDayZuhr} ",
                                                fontSize: 18.sp,
                                                fontFamily:
                                                    "Jameel Noori Nastaleeq",
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            constraints: BoxConstraints(
                                              maxWidth: (360.w / 5 - 3) / 2,
                                            ),
                                            // width: ((360.w / 5) - 2) / 2,
                                            child: FittedBox(
                                              child: ButtonText2(
                                                text: homeController.duhrTime
                                                    .substring(
                                                        0,
                                                        homeController.duhrTime
                                                                .length -
                                                            3),
                                                fontSize: 18.sp,
                                                fontFamily:
                                                    "Jameel Noori Nastaleeq",
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    if (lang != "ur-PK")
                                      FittedBox(
                                        child: ButtonText2(
                                          text: homeController.duhrTime,
                                          fontSize: 15.sp,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 360.w / 5,
                                height: 120.h,
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.h, horizontal: 1.5),
                                decoration: const BoxDecoration(
                                  // color: Colors.pink[200],
                                  image: DecorationImage(
                                    image: ImageString.asar,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    ButtonText2(
                                      text: "asr".tr,
                                      fontSize: lang == "ur-PK" ? 20.sp : 15.sp,
                                      fontFamily: lang == "ur-PK"
                                          ? "Jameel Noori Nastaleeq"
                                          : "Poppins",
                                      fontWeight: FontWeight.bold,
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    if (lang == "ur-PK")
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            constraints: BoxConstraints(
                                              maxWidth: (360.w / 5 - 3) / 2,
                                            ),
                                            // width: (360.w / 5 - 3) / 2,
                                            child: FittedBox(
                                              child: ButtonText2(
                                                text:
                                                    "${homeController.timeDayAsr} ",
                                                fontSize: 18.sp,
                                                fontFamily:
                                                    'Jameel Noori Nastaleeq',
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            constraints: BoxConstraints(
                                              maxWidth: (360.w / 5 - 3) / 2,
                                            ),
                                            // width: (360.w / 5 - 3) / 2,
                                            child: FittedBox(
                                              child: ButtonText2(
                                                text: homeController.asrTime
                                                    .substring(
                                                        0,
                                                        homeController.asrTime
                                                                .length -
                                                            3),
                                                fontSize: 18.sp,
                                                fontFamily:
                                                    'Jameel Noori Nastaleeq',
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    if (lang != "ur-PK")
                                      FittedBox(
                                        child: ButtonText2(
                                          text: homeController.asrTime,
                                          fontSize: 15.sp,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 360.w / 5,
                                height: 120.h,
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.h, horizontal: 1.5),
                                decoration: const BoxDecoration(
                                  // color: Colors.pink[100],
                                  image: DecorationImage(
                                    image: ImageString.maghrib,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    ButtonText2(
                                      text: "maghrib".tr,
                                      fontSize: lang == "ur-PK" ? 20.sp : 15.sp,
                                      fontFamily: lang == "ur-PK"
                                          ? "Jameel Noori Nastaleeq"
                                          : "Poppins",
                                      fontWeight: FontWeight.bold,
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    if (lang == "ur-PK")
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            constraints: BoxConstraints(
                                              maxWidth: (360.w / 5 - 3) / 2,
                                            ),
                                            // width: (360.w / 5 - 3) / 2,
                                            child: FittedBox(
                                              child: ButtonText2(
                                                text:
                                                    "${homeController.timeDayMaghrib} ",
                                                fontSize: 18.sp,
                                                fontFamily:
                                                    "Jameel Noori Nastaleeq",
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            constraints: BoxConstraints(
                                              maxWidth: (360.w / 5 - 3) / 2,
                                            ),
                                            // width: (360.w / 5 - 3) / 2,
                                            child: FittedBox(
                                              child: ButtonText2(
                                                text: homeController.maghribTime
                                                    .substring(
                                                        0,
                                                        homeController
                                                                .maghribTime
                                                                .length -
                                                            3),
                                                fontSize: 18.sp,
                                                fontFamily:
                                                    "Jameel Noori Nastaleeq",
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    if (lang != "ur-PK")
                                      FittedBox(
                                        child: ButtonText2(
                                          text: homeController.maghribTime,
                                          fontSize: 15.sp,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              ClipRRect(
                                  borderRadius: lang == "ur-PK"
                                      ? const BorderRadius.only(
                                          topLeft: Radius.circular(18),
                                          bottomLeft: Radius.circular(18),
                                        )
                                      : const BorderRadius.only(
                                          topRight: Radius.circular(18),
                                          bottomRight: Radius.circular(18),
                                        ),
                                  child: Container(
                                      width: 360.w / 5,
                                      height: 120.h,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5.h, horizontal: .5),
                                      decoration: BoxDecoration(
                                        borderRadius: lang == "ur-PK"
                                            ? const BorderRadius.only(
                                                topLeft: Radius.circular(18),
                                                bottomLeft: Radius.circular(18),
                                              )
                                            : const BorderRadius.only(
                                                topRight: Radius.circular(18),
                                                bottomRight:
                                                    Radius.circular(18),
                                              ),
                                        // color: Color.fromARGB(255, 255, 210, 225),
                                        image: const DecorationImage(
                                          image: ImageString.isha,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      child: Column(children: [
                                        ButtonText2(
                                          text: "isha".tr,
                                          fontSize:
                                              lang == "ur-PK" ? 20.sp : 15.sp,
                                          fontFamily: lang == "ur-PK"
                                              ? "Jameel Noori Nastaleeq"
                                              : "Poppins",
                                          fontWeight: FontWeight.bold,
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        if (lang == "ur-PK")
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                constraints: BoxConstraints(
                                                  maxWidth: (360.w / 5 - 3) / 2,
                                                ),
                                                child: FittedBox(
                                                  child: ButtonText2(
                                                    text:
                                                        "${homeController.timeDayIsha} ",
                                                    fontSize: 18.sp,
                                                    fontFamily:
                                                        "Jameel Noori Nastaleeq",
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                constraints: BoxConstraints(
                                                  maxWidth: (360.w / 5 - 3) / 2,
                                                ),
                                                child: FittedBox(
                                                  child: ButtonText2(
                                                    text:
                                                        " ${homeController.eshaTime.substring(0, homeController.eshaTime.length - 3)}",
                                                    fontSize: 18.sp,
                                                    fontFamily:
                                                        "Jameel Noori Nastaleeq",
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        if (lang != "ur-PK")
                                          FittedBox(
                                            child: ButtonText2(
                                              text: homeController.eshaTime,
                                              fontSize: 15.sp,
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                      ]))),
                            ])),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),

                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(15.w),
                          child: SizedBox(
                            // height: 105.h,
                            width: 400.w,
                            child: Column(
                              mainAxisAlignment: lang == "ur-PK"
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                Align(
                                  alignment: lang == "ur-PK"
                                      ? Alignment.topRight
                                      : Alignment.topLeft,
                                  child: Text("activity".tr,
                                      style: TextStyle(
                                        fontSize: lang == "ur-PK" ? 35 : 25,
                                        fontFamily: lang == "ur-PK"
                                            ? "Jameel Noori Nastaleeq"
                                            : "Poppins",
                                        fontWeight: FontWeight.bold,
                                        color: isDarkMode
                                            ? AppColor.white
                                            : AppColor.black,
                                      )),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: isDarkMode ? AppColor.black : AppColor.white,
                        height: 280,
                        child: Directionality(
                          textDirection: lang == "ur-PK"
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 170,
                                decoration: BoxDecoration(
                                  color: isDarkMode
                                      ? AppColor.black
                                      : AppColor.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Align(
                                      // alignment: lang == "ur-PK"
                                      //     ? Alignment.centerRight
                                      //     : Alignment.centerLeft,

                                      child: Text(
                                        'islamic'.tr,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: lang == "ur-PK"
                                              ? "Jameel Noori Nastaleeq"
                                              : "Poppins",
                                          fontSize: lang == "ur-PK" ? 30 : 20,
                                          color: isDarkMode
                                              ? AppColor.white
                                              : AppColor.black,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 210,
                                        height: 210,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: ImageString.islamicCard,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 170,
                                decoration: BoxDecoration(
                                  color: isDarkMode
                                      ? AppColor.black
                                      : AppColor.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Align(
                                      child: Text(
                                        'style'.tr,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: lang == "ur-PK"
                                              ? "Jameel Noori Nastaleeq"
                                              : "Poppins",
                                          fontSize: lang == "ur-PK" ? 30 : 20,
                                          color: isDarkMode
                                              ? AppColor.white
                                              : AppColor.black,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 210,
                                        height: 210,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                                ImageString.entertainmentCard,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 170,
                                decoration: BoxDecoration(
                                  color: isDarkMode
                                      ? AppColor.black
                                      : AppColor.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Align(
                                      // alignment: lang == "ur-PK"
                                      //     ? Alignment.topRight
                                      //     : Alignment.topLeft,
                                      child: Text(
                                        'entertainment'.tr,
                                        //maxLines: ,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: lang == "ur-PK"
                                              ? "Jameel Noori Nastaleeq"
                                              : "Poppins",
                                          fontSize: lang == "ur-PK" ? 30 : 18,
                                          color: isDarkMode
                                              ? AppColor.white
                                              : AppColor.black,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 210,
                                        height: 210,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: ImageString.islamicCard,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 170,
                                decoration: BoxDecoration(
                                  color: isDarkMode
                                      ? AppColor.black
                                      : AppColor.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Align(
                                      // alignment: lang == "ur-PK"
                                      //     ? Alignment.topRight
                                      //     : Alignment.topLeft,
                                      child: Text(
                                        'news'.tr,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: lang == "ur-PK"
                                              ? "Jameel Noori Nastaleeq"
                                              : "Poppins",
                                          fontSize: lang == "ur-PK" ? 30 : 20,
                                          color: isDarkMode
                                              ? AppColor.white
                                              : AppColor.black,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 210,
                                        height: 210,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                                ImageString.entertainmentCard,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: lang == "ur-PK"
                            ? const EdgeInsets.only(right: 20, top: 20)
                            : EdgeInsets.all(20),
                        child: Align(
                          alignment: lang == "ur-PK"
                              ? Alignment.bottomRight
                              : Alignment.bottomLeft,
                          child: Text(
                            'news'.tr,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: lang == "ur-PK"
                                  ? "Jameel Noori Nastaleeq"
                                  : "Poppins",
                              fontSize: lang == "ur-PK" ? 40 : 35,
                            ),
                          ),
                        ),
                      ),

                      ///news api

                      Directionality(
                        textDirection: lang == "ur-PK"
                            ? TextDirection.ltr
                            : TextDirection.rtl,
                        child: Container(
                          color: isDarkMode ? AppColor.black : AppColor.white,
                          height: 430.0,
                          child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: List.generate(
                                min(3, homeController.newsList.length ?? 0),
                                (index) {
                                  final newsItem =
                                      homeController.newsList[index];
                                  return ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const SizedBox(height: 10),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: FadeInImage.assetNetwork(
                                            placeholder:
                                                'assets/images/jazz_logo.png',
                                            image: newsItem.image ?? "",
                                            width: 100.0,
                                            height: 90.0,
                                            fit: BoxFit.cover,
                                            imageErrorBuilder: (context,
                                                exception, stackTrace) {
                                              return Image.asset(
                                                'assets/images/jazz_logo.png',
                                                width: 100.0,
                                                height: 90.0,
                                                fit: BoxFit.cover,
                                              );
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 16.0),
                                        Expanded(
                                          child: Text(
                                            newsItem.title ?? "...",
                                            textDirection: TextDirection.rtl,
                                            style: TextStyle(
                                              color: isDarkMode
                                                  ? AppColor.white
                                                  : AppColor.black,
                                              fontSize: 14,
                                              fontFamily: lang == "ur-PK"
                                                  ? "Jameel Noori Nastaleeq"
                                                  : "Poppins",
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 4.0),
                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.popAndPushNamed(
                                          context, RouteString.newsDescription);
                                    },
                                    subtitle: Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          const SizedBox(width: 20.0),
                                          const Icon(Icons.access_time),
                                          const SizedBox(width: 10.0),
                                          Text(
                                            (newsItem.pubdate ?? "").length >=
                                                    20
                                                ? (newsItem.pubdate ?? "")
                                                    .substring(14, 20)
                                                : (newsItem.pubdate ?? ""),
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: isDarkMode
                                                  ? AppColor.white
                                                  : AppColor.black,
                                              fontFamily: lang == "ur-PK"
                                                  ? "Jameel Noori Nastaleeq"
                                                  : "Poppins",
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 3,
                                          ),
                                          const SizedBox(width: 120.0),
                                          Image.network(
                                            newsItem.icon ?? '',
                                            width: 20.0,
                                            height: 20.0,
                                            fit: BoxFit.contain,
                                            errorBuilder: (_, __, ___) =>
                                                Image.asset(
                                                    'assets/images/jazz_logo.png'),
                                          ),
                                          const SizedBox(width: 4.0),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),

                      //   Directionality(
                      //   textDirection: lang == "ur-PK"? TextDirection.ltr:TextDirection.rtl,
                      //   child: Container(
                      //     color: isDarkMode ? AppColor.black : AppColor.white,
                      //   // color: AppColor.white,
                      //     height: 400.0,
                      //     child: Align(
                      //       alignment: Alignment.center,
                      //       child: ListView.builder(
                      //         itemCount:3,
                      //         //    showAllItems ? newsFeeds?.length : maxVisibleItems,
                      //         itemBuilder: (context, index) {
                      //           final newsItem = newsFeeds?[index];
                      //
                      //           return ListTile(
                      //             contentPadding:
                      //                 const EdgeInsets.symmetric(horizontal: 16.0),
                      //             title: Row(
                      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //               children: [
                      //                 const SizedBox(height: 10),
                      //                 ClipRRect(
                      //                   borderRadius: BorderRadius.circular(10.0),
                      //                   child: FadeInImage.assetNetwork(
                      //                     placeholder: 'assets/images/jazz_logo.png',
                      //                     image: newsItem?.image ?? "",
                      //                     width: 120.0,
                      //                     height: 120.0,
                      //                     fit: BoxFit.cover,
                      //                     imageErrorBuilder:
                      //                         (context, exception, stackTrace) {
                      //                       return Image.asset(
                      //                         'assets/images/jazz_logo.png',
                      //                         width: 120.0,
                      //                         height: 100.0,
                      //                         fit: BoxFit.cover,
                      //                       );
                      //                     },
                      //                   ),
                      //                 ),
                      //                 const SizedBox(width: 20.0),
                      //                 Expanded(
                      //                   child: Text(
                      //                     newsItem?.title ?? "...",
                      //                     textDirection: TextDirection.rtl,
                      //                     style:  TextStyle(
                      //                       color: isDarkMode ? AppColor.white : AppColor.black,
                      //                       fontSize: 18,
                      //                       fontFamily: lang == "ur-PK"
                      //                           ? "Jameel Noori Nastaleeq"
                      //                           : "Poppins",
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 const SizedBox(width: 8.0),
                      //               ],
                      //             ),
                      //             onTap: () {
                      //              Navigator.popAndPushNamed(context, RouteString.newsDescription);
                      //             },
                      //             subtitle: Padding(
                      //               padding: const EdgeInsets.only(top: 8.0),
                      //               child: Row(
                      //                 mainAxisAlignment: MainAxisAlignment.end,
                      //                 children: [
                      //                   const SizedBox(width: 20.0),
                      //                   const Icon(Icons.access_time),
                      //                   const SizedBox(width: 10.0),
                      //                   Text(
                      //                     //(14,20)
                      //                     (newsItem?.pubdate ?? "").length >= 20
                      //                         ? (newsItem?.pubdate ?? "")
                      //                             .substring(14, 20)
                      //                         : (newsItem?.pubdate ?? ""),
                      //                     style:  TextStyle(fontSize: 18,color: isDarkMode ? AppColor.white : AppColor.black,
                      //                       fontFamily: lang == "ur-PK"
                      //                       ? "Jameel Noori Nastaleeq"
                      //                       : "Poppins",),
                      //                     overflow: TextOverflow.ellipsis,
                      //
                      //                     maxLines: 3,
                      //
                      //                   ),
                      //                   const SizedBox(width: 120.0),
                      //                   Image.network(
                      //                     newsItem?.icon ?? '',
                      //                     width: 40.0,
                      //                     height: 40.0,
                      //                     fit: BoxFit.contain,
                      //                     errorBuilder: (_, __, ___) => Image.asset(
                      //                         'assets/images/jazz_logo.png'),
                      //                   ),
                      //                   const SizedBox(width: 8.0),
                      //                 ],
                      //               ),
                      //             ),
                      //           );
                      //         },
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // Visibility(
                      //   visible: (newsFeeds?.isNotEmpty ?? false) &&
                      //       (newsFeeds!.length > maxVisibleItems),
                      //   child: Container(
                      //     width: double.infinity,
                      //     color: isDarkMode ? AppColor.black : AppColor.white,
                      //     //color: AppColor.white,
                      //     child: TextButton(
                      //       onPressed: () {
                      //         setState(() {
                      //           showAllItems = !showAllItems;
                      //         });
                      //       },
                      //       child: Text(
                      //         showAllItems ? "less".tr : 'more'.tr,
                      //         style: const TextStyle(color: AppColor.red),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // Directionality(
                      //   textDirection: lang == "ur-PK" ? TextDirection.ltr : TextDirection.rtl,
                      //   child: Container(
                      //     color: isDarkMode ? AppColor.black : AppColor.white,
                      //     height: 400.0,
                      //     child: Align(
                      //       alignment: Alignment.center,
                      //       child: isLoading // Display loader if isLoading is true
                      //           ? WidgetLoading() // Replace this with your loader widget
                      //           : Column(
                      //         children: List.generate(
                      //           min(3, newsFeeds?.length ?? 0), // Display only three news items
                      //               (index) {
                      //             final newsItem = newsFeeds?[index];
                      //             return ListTile(
                      //               contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                      //               title: Row(
                      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //                 children: [
                      //                   const SizedBox(height: 10),
                      //                   ClipRRect(
                      //                     borderRadius: BorderRadius.circular(10.0),
                      //                     child: FadeInImage.assetNetwork(
                      //                       placeholder: 'assets/images/jazz_logo.png',
                      //                       image: newsItem?.image ?? "",
                      //                       width: 120.0,
                      //                       height: 120.0,
                      //                       fit: BoxFit.cover,
                      //                       imageErrorBuilder: (context, exception, stackTrace) {
                      //                         return Image.asset(
                      //                           'assets/images/jazz_logo.png',
                      //                           width: 120.0,
                      //                           height: 100.0,
                      //                           fit: BoxFit.cover,
                      //                         );
                      //                       },
                      //                     ),
                      //                   ),
                      //                   const SizedBox(width: 20.0),
                      //                   Expanded(
                      //                     child: Text(
                      //                       newsItem?.title ?? "...",
                      //                       textDirection: TextDirection.rtl,
                      //                       style: TextStyle(
                      //                         color: isDarkMode ? AppColor.white : AppColor.black,
                      //                         fontSize: 18,
                      //                         fontFamily: lang == "ur-PK"
                      //                             ? "Jameel Noori Nastaleeq"
                      //                             : "Poppins",
                      //                       ),
                      //                     ),
                      //                   ),
                      //                   const SizedBox(width: 8.0),
                      //                 ],
                      //               ),
                      //               onTap: () {
                      //                 Navigator.popAndPushNamed(context, RouteString.newsDescription);
                      //               },
                      //               subtitle: Padding(
                      //                 padding: const EdgeInsets.only(top: 8.0),
                      //                 child: Row(
                      //                   mainAxisAlignment: MainAxisAlignment.end,
                      //                   children: [
                      //                     const SizedBox(width: 20.0),
                      //                     const Icon(Icons.access_time),
                      //                     const SizedBox(width: 10.0),
                      //                     Text(
                      //                       (newsItem?.pubdate ?? "").length >= 20
                      //                           ? (newsItem?.pubdate ?? "").substring(14, 20)
                      //                           : (newsItem?.pubdate ?? ""),
                      //                       style: TextStyle(
                      //                         fontSize: 18,
                      //                         color: isDarkMode ? AppColor.white : AppColor.black,
                      //                         fontFamily: lang == "ur-PK"
                      //                             ? "Jameel Noori Nastaleeq"
                      //                             : "Poppins",
                      //                       ),
                      //                       overflow: TextOverflow.ellipsis,
                      //                       maxLines: 3,
                      //                     ),
                      //                     const SizedBox(width: 120.0),
                      //                     Image.network(
                      //                       newsItem?.icon ?? '',
                      //                       width: 40.0,
                      //                       height: 40.0,
                      //                       fit: BoxFit.contain,
                      //                       errorBuilder: (_, __, ___) => Image.asset('assets/images/jazz_logo.png'),
                      //                     ),
                      //                     const SizedBox(width: 8.0),
                      //                   ],
                      //                 ),
                      //               ),
                      //             );
                      //           },
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      // Visibility(
                      //   visible: (newsFeeds?.isNotEmpty ?? false) &&
                      //       (newsFeeds!.length > maxVisibleItems),
                      //   child: Container(
                      //     width: double.infinity,
                      //     color: isDarkMode ? AppColor.black : AppColor.white,
                      //     //color: AppColor.white,
                      //     child: TextButton(
                      //       onPressed: () {
                      //         setState(() {
                      //           showAllItems = !showAllItems;
                      //         });
                      //       },
                      //       child: Text(
                      //         showAllItems ? "less".tr : 'more'.tr,
                      //         style: const TextStyle(color: AppColor.red),
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      ///

                      ///
                      // ///card for ayat of the day
                      //  Card(
                      //   child: Container(
                      //     height: 90,
                      //     width: double.infinity, // Take full width of the parent
                      //
                      //     child:  Directionality(
                      //       textDirection: lang == "ur-PK"? TextDirection.rtl:TextDirection.ltr,
                      //       child: Padding(
                      //         padding: EdgeInsets.all(10),
                      //         child: Text(
                      //           "ayat_of_the_day".tr,
                      //           style: TextStyle(
                      //             fontSize: lang == "ur-PK"?40:30,
                      //             fontFamily: lang == "ur-PK"
                      //                 ? "Jameel Noori Nastaleeq"
                      //                 : "Poppins",
                      //             fontWeight: FontWeight.bold,
                      //             color: isDarkMode ? AppColor.white : AppColor.black,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 4,
                      ),
                      Directionality(
                          textDirection: lang == "ur-PK"
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                          child: const AyatScreen()),

                      ///joke of the day

                      //  Card(
                      //   child: SizedBox(
                      //     height: 40,
                      //     width: double.infinity, // Take full width of the parent
                      //
                      //     child: Directionality(
                      //       textDirection: lang == "ur-PK"? TextDirection.rtl:TextDirection.ltr,
                      //       child: Padding(
                      //         padding: EdgeInsets.all(10),
                      //         child: Text(
                      //         "joke_of_the_day".tr,
                      //           style:  TextStyle(
                      //             fontSize: lang == "ur-PK"?40:30,
                      //             fontFamily: lang == "ur-PK"
                      //                 ? "Jameel Noori Nastaleeq"
                      //                 : "Poppins",
                      //             fontWeight: FontWeight.bold,
                      //             color: isDarkMode ? AppColor.white : AppColor.black,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Directionality(
                          textDirection: lang == "ur-PK"
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                          child: JokeScreen()),
                    ],
                  ),
                )
              : Text(''),
        ))));
  }
}
