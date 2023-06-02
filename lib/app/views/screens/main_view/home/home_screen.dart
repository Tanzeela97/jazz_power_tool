import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jazzpowertoolsapp/app/model/news_feed.dart' as news_feed;
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
  final homecontroller = Get.put(
      HomeScreenController(const bool.fromEnvironment('dart.library.js_util')));
  List<news_feed.Data>? newsFeeds;
  List<for_ex.Data>? forex;
  bool kIsWeb = const bool.fromEnvironment('dart.library.js_util');
  int maxVisibleItems = 4;
  bool showAllItems = false;

  Future<void> getFetchNewsFeed() async {
    try {
      final List<news_feed.Data> newsList =
          (await RemoteServices.fetchNewsData());
      if (newsList != null) {
        // Update the newsFeeds variable with the fetched data
        newsFeeds = newsList;
      } else {
        // Handle the case when the API response is null
        print('API response is null');
      }
    } catch (err) {
      // Handle the error state
      print('Error state: $err');
    }
  }

  @override
  void initState() {
    homecontroller.setWeb(kIsWeb);
    getFetchNewsFeed();
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
    String lang = Get.locale!.toLanguageTag();
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      body: GetBuilder<HomeScreenController>(
        builder: (_) => SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: 230.h,
                width: double.infinity,
                // padding: const EdgeInsets.fromLTRB(25, 8, 25, 20),
                decoration: const BoxDecoration(
                  color: AppColor.white,
                  image: DecorationImage(
                    image: ImageString.backgroundImage,
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)),
                  // gradient: LinearGradient(
                  //   begin: lang == "ur-PK"
                  //       ? Alignment.centerRight
                  //       : Alignment.centerLeft,
                  //   end: lang == "ur-PK"
                  //       ? Alignment.centerLeft
                  //       : Alignment.centerRight,
                  //   colors: const [
                  //     AppColor.red,
                  //     AppColor.red,
                  //   ],
                  // )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 20.w,
                        ),
                        GestureDetector(
                            onTap: () {},
                            child: const Align(
                              alignment: Alignment.topRight,
                              child: CircleAvatar(
                                radius: 35,
                                backgroundColor: Colors.brown,
                                child: Image(image: ImageString.proPic),
                              ),
                            )),
                        SizedBox(
                          width: 50.w,
                        ),
                        const Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'شگفتہ',
                            maxLines: 1,
                            style: TextStyle(
                              fontFamily: 'Jameel Noori Nastaleeq',
                              fontSize: 65,
                              color: AppColor.fontColorButton,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50.w,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            "لاگ ان",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            // You can customize other properties like padding, shape, elevation, etc. here
                          ),
                        ),

                      ],
                    ),
                    // Text('منگل 14 اپریل 2023',
                    //     style: TextStyle(
                    //         fontFamily: 'Jameel Noori Nastaleeq',
                    //         fontSize: 19.w,
                    //         color: AppColor.white)),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Row(
                        textDirection: TextDirection.ltr,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(onTap: (){},
                              child:const Image(image: ImageString.locationIcon,height: 30,)) ,
                          InkWell(onTap: (){},
                              child:const Image(image: ImageString.weather,height: 80,)) ,
                          InkWell(onTap: (){},
                              child:const Image(image: ImageString.forex,height: 80,)) ,
                          InkWell(onTap: (){},
                              child:  Container(
                            //    color: AppColor.black,

                                    constraints: const BoxConstraints.expand(

                                      width: 115,
                                      height: 70,
                                    ),
                                    child: const Image(
                                      image: ImageString.balance,
                                     fit: BoxFit.fitWidth,

                                    ),) ),

                         // GestureDetector(
                          //   onTap: () {},
                          //   child: const Image(
                          //     image: ImageString.weather,
                          //     fit: BoxFit.contain,
                          //     width: 90,
                          //     height: 90,
                          //   ),
                          // ),
                          // GestureDetector(
                          //   onTap: () {},
                          //   child: const Image(
                          //     image: ImageString.forex,
                          //     fit: BoxFit.contain,
                          //     width: 90,
                          //     height: 100,
                          //   ),
                          // ),
                          // GestureDetector(
                          //   onTap: () {},
                          //   child: Container(
                          //     constraints: const BoxConstraints.expand(
                          //       width: 120,
                          //       height: 90,
                          //     ),
                          //     child: const Image(
                          //       image: ImageString.balance,
                          //       fit: BoxFit.cover,
                          //     ),
                          //   ),
                          // ),
                          InkWell(onTap: (){},
                              child:const Image(image: ImageString.bellIcon,)) ,

                          const SizedBox(
                            width: 10,
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
              Container(
                  color: AppColor.red,
                  height: 100.h,
                  width: 360.w,
                  child: Row(children: [
                    ClipRRect(
                        borderRadius: lang == "ur"
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
                              borderRadius: lang == "ur"
                                  ? const BorderRadius.only(
                                      topRight: Radius.circular(18),
                                      bottomRight: Radius.circular(18),
                                    )
                                  : const BorderRadius.only(
                                      topLeft: Radius.circular(18),
                                      bottomLeft: Radius.circular(18),
                                    ),
                              // color: Colors.amber,
                              image: DecorationImage(
                                image: ImageString.fajar,
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(children: [
                              ButtonText2(
                                text: "fajr".tr,
                                fontSize: lang == "ur" ? 20.sp : 15.sp,
                                fontFamily:
                                    lang == "ur" ? 'j_n_n_k' : "Poppins",
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              if (lang == "ur")
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      constraints: BoxConstraints(
                                        maxWidth: (360.w / 5 - 3) / 2,
                                      ),
                                      // width: (360.w / 5 - 3) / 2,
                                      child: FittedBox(
                                        child: ButtonText2(
                                          text:
                                              "${homecontroller.timeDayFajr} ",
                                          fontSize: 18.sp,
                                          fontFamily: 'j_n_n',
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
                                          text: homecontroller.fajrTime
                                              .substring(
                                                  0,
                                                  homecontroller
                                                          .fajrTime.length -
                                                      3),
                                          fontSize: 18.sp,
                                          fontFamily: 'j_n_n',
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    if (lang != "ur")
                                      FittedBox(
                                        child: ButtonText2(
                                          text: homecontroller.fajrTime,
                                          fontSize: 15.sp,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),

                                  ],
                                ),
                            ]))),
                    Container(
                      width: 360.w / 5,
                      height: 120.h,
                      padding:
                          EdgeInsets.symmetric(vertical: 5.h, horizontal: 1.5),
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
                            fontSize: lang == "ur" ? 20.sp : 15.sp,
                            fontFamily: lang == "ur" ? 'j_n_n_k' : "Poppins",
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          if (lang == "ur")
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth: (360.w / 5 - 3) / 2,
                                  ),
                                  // width: ((360.w / 5) - 2) / 2,
                                  child: FittedBox(
                                    child: ButtonText2(
                                      text: "${homecontroller.timeDayZuhr} ",
                                      fontSize: 18.sp,
                                      fontFamily: 'j_n_n',
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
                                      text: homecontroller.duhrTime.substring(0,
                                          homecontroller.duhrTime.length - 3),
                                      fontSize: 18.sp,
                                      fontFamily: 'j_n_n',
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          if (lang != "ur")
                            FittedBox(
                              child: ButtonText2(
                                text: homecontroller.duhrTime,
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
                      padding:
                          EdgeInsets.symmetric(vertical: 5.h, horizontal: 1.5),
                      decoration: BoxDecoration(
                        // color: Colors.pink[200],
                        image: const DecorationImage(
                          image: ImageString.asar,
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        children: [
                          ButtonText2(
                            text: "asr".tr,
                            fontSize: lang == "ur" ? 20.sp : 15.sp,
                            fontFamily: lang == "ur" ? 'j_n_n_k' : "Poppins",
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          if (lang == "ur")
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth: (360.w / 5 - 3) / 2,
                                  ),
                                  // width: (360.w / 5 - 3) / 2,
                                  child: FittedBox(
                                    child: ButtonText2(
                                      text: "${homecontroller.timeDayAsr} ",
                                      fontSize: 18.sp,
                                      fontFamily: 'j_n_n',
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
                                      text: homecontroller.asrTime.substring(
                                          0, homecontroller.asrTime.length - 3),
                                      fontSize: 18.sp,
                                      fontFamily: 'j_n_n',
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          if (lang != "ur")
                            FittedBox(
                              child: ButtonText2(
                                text: homecontroller.asrTime,
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
                      padding:
                          EdgeInsets.symmetric(vertical: 5.h, horizontal: 1.5),
                      decoration: BoxDecoration(
                        // color: Colors.pink[100],
                        image: const DecorationImage(
                          image: ImageString.maghrib,
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        children: [
                          ButtonText2(
                            text: "maghrib".tr,
                            fontSize: lang == "ur" ? 20.sp : 15.sp,
                            fontFamily: lang == "ur" ? 'j_n_n_k' : "Poppins",
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          if (lang == "ur")
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth: (360.w / 5 - 3) / 2,
                                  ),
                                  // width: (360.w / 5 - 3) / 2,
                                  child: FittedBox(
                                    child: ButtonText2(
                                      text: "${homecontroller.timeDayMaghrib} ",
                                      fontSize: 18.sp,
                                      fontFamily: 'j_n_n',
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
                                      text: homecontroller.maghribTime
                                          .substring(
                                              0,
                                              homecontroller
                                                      .maghribTime.length -
                                                  3),
                                      fontSize: 18.sp,
                                      fontFamily: 'j_n_n',
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          if (lang != "ur")
                            FittedBox(
                              child: ButtonText2(
                                text: homecontroller.maghribTime,
                                fontSize: 15.sp,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                        ],
                      ),
                    ),
                    ClipRRect(
                        borderRadius: lang == "ur"
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
                              borderRadius: lang == "ur"
                                  ? const BorderRadius.only(
                                      topLeft: Radius.circular(18),
                                      bottomLeft: Radius.circular(18),
                                    )
                                  : const BorderRadius.only(
                                      topRight: Radius.circular(18),
                                      bottomRight: Radius.circular(18),
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
                                fontSize: lang == "ur" ? 20.sp : 15.sp,
                                fontFamily:
                                    lang == "ur" ? 'j_n_n_k' : "Poppins",
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              if (lang == "ur")
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      constraints: BoxConstraints(
                                        maxWidth: (360.w / 5 - 3) / 2,
                                      ),
                                      child: FittedBox(
                                        child: ButtonText2(
                                          text:
                                              "${homecontroller.timeDayIsha} ",
                                          fontSize: 18.sp,
                                          fontFamily: 'j_n_n',
                                          fontWeight: FontWeight.normal,
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
                                              " ${homecontroller.eshaTime.substring(0, homecontroller.eshaTime.length - 3)}",
                                          fontSize: 18.sp,
                                          fontFamily: 'j_n_n',
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              if (lang != "ur")
                                FittedBox(
                                  child: ButtonText2(
                                    text: homecontroller.eshaTime,
                                    fontSize: 15.sp,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                            ]))),
                  ])),
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
                      // mainAxisAlignment: lang == "ur-PK"
                      //     ? MainAxisAlignment.end
                      //     : MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        const Align(
                          //     alignment: lang == "ur-PK"
                          // ? Alignment.topRight : Alignment.topLeft,
                          alignment: Alignment.topRight,
                          child: Text('آپ آج کیا کرنا چاہیں گے؟',
                              style: TextStyle(
                                  fontSize: 50,
                                  fontFamily: 'Jameel Noori Nastaleeq',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
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
                height: 190,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        width: 120,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Align(
                              // alignment: lang == "ur-PK"
                              //     ? Alignment.topRight
                              //     : Alignment.topLeft,
                              child: Text(
                                'اسلامی',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Jameel Noori Nastaleeq',
                                  fontSize: 30,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: 160,
                                height: 165,
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
                      SizedBox(
                        width: 10.h,
                      ),
                      Container(
                        width: 120,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Align(
                              // alignment: lang == "ur-PK"
                              //     ? Alignment.topRight
                              //     : Alignment.topLeft,
                              child: Text(
                                'سٹائل',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Jameel Noori Nastaleeq',
                                  fontSize: 25,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: 160,
                                height: 165,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: ImageString.entertainmentCard,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10.h,
                      ),
                      Container(
                        width: 120,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Align(
                              // alignment: lang == "ur-PK"
                              //     ? Alignment.topRight
                              //     : Alignment.topLeft,
                              child: Text(
                                'انٹرٹینمنٹ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Jameel Noori Nastaleeq',
                                  fontSize: 30,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: 160,
                                height: 165,
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
                      SizedBox(
                        width: 10.h,
                      ),
                      Container(
                        width: 120,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Align(
                              // alignment: lang == "ur-PK"
                              //     ? Alignment.topRight
                              //     : Alignment.topLeft,
                              child: Text(
                                'خبریں',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Jameel Noori Nastaleeq',
                                  fontSize: 30,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: 160,
                                height: 165,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: ImageString.entertainmentCard,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10.h,
                      ),
                      Container(
                        width: 120,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Align(
                              // alignment: lang == "ur-PK"
                              //     ? Alignment.topRight
                              //     : Alignment.topLeft,
                              child: Text(
                                'اسلامی',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Jameel Noori Nastaleeq',
                                  fontSize: 30,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: 170,
                                height: 167,
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
                    ],
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(right: 20, top: 20),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: KText2(
                    fontSize: 50,
                    text: 'خبریں',
                  ),
                ),
              ),
//           Stack(children: <Widget>[
//             GestureDetector(
//               onTap: widget.onPressed,
//               child: Container(
//                 margin: EdgeInsets.fromLTRB(
//                     AppConfig.of(context).appWidth(8),
//                     AppConfig.of(context).appWidth(3),
//                     AppConfig.of(context).appWidth(6),
//                     AppConfig.of(context).appWidth(0)),
//                 height: AppConfig.of(context).appWidth(35),
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   // color:
//                   //     darkThemeSelected ? AppColors.mainScreenColor : Colors.white,
//                   color: darkThemeSelected
//                       ? AppColors.itemBackgroundScreenColor
//                       : Colors.white,
//                   borderRadius: BorderRadius.all(Radius.circular(6)),
//                 ),
//                 child: Container(
//                   margin: EdgeInsets.only(
//                       left: AppConfig.of(context).appWidth(6),
//                       top: AppConfig.of(context).appWidth(3),
//                       right: AppConfig.of(context).appWidth(39)),
//                   //text description
//                   child: Column(
//                     children: <Widget>[
//                       SizedBox(height: 2,),
//                       Align(
//                         alignment: Alignment.topRight,
//                         child: Text(
//                           widget.newsFeed.title ?? "",
//                           style: Theme.of(context).textTheme.headline3,
//                           overflow: TextOverflow.ellipsis,
//                           maxLines: 3,
//                         ),
//                       ),
//
//                       SizedBox(height: 3),
//                       Container(
//                         height: AppConfig.of(context).appWidth(3),
//                         child: Align(
//                           alignment: Alignment.topRight,
//                           child: Text(
//                             widget.newsFeed.description ?? "",
//                             style: Theme.of(context).textTheme.headline5,
//                             overflow: TextOverflow.ellipsis,
//                             maxLines: 7,
//                           ),
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: <Widget>[
//                           // Container(
//                           //   margin: EdgeInsets.only(
//                           //     top: AppConfig.of(context).appWidth(4),
//                           //   ),
//                           //   child: Text(
//                           //     widget.newsFeed.articlePublishedTime ?? "",
//                           //     style: Theme.of(context).textTheme.headline5,
//                           //     overflow: TextOverflow.ellipsis,
//                           //     maxLines: 8,
//                           //   ),
//                           // ),
// //                    SizedBox(width: AppConfig.of(context).appWidth(3)),
//                           Container(
//                             margin: EdgeInsets.only(
//                               top: 10,
//                             ),
//                             child: ClipRRect(
//                               // borderRadius: BorderRadius.circular(10.0),
//                               child: Image(
//                                 width: 100,
//                                 height: 90,
//                                 image: NetworkImage(),
//                                 fit: BoxFit.contain,
//                               ),
//                             ),
//                           ),
//                           SizedBox(width:10),
//                         ],
//                       ),
//                     ],
//                   ),
//                   //text desp
//                 ),
//               ),
//             )),

              ///news api
              Directionality(
                textDirection: TextDirection.ltr,
                child: Container(
                  color: AppColor.white,
                  height: 400.0,
                  child: Align(
                    alignment: Alignment.center,
                    child: ListView.builder(
                      itemCount:
                          showAllItems ? newsFeeds?.length : maxVisibleItems,
                      itemBuilder: (context, index) {
                        final newsItem = newsFeeds?[index];

                        return ListTile(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16.0),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(height: 10),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: FadeInImage.assetNetwork(
                                  placeholder: 'assets/images/jazz_logo.png',
                                  image: newsItem?.image ?? "",
                                  width: 120.0,
                                  height: 120.0,
                                  fit: BoxFit.cover,
                                  imageErrorBuilder:
                                      (context, exception, stackTrace) {
                                    return Image.asset(
                                      'assets/images/jazz_logo.png',
                                      width: 120.0,
                                      height: 100.0,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 20.0),
                              Expanded(
                                child: Text(
                                  newsItem?.title ?? "...",
                                  textDirection: TextDirection.rtl,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'Jameel Noori Nastaleeq',
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8.0),
                            ],
                          ),
                          onTap: () {
                            // Handle item tap
                          },
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const SizedBox(width: 20.0),
                                const Icon(Icons.access_time),
                                const SizedBox(width: 10.0),
                                Text(
                                  //(14,20)
                                  (newsItem?.pubdate ?? "").length >= 20
                                      ? (newsItem?.pubdate ?? "")
                                          .substring(14, 20)
                                      : (newsItem?.pubdate ?? ""),
                                  style: const TextStyle(fontSize: 18),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                                const SizedBox(width: 120.0),
                                Image.network(
                                  newsItem?.icon ?? '',
                                  width: 40.0,
                                  height: 40.0,
                                  fit: BoxFit.contain,
                                  errorBuilder: (_, __, ___) => Image.asset(
                                      'assets/images/jazz_logo.png'),
                                ),
                                const SizedBox(width: 8.0),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: (newsFeeds?.isNotEmpty ?? false) &&
                    (newsFeeds!.length > maxVisibleItems),
                child: Container(
                  width: double.infinity,
                  color: AppColor.white,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        showAllItems = !showAllItems;
                      });
                    },
                    child: Text(
                      showAllItems ? 'سی لیس' : 'سی موڑے',
                      style: const TextStyle(color: AppColor.red),
                    ),
                  ),
                ),
              ),

              ///

              ///
              ///card for ayat of the day
              const Card(
                child: SizedBox(
                  height: 90,
                  width: double.infinity, // Take full width of the parent

                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'آیات وف تھے دے',
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Jameel Noori Nastaleeq',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              AyatScreen(),

              ///joke of the day

              const Card(
                child: SizedBox(
                  height: 90,
                  width: double.infinity, // Take full width of the parent

                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'جوکے وف تھے دے',
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Jameel Noori Nastaleeq',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              JokeOftheDay(),
            ],
          ),
        ),
      ),
    );
  }
}
