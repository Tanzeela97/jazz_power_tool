import 'dart:async';
import 'package:circular_rotation/circular_rotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jazzpowertoolsapp/app/model/news_feed.dart' as news_feed;
import 'package:jazzpowertoolsapp/app/views/widgets/ktext1.dart';
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
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(15.w, 20.h, 15.w, 20.h),
                        decoration: BoxDecoration(
                          color: isDarkMode ? AppColor.black : AppColor.white,
                          image: const DecorationImage(
                            image: ImageString.backgroundImage,
                            fit: BoxFit.fill,
                          ),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    if (homeController.login == false) {
                                      homeController.snackBar("login_first".tr);
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
                                Container(
                                  constraints: const BoxConstraints(
                                    maxWidth: 500,
                                  ),
                                  // color: Colors.amber,
                                  width: homeController.login ? 250.w : 120.w,
                                  child: Text(
                                    homeController.login
                                        ? homeController.name == "Hello"
                                            ? "hello".tr
                                            : homeController.name
                                        : "hello".tr,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textDirection: TextDirection.ltr,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: homeController.login
                                          ? homeController.name == "Hello" &&
                                                  lang == "ur-PK"
                                              ? "Jameel Noori Nastaleeq"
                                              : "Poppins"
                                          : "Jameel Noori Nastaleeq",
                                      fontSize: homeController.login
                                          ? homeController.name == "Hello" &&
                                                  lang == "ur-PK"
                                              ? 50.sp
                                              : 35.sp
                                          : 50.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.white,
                                    ),
                                  ),
                                ),
                                homeController.login == false
                                    ? Container(
                                        constraints:
                                            const BoxConstraints(maxWidth: 300),
                                        width: 120.w,
                                        child: TextButton(
                                          onPressed: () async {
                                            if (homeController.login == false) {
                                              Navigator.pushNamed(
                                                  context, RouteString.login);
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColor.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
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
                                                  BorderRadius.circular(15),
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
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              textDirection: TextDirection.ltr,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, RouteString.cityListScreen);
                                    },
                                    child: const Image(
                                      image: ImageString.locationIcon,
                                      height: 25,
                                    )),
                                Container(
                                  constraints:
                                      const BoxConstraints(maxWidth: 200),
                                  width: 90.w,
                                  child: TextButton(
                                    onPressed: () async {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xffA2BC86),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      decoration: BoxDecoration(
                                        color: const Color(0xffA2BC86),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image(
                                            image: ImageString.sun,
                                            width: 20.w,
                                            height: 20,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Container(
                                            // width: 50.w,
                                            constraints: BoxConstraints(
                                              maxWidth: 45.w,
                                            ),
                                            child: Text(
                                              "20°C",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              textDirection: TextDirection.ltr,
                                              style: TextStyle(
                                                fontFamily: "Poppins",
                                                color: AppColor.black,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  constraints:
                                      const BoxConstraints(maxWidth: 200),
                                  width: 90.w,
                                  child: TextButton(
                                    onPressed: () async {
                                      Navigator.pushReplacementNamed(
                                          context, RouteString.forexScreen);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xff678B46),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      decoration: BoxDecoration(
                                        color: const Color(0xff678B46),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image(
                                            image: ImageString.forexButton,
                                            width: 20.w,
                                            height: 20,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Container(
                                            // width: 50.w,
                                            constraints: BoxConstraints(
                                              maxWidth: 45.w,
                                            ),
                                            child: Text(
                                              "Forex",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              textDirection: TextDirection.ltr,
                                              style: TextStyle(
                                                fontFamily: "Poppins",
                                                color: AppColor.black,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  constraints:
                                      const BoxConstraints(maxWidth: 200),
                                  width: 100.w,
                                  child: TextButton(
                                    onPressed: () async {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      decoration: BoxDecoration(
                                        color: AppColor.white,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image(
                                            image: ImageString.money,
                                            width: 20.w,
                                            height: 20,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Container(
                                            // width: 50.w,
                                            constraints: BoxConstraints(
                                              maxWidth: 50.w,
                                            ),
                                            child: FittedBox(
                                              child: Text(
                                                "RS. 421.00",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                textDirection:
                                                    TextDirection.ltr,
                                                style: TextStyle(
                                                  fontFamily: "Poppins",
                                                  color: AppColor.black,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                    onTap: () {},
                                    child: const Image(
                                      image: ImageString.bellIcon,
                                    )),
                              ],
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
                                        fontSize:
                                            lang == "ur-PK" ? 35.sp : 25.sp,
                                        fontFamily: lang == "ur-PK"
                                            ? "Jameel Noori Nastaleeq"
                                            : "Poppins",
                                        fontWeight: FontWeight.normal,
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
                                          fontSize:
                                              lang == "ur-PK" ? 24.sp : 18.sp,
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
                                          fontSize:
                                              lang == "ur-PK" ? 24.sp : 18.sp,
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
                                          fontSize:
                                              lang == "ur-PK" ? 24.sp : 18.sp,
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
                                          fontSize:
                                              lang == "ur-PK" ? 24.sp : 18.sp,
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
                              fontWeight: FontWeight.normal,
                              fontFamily: lang == "ur-PK"
                                  ? "Jameel Noori Nastaleeq"
                                  : "Poppins",
                              fontSize: lang == "ur-PK" ? 35.sp : 25.sp,
                            ),
                          ),
                        ),
                      ),

                      ///news api

                      Container(
                        color: isDarkMode ? AppColor.black : AppColor.white,
                        // height: 430.0,
                        width: 390.w,
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: List.generate(
                              min(3, homeController.newsList.length ?? 0),
                              (index) {
                                // final newsItem =
                                //     homeController.newsList[index];
                                return InkWell(
                                  onTap: () {
                                    Navigator.popAndPushNamed(
                                        context, RouteString.newsDescription);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15.w, vertical: 10.h),
                                    child: Row(
                                        // mainAxisAlignment:
                                        //     MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            constraints: BoxConstraints(
                                              maxWidth: 360.w / 2,
                                            ),
                                            // width: 360.w / 2,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: FadeInImage.assetNetwork(
                                                placeholder:
                                                    'assets/images/jazz_logo.png',
                                                image: homeController
                                                        .newsList[index]
                                                        .image ??
                                                    "",
                                                width: 150.w,
                                                height: 120,
                                                fit: BoxFit.fill,
                                                imageErrorBuilder: (context,
                                                    exception, stackTrace) {
                                                  return Image.asset(
                                                    'assets/images/jazz_logo.png',
                                                    // width: 50.0,
                                                    height: 120.0,
                                                    fit: BoxFit.fill,
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15.w,
                                          ),
                                          SizedBox(
                                            width: 360.w / 2,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  homeController.newsList[index]
                                                          .title ??
                                                      "...",
                                                  // textDirection: TextDirection.rtl,
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: lang == "ur-PK"
                                                      ? TextAlign.right
                                                      : TextAlign.left,
                                                  style: TextStyle(
                                                    color: isDarkMode
                                                        ? AppColor.white
                                                        : AppColor.black,
                                                    fontSize: lang == "ur-PK"
                                                        ? 24.sp
                                                        : 18.sp,
                                                    fontFamily: lang == "ur-PK"
                                                        ? "Jameel Noori Nastaleeq"
                                                        : "Poppins",
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Image.network(
                                                      homeController
                                                              .newsList[index]
                                                              .icon ??
                                                          '',
                                                      width: 20.0,
                                                      height: 20.0,
                                                      fit: BoxFit.contain,
                                                      errorBuilder:
                                                          (_, __, ___) =>
                                                              Image.asset(
                                                        'assets/images/jazz_logo.png',
                                                        width: 20.0,
                                                        height: 20.0,
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                            Icons.access_time),
                                                        const SizedBox(
                                                            width: 10.0),
                                                        Text(
                                                          (homeController.newsList[index].pubdate ??
                                                                          "")
                                                                      .length >=
                                                                  20
                                                              ? (homeController
                                                                          .newsList[
                                                                              index]
                                                                          .pubdate ??
                                                                      "")
                                                                  .substring(
                                                                      14, 20)
                                                              : (homeController
                                                                      .newsList[
                                                                          index]
                                                                      .pubdate ??
                                                                  ""),
                                                          // textDirection:
                                                          //     TextDirection.rtl,
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            color: isDarkMode
                                                                ? AppColor.white
                                                                : AppColor
                                                                    .black,
                                                            fontFamily: lang ==
                                                                    "ur-PK"
                                                                ? "Jameel Noori Nastaleeq"
                                                                : "Poppins",
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 3,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ]),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
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
