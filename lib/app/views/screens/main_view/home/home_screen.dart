import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jazzpowertoolsapp/app/model/news_feed.dart';

import 'package:shimmer/shimmer.dart';

import '../../../../controller/home_screen/home_screen_controller.dart';
import '../../../../data/constant/app_color.dart';
import '../../../../data/constant/image_string.dart';
import '../../../../data/constant/route_string.dart';
import '../../../../services/remote_services.dart';
import '../../../widgets/ImageButton.dart';
import '../../../widgets/button_text2.dart';
import '../../../widgets/card_heading.dart';
import '../../../widgets/countdown_widget.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/dialogue_box.dart';
import '../../../widgets/heading1.dart';
import '../../../widgets/heading2.dart';
import '../../../widgets/ktext1.dart';
import '../../../widgets/ktext2.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Duration _duration = const Duration(minutes: 100);
  Duration _elapsed = Duration.zero;
  final controller = Get.put(HomeScreenController());
  List<Data>? newsFeeds;

  Future<void> getFetchNewsFeed() async {
    try {
      final List<Data> newsList = (await RemoteServices.fetchData());
      if (newsList != null) {
        // Update the newsFeeds variable with the fetched data
        newsFeeds = newsList;
        print(newsList.first.title);

        print('Success state');
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
    getFetchNewsFeed();
    super.initState();
    Timer.periodic(Duration(minutes: 1), (timer) {
      setState(() {
        _elapsed += Duration(minutes: 1);
      });
      if (_elapsed >= _duration) {
        timer.cancel();
      }
    });
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
                height: 250.h,
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: ImageString.backgroundImage,
                      fit: BoxFit.fill,
                    ),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(50)),
                    gradient: LinearGradient(
                      begin: lang == "ur-PK"
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      end: lang == "ur-PK"
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      colors: const [
                        AppColor.red,
                        AppColor.red,
                      ],
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                          width: 130,
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
                      ],
                    ),
                    Text('منگل 14 اپریل 2023',
                        style: TextStyle(
                            fontFamily: 'Jameel Noori Nastaleeq',
                            fontSize: 19.w,
                            color: AppColor.white)),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Image(
                              image: ImageString.weather,
                              fit: BoxFit.fitWidth,
                              width: 100,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Image(
                              image: ImageString.forex,
                              fit: BoxFit.fitWidth,
                              width: 100,
                              height: 120,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              constraints: BoxConstraints.expand(
                                width: 140,
                                height: 90,
                              ),
                              child: Image(
                                image: ImageString.balance,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),

                    // Expanded(
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       GestureDetector(
                    //         onTap: () {},
                    //         child: const Image(
                    //           image: ImageString.weather,
                    //           fit: BoxFit.fitWidth,
                    //           width: 90,
                    //         ),
                    //       ),
                    //       const SizedBox(
                    //         width: 18,
                    //       ),
                    //       GestureDetector(
                    //         onTap: () {},
                    //         child: const Image(
                    //           image: ImageString.forex,
                    //           fit: BoxFit.fitWidth,
                    //           width: 90,
                    //
                    //         ),
                    //       ),
                    //       const SizedBox(
                    //         width: 18,
                    //       ),
                    //       Expanded(
                    //         child: GestureDetector(
                    //           onTap: () {},
                    //           child: const SizedBox(
                    //             height: 180,
                    //             width: 90,
                    //             child: Image(
                    //               image: ImageString.balance,
                    //               fit: BoxFit.cover,
                    //               width: 100,
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //       Spacer(),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              // Container(
              //   height: 200,
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       Row(
              //         crossAxisAlignment: CrossAxisAlignment.center,
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           SizedBox(width: 30.w,),
              //           Text('dfsds'),
              //           Expanded(
              //             child: CircleAvatar(
              //               radius: 30,
              //               backgroundImage: NetworkImage(
              //                 'https://picsum.photos/200',
              //               ),
              //             ),
              //           ),   ],
              //       ),
              //
              //
              //       SizedBox(height: 16),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //         children: [
              //           ElevatedButton(
              //             onPressed: () {},
              //             child: Text('Button 1'),
              //           ),
              //           ElevatedButton(
              //             onPressed: () {},
              //             child: Text('Button 1'),
              //           ),
              //           ElevatedButton(
              //             onPressed: () {},
              //             child: Text('Button 1'),
              //           ),
              //
              //         ],
              //
              //       ),
              //     ],
              //   ),
              // ),

              // Card(
              //   child: Container(
              //     padding: EdgeInsets.symmetric(vertical: 20.h),
              //     // height: 300.h,
              //     width: double.infinity,
              //     child: Center(
              //       child: Container(
              //         width: 354.w,
              //         // height: 234.h,
              //         padding: EdgeInsets.all(15.w),
              //         decoration: BoxDecoration(
              //           color: Colors.white,
              //           image: const DecorationImage(
              //             image: ImageString.mosque,
              //             fit: BoxFit.fill,
              //           ),
              //           borderRadius: BorderRadius.circular(18),
              //         ),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           // crossAxisAlignment: CrossAxisAlignment.end,
              //           children: [
              //             SizedBox(
              //               width: 155.w,
              //               child: Column(
              //                 crossAxisAlignment:
              //                     CrossAxisAlignment.start,
              //                 children: [
              //                   ButtonText2(
              //                     text: 'time',
              //                     //"${controller.namazTimeDay.hijriStr} AH",
              //                     fontSize: 13.w,
              //                   ),
              //                   SizedBox(
              //                     height: 5.h,
              //                   ),
              //                   ButtonText2(
              //                     text: 'date string',
              //                     //controller.namazTimeDay.dateStr,
              //                     fontSize: 13.w,
              //                   ),
              //                   SizedBox(
              //                     height: 28.h,
              //                   ),
              //                   ButtonText2(
              //                     text: "Now",
              //                     fontSize: 13.w,
              //                   ),
              //                   SizedBox(
              //                     height: 10.h,
              //                   ),
              //                   Text(
              //                     'namas',
              //                     maxLines: 1,
              //                     style: GoogleFonts.inter(
              //                       fontSize: 24.w,
              //                       fontWeight: FontWeight.w500,
              //                       color: AppColor.fontColorButton,
              //                     ),
              //                   ),
              //                   SizedBox(
              //                     height: 10.h,
              //                   ),
              //                   Row(
              //                     mainAxisAlignment:
              //                         MainAxisAlignment.spaceBetween,
              //                     crossAxisAlignment:
              //                         CrossAxisAlignment.start,
              //                     children: [
              //                       Container(
              //                         width: 120.w,
              //                         alignment: Alignment.centerLeft,
              //                         child: ButtonText2(
              //                           text: 'name',
              //                           // controller.selectedCity.name,
              //                           fontSize: 13,
              //                         ),
              //                       ),
              //                       GestureDetector(
              //                         onTap: () {
              //                           citySelectDialogue(
              //                               context, controller);
              //                         },
              //                         child: Container(
              //                             width: 30.w,
              //                             height: 15.h,
              //                             alignment: Alignment.center,
              //                             decoration: BoxDecoration(
              //                               color:
              //                                   AppColor.fontColorButton,
              //                               borderRadius:
              //                                   BorderRadius.circular(4),
              //                             ),
              //                             child: KText2(
              //                               text: "Edit",
              //                               fontSize: 7.w,
              //                             )),
              //                       ),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             Padding(
              //               padding: EdgeInsets.only(bottom: 15.w),
              //               child: Align(
              //                 alignment: Alignment.bottomRight,
              //                 child: SizedBox(
              //                   width: 155.w,
              //                   height: 155.h,
              //                   child: CountdownWidget(
              //                     duration: controller.nextNamazDuration!,
              //                     elapsed: controller.elapsedDuration!,
              //                     next: controller.nextNamaz!,
              //                     time: controller.formattedTime!,
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // Container(
              //   height: 100.h,
              //   width: 354.w,
              //   margin: EdgeInsets.symmetric(vertical: 10.h),
              //   child: Row(
              //     children: [
              //       Container(
              //         width: 354.w / 5,
              //         decoration: BoxDecoration(
              //           borderRadius: const BorderRadius.only(
              //             topLeft: Radius.circular(8),
              //             bottomLeft: Radius.circular(8),
              //           ),
              //           color: Colors.red[200],
              //         ),
              //         child: Padding(
              //           padding: EdgeInsets.all(8.w),
              //           child: Column(
              //             children: [
              //               ButtonText2(
              //                 text: "Fajar",
              //                 fontSize: 15.w,
              //               ),
              //               SizedBox(
              //                 height: 10.h,
              //               ),
              //               ButtonText2(
              //                 text: "05:00",
              //                 fontSize: 13.w,
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //       Container(
              //         width: 354.w / 5,
              //         decoration: BoxDecoration(
              //           color: Colors.pink[300],
              //         ),
              //         child: Padding(
              //           padding: EdgeInsets.all(8.w),
              //           child: Column(
              //             children: [
              //               ButtonText2(
              //                 text: "Duhr",
              //                 fontSize: 15.w,
              //               ),
              //               SizedBox(
              //                 height: 10.h,
              //               ),
              //               ButtonText2(
              //                 text: "02:00",
              //                 fontSize: 13.w,
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //       Container(
              //         width: 354.w / 5,
              //         decoration: BoxDecoration(
              //           color: Colors.pink[400],
              //         ),
              //         child: Padding(
              //           padding: EdgeInsets.all(8.w),
              //           child: Column(
              //             children: [
              //               ButtonText2(
              //                 text: "Asr",
              //                 fontSize: 15.w,
              //               ),
              //               SizedBox(
              //                 height: 10.h,
              //               ),
              //               ButtonText2(
              //                 text: "06:00",
              //                 fontSize: 13.w,
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //       Container(
              //         width: 354.w / 5,
              //         decoration: BoxDecoration(
              //           color: Colors.pink[500],
              //         ),
              //         child: Padding(
              //           padding: EdgeInsets.all(8.w),
              //           child: Column(
              //             children: [
              //               ButtonText2(
              //                 text: "Maghrib",
              //                 fontSize: 15.w,
              //               ),
              //               SizedBox(
              //                 height: 10.h,
              //               ),
              //               ButtonText2(
              //                 text: "07:00",
              //                 fontSize: 13.w,
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //       Container(
              //         width: 354.w / 5,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.only(
              //             topRight: Radius.circular(8),
              //             bottomRight: Radius.circular(8),
              //           ),
              //           color: Colors.pink[600],
              //         ),
              //         child: Padding(
              //           padding: EdgeInsets.all(8.w),
              //           child: Column(
              //             children: [
              //               ButtonText2(
              //                 text: "Isha",
              //                 fontSize: 15.w,
              //               ),
              //               SizedBox(
              //                 height: 10.h,
              //               ),
              //               ButtonText2(
              //                 text: "08:00",
              //                 fontSize: 13.w,
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              //
              //
              // Padding(
              //   padding: EdgeInsets.all(15.w),
              //   child: SizedBox(
              //       // height: 50.h,
              //       width: 390.w,
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceAround,
              //         children: [
              //           Container(
              //             width: 160.w,
              //             // height: 60.h,
              //             alignment: Alignment.center,
              //             padding: EdgeInsets.symmetric(
              //                 horizontal: 5.w, vertical: 10.h),
              //             decoration: BoxDecoration(
              //               color: AppColor.white,
              //               borderRadius: BorderRadius.circular(10),
              //             ),
              //             child: Wrap(
              //               alignment: WrapAlignment.center,
              //               crossAxisAlignment: WrapCrossAlignment.center,
              //               // mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 Image(
              //                   image: ImageString.muftiWhite,
              //                   width: 25.w,
              //                   height: 25.h,
              //                 ),
              //                 SizedBox(
              //                   width: 5.w,
              //                 ),
              //                 ButtonText2(
              //                   text: "Mufti",
              //                   fontSize: 17.w,
              //                 ),
              //               ],
              //             ),
              //           ),
              //           InkWell(
              //             onTap: () {
              //               Navigator.pushNamed(
              //                   context, RouteString.quiz);
              //             },
              //             child: Container(
              //               width: 160.w,
              //               // height: 33.h,
              //               alignment: Alignment.center,
              //               padding: EdgeInsets.symmetric(
              //                   horizontal: 5.w, vertical: 10.h),
              //               decoration: BoxDecoration(
              //                 color: AppColor.red,
              //                 borderRadius: BorderRadius.circular(10),
              //               ),
              //               child: Wrap(
              //                 // mainAxisSize: MainAxisSize.max,
              //                 // mainAxisAlignment: MainAxisAlignment.center,
              //
              //                 crossAxisAlignment:
              //                     WrapCrossAlignment.center,
              //                 children: [
              //                   Image(
              //                     image: ImageString.quiz,
              //                     width: 25.w,
              //                     height: 25.h,
              //                   ),
              //                   SizedBox(
              //                     width: 5.w,
              //                   ),
              //                   SizedBox(
              //                     child: ButtonText2(
              //                       text: "Quiz Game",
              //                       fontSize: 17.w,
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ),
              //         ],
              //       )),
              // ),
              // Padding(
              //   padding: EdgeInsets.all(15.w),
              //   child: Column(
              //     children: [
              //       const Align(
              //           alignment: Alignment.topLeft,
              //           child: CardHeading(text: "Categories")),
              //       // SizedBox(
              //       //   height: 10.h,
              //       // ),
              //     ],
              //   ),
              // ),

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

                        // Container(
                        //   height: 18,
                        //   child: Directionality(
                        //     textDirection: TextDirection.rtl,
                        //     child: ListView(
                        //       // shrinkWrap:true ,
                        //
                        //       scrollDirection: Axis.horizontal,
                        //       children: <Widget>[
                        //         Row(
                        //           //crossAxisAlignment: CrossAxisAlignment.end,
                        //           children: [
                        //             GestureDetector(
                        //               onTap: () {
                        //                 print(1);
                        //                 Navigator.pushNamed(context,
                        //                     RouteString.surahListScreen);
                        //               },
                        //               child: Container(
                        //                 width: 90,
                        //                 child: const Align(
                        //                     // alignment: lang == "ur-PK"
                        //                     //     ? Alignment.topRight
                        //                     //     : Alignment.topLeft,
                        //                     alignment: Alignment.topRight,
                        //                     child: Text(
                        //                       'اسلامی',
                        //                       style: TextStyle(
                        //                           fontFamily:
                        //                               'Jameel Noori Nastaleeq',
                        //                           fontSize: 18,
                        //                           color: Colors.black),
                        //                     )),
                        //               ),
                        //             ),
                        //             Container(
                        //               width: 90,
                        //               child: const Align(
                        //                   alignment: Alignment.topRight,
                        //                   // //  alignment: lang == "ur-PK"
                        //                   //       ? Alignment.topRight
                        //                   //       : Alignment.topLeft,
                        //                   child: Text(
                        //                     'سٹائل',
                        //                     style: TextStyle(
                        //                         fontFamily:
                        //                             'Jameel Noori Nastaleeq',
                        //                         fontSize: 18,
                        //                         color: Colors.black),
                        //                   )),
                        //             ),
                        //             Container(
                        //               width: 100,
                        //               child: const Align(
                        //                   alignment: Alignment.topRight,
                        //                   // alignment: lang == "ur-PK"
                        //                   //      ? Alignment.topRight
                        //                   //      : Alignment.topLeft,
                        //                   child: Text(
                        //                     'انٹرٹینمنٹ',
                        //                     style: TextStyle(
                        //                         fontFamily:
                        //                             'Jameel Noori Nastaleeq',
                        //                         fontSize: 18,
                        //                         color: Colors.black),
                        //                   )),
                        //             ),
                        //             Container(
                        //               width: 90,
                        //               child: const Align(
                        //                   // alignment: lang == "ur-PK"
                        //                   //     ? Alignment.topRight
                        //                   //     : Alignment.topLeft,
                        //                   alignment: Alignment.topRight,
                        //                   child: Text(
                        //                     'خبریں',
                        //                     style: TextStyle(
                        //                         fontFamily:
                        //                             'Jameel Noori Nastaleeq',
                        //                         fontSize: 18,
                        //                         color: Colors.black),
                        //                   )),
                        //             ),
                        //           ],
                        //         )
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // Row(
                        //   mainAxisAlignment:
                        //       MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     SizedBox(
                        //       width: ((390.w - 40.w) / 5.3),
                        //       child: Column(
                        //         children: [
                        //           // Image(
                        //           //   image: ImageString.namaz,
                        //           //   width: 50.w,
                        //           //   height: 50.w,
                        //           //   color: AppColor.fontColorHeading,
                        //           // ),
                        //           Text(
                        //             'News',
                        //             maxLines: 1,
                        //             overflow: TextOverflow.ellipsis,
                        //             // maxFontSize: 13.w,
                        //             style: GoogleFonts.inter(
                        //               fontSize: 13.w,
                        //               fontWeight: FontWeight.w400,
                        //               color: AppColor.fontColor,
                        //             ),
                        //           ),
                        //
                        //         ],
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: 5.w,
                        //     ),
                        //     SizedBox(
                        //       width: ((390.w - 40.w) / 5.3),
                        //       child: Column(
                        //         children: [
                        //           Image(
                        //             image: ImageString.calendar,
                        //             width: 50.w,
                        //             height: 50.w,
                        //             color: AppColor.fontColorHeading,
                        //           ),
                        //           Text(
                        //             'Ajj Ki',
                        //             maxLines: 1,
                        //             overflow: TextOverflow.ellipsis,
                        //             // maxFontSize: 13.w,
                        //             style: GoogleFonts.inter(
                        //               fontSize: 13.w,
                        //               fontWeight: FontWeight.w400,
                        //               color: AppColor.fontColor,
                        //             ),
                        //           ),
                        //           Text(
                        //             'Baat',
                        //             maxLines: 1,
                        //             overflow: TextOverflow.ellipsis,
                        //             // maxFontSize: 13.w,
                        //             style: GoogleFonts.inter(
                        //               fontSize: 13.w,
                        //               fontWeight: FontWeight.w400,
                        //               color: AppColor.fontColor,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: 5.w,
                        //     ),
                        //     InkWell(
                        //       onTap: () {
                        //         print(1);
                        //         Navigator.pushNamed(
                        //             context, RouteString.surahListScreen);
                        //       },
                        //       child: SizedBox(
                        //         width: ((390.w - 40.w) / 5.3),
                        //         child: Column(
                        //           children: [
                        //             Image(
                        //               image: ImageString.quran,
                        //               width: 50.w,
                        //               height: 50.w,
                        //               color: AppColor.fontColorHeading,
                        //             ),
                        //             Text(
                        //               'Khulasa E',
                        //               maxLines: 1,
                        //               overflow: TextOverflow.ellipsis,
                        //               // maxFontSize: 13.w,
                        //               style: GoogleFonts.inter(
                        //                 fontSize: 13.w,
                        //                 fontWeight: FontWeight.w400,
                        //                 color: AppColor.fontColor,
                        //               ),
                        //             ),
                        //             Text(
                        //               'Quran',
                        //               maxLines: 1,
                        //               overflow: TextOverflow.ellipsis,
                        //               // maxFontSize: 13.w,
                        //               style: GoogleFonts.inter(
                        //                 fontSize: 13.w,
                        //                 fontWeight: FontWeight.w400,
                        //                 color: AppColor.fontColor,
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: 5.w,
                        //     ),
                        //     SizedBox(
                        //       width: ((390.w - 40.w) / 5.3),
                        //       child: Column(
                        //         children: [
                        //           Image(
                        //             image: ImageString.books,
                        //             width: 50.w,
                        //             height: 50.w,
                        //             color: AppColor.fontColorHeading,
                        //           ),
                        //           Text(
                        //             'Ramzan',
                        //             maxLines: 1,
                        //             overflow: TextOverflow.ellipsis,
                        //             // maxFontSize: 13.w,
                        //             style: GoogleFonts.inter(
                        //               fontSize: 13.w,
                        //               fontWeight: FontWeight.w400,
                        //               color: AppColor.fontColor,
                        //             ),
                        //           ),
                        //           Text(
                        //             'Bayanat',
                        //             maxLines: 1,
                        //             overflow: TextOverflow.ellipsis,
                        //             // maxFontSize: 13.w,
                        //             style: GoogleFonts.inter(
                        //               fontSize: 13.w,
                        //               fontWeight: FontWeight.w400,
                        //               color: AppColor.fontColor,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: 5.w,
                        //     ),
                        //     SizedBox(
                        //       width: ((390.w - 40.w) / 5.3),
                        //       child: Column(
                        //         children: [
                        //           Image(
                        //             image: ImageString.molviCategories,
                        //             width: 50.w,
                        //             height: 50.w,
                        //             color: AppColor.fontColorHeading,
                        //           ),
                        //           Text(
                        //             'Ulema Ke',
                        //             maxLines: 1,
                        //             overflow: TextOverflow.ellipsis,
                        //             // maxFontSize: 13.w,
                        //             style: GoogleFonts.inter(
                        //               fontSize: 13.w,
                        //               fontWeight: FontWeight.w400,
                        //               color: AppColor.fontColor,
                        //             ),
                        //           ),
                        //           Text(
                        //             'Bayanat',
                        //             maxLines: 1,
                        //             overflow: TextOverflow.ellipsis,
                        //             // maxFontSize: 13.w,
                        //             style: GoogleFonts.inter(
                        //               fontSize: 13.w,
                        //               fontWeight: FontWeight.w400,
                        //               color: AppColor.fontColor,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // )
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
                padding: EdgeInsets.only(right: 20,top:20),
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
      ///sd
          Directionality(
                      textDirection: TextDirection.ltr,
                      child: SizedBox(
                        height: 400.0,
                        child: Align(
                          alignment: Alignment.center,
                          child: ListView.builder(
                            itemCount: newsFeeds?.length,
                            itemBuilder: (context, index) {
                              final newsItem = newsFeeds?[index];

                              return ListTile(
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox(height: 10),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: FadeInImage.assetNetwork(
                                        placeholder: 'assets/images/favicon.png',
                                        image: newsItem?.image ?? "",
                                        width: 120.0,
                                        height: 120.0,
                                        fit: BoxFit.cover,
                                        imageErrorBuilder:
                                            (context, exception, stackTrace) {

                                          return Image.asset(
                                            'assets/images/favicon.png',
                                            width: 120.0,
                                            height: 100.0,
                                            fit: BoxFit.cover,
                                          );
                                        },
                                      ),
                                    ),

                                    // ClipRRect(
                                    //   borderRadius:
                                    //   const BorderRadius.all(Radius.circular(10.0)),
                                    //   child:FadeInImage.assetNetwork(
                                    //     placeholder: 'assets/images/favicon.png', // Replace with your placeholder image asset
                                    //     image: newsItem?.image ?? "",
                                    //     width: 100.0,
                                    //     height: 80.0,
                                    //     fit: BoxFit.cover,
                                    //
                                    //   ),
                                    // ),
                                    const SizedBox(width: 20.0),
                                    Expanded(
                                      child: Text(

                                        newsItem?.title ?? "Loading...",textDirection: TextDirection.rtl,

                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 18),
                                      ),
                                    ),
                                    // FadeInImage(
                                    //   placeholder: const AssetImage(
                                    //       'assets/images/favicon.png'),
                                    //   image: NetworkImage(newsItem?.icon ?? ''),
                                    //   width: 50.0,
                                    //   height: 50.0,
                                    //   fit: BoxFit.cover,
                                    //   imageErrorBuilder: (_, __, ___) =>
                                    //       Image.asset('assets/images/favicon.png'),
                                    // ),
                                    // FadeInImage(
                                    //   placeholder: const NetworkImage(
                                    //       'assets/images/favicon.png'),
                                    //   image: NetworkImage(newsItem?.icon ?? ''),
                                    //   width: 50.0,
                                    //   height: 50.0,
                                    //   fit: BoxFit.cover,
                                    // ),
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
                                        (newsItem?.pubdate ?? "").substring(14, 20),
                                        style: TextStyle(fontSize: 18),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                      ),

                                      const SizedBox(width: 120.0),

                                      Image.network(
                                        newsItem?.icon ?? '',
                                        width: 40.0,
                                        height: 40.0,
                                        fit: BoxFit.contain,
                                        errorBuilder: (_, __, ___) => Image.asset('assets/images/favicon.png'),
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
      //         Directionality(
      //           textDirection: TextDirection.ltr,
      //           child: SizedBox(
      //             height: 400.0,
      //             child: Align(
      //               alignment: Alignment.center,
      //               child: ListView.builder(
      //                 itemCount: newsFeeds?.length,
      //                 itemBuilder: (context, index) {
      //                   final newsItem = newsFeeds?[index];
      //
      //                   return ListTile(
      //                     contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      //                     title: Row(
      //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                       children: [
      //                         const SizedBox(height: 10),
      //                         ClipRRect(
      //                           borderRadius: BorderRadius.circular(10.0),
      //                           child: FadeInImage.assetNetwork(
      //                             placeholder: 'assets/images/favicon.png',
      //                             image: newsItem?.image ?? "",
      //                             width: 120.0,
      //                             height: 120.0,
      //                             fit: BoxFit.cover,
      //                             imageErrorBuilder:
      //                                 (context, exception, stackTrace) {
      //
      //                               return Image.asset(
      //                                 'assets/images/favicon.png',
      //                                 width: 120.0,
      //                                 height: 100.0,
      //                                 fit: BoxFit.cover,
      //                               );
      //                             },
      //                           ),
      //                         ),
      //
      //                         // ClipRRect(
      //                         //   borderRadius:
      //                         //   const BorderRadius.all(Radius.circular(10.0)),
      //                         //   child:FadeInImage.assetNetwork(
      //                         //     placeholder: 'assets/images/favicon.png', // Replace with your placeholder image asset
      //                         //     image: newsItem?.image ?? "",
      //                         //     width: 100.0,
      //                         //     height: 80.0,
      //                         //     fit: BoxFit.cover,
      //                         //
      //                         //   ),
      //                         // ),
      //                         const SizedBox(width: 20.0),
      //                         Expanded(
      //                           child: Text(
      //
      //                             newsItem?.title ?? "Loading...",textDirection: TextDirection.rtl,
      //
      //                             style: const TextStyle(
      //                                 color: Colors.black, fontSize: 18),
      //                           ),
      //                         ),
      //                         // FadeInImage(
      //                         //   placeholder: const AssetImage(
      //                         //       'assets/images/favicon.png'),
      //                         //   image: NetworkImage(newsItem?.icon ?? ''),
      //                         //   width: 50.0,
      //                         //   height: 50.0,
      //                         //   fit: BoxFit.cover,
      //                         //   imageErrorBuilder: (_, __, ___) =>
      //                         //       Image.asset('assets/images/favicon.png'),
      //                         // ),
      //                         // FadeInImage(
      //                         //   placeholder: const NetworkImage(
      //                         //       'assets/images/favicon.png'),
      //                         //   image: NetworkImage(newsItem?.icon ?? ''),
      //                         //   width: 50.0,
      //                         //   height: 50.0,
      //                         //   fit: BoxFit.cover,
      //                         // ),
      //                         const SizedBox(width: 8.0),
      //                       ],
      //                     ),
      //                     onTap: () {
      //                       // Handle item tap
      //                     },
      //                   );
      //                 },
      //               ),
      //             ),
      //           ),
      //         ),
              // Expanded(
              //   child: Container(
              //     width: 170,
              //     height: 167,
              //     decoration: const BoxDecoration(
              //       image: DecorationImage(
              //         image: ImageString.news,
              //         fit: BoxFit.cover,
              //       ),
              //     ),
              //   ),
              // ),

            ],
          ),
        ),
      ),
    );

// Card(
//   child: Padding(
//     padding: EdgeInsets.symmetric(vertical: 15.h),
//     child: SizedBox(
//       // height: 176.h,
//       width: 361.w,
//       child: Column(
//         // mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // Card(
//           //   child: Padding(
//           //     padding: EdgeInsets.only(left: 15.w),
//           //     child: Column(
//           //       children: [
//           //         const Align(
//           //           // alignment: lang == "ur-PK"
//           //           //     ? Alignment.topRight
//           //           //     : Alignment.topLeft,
//           //           alignment: Alignment.topRight,
//           //           child: Text(
//           //             "ٹرینڈنگ نیوز",
//           //             style: TextStyle(
//           //                 color: Colors.black,
//           //                 fontWeight: FontWeight.bold,
//           //                 fontSize: 18),
//           //           ),
//           //         ),
//           //         SizedBox(
//           //           height: 10.h,
//           //         ),
//           //         // Container(
//           //         //   // height: Get.height,
//           //         //   padding: EdgeInsets.symmetric(
//           //         //       horizontal: 10.0.w,
//           //         //       vertical: 15.0.h),
//           //         //   child: Column(
//           //         //
//           //         //
//           //         //     mainAxisSize: MainAxisSize.max,
//           //         //     children: <Widget>[
//           //         //       Shimmer.fromColors(
//           //         //         direction: ShimmerDirection.rtl,
//           //         //         baseColor: Colors.grey,
//           //         //         highlightColor: AppColor.red,
//           //         //         child: Directionality(
//           //         //           textDirection: TextDirection.rtl,
//           //         //
//           //         //           child: ListView.builder(
//           //         //
//           //         //             shrinkWrap: true,
//           //         //             itemBuilder: (context, index) =>
//           //         //                Padding(
//           //         //                   padding: EdgeInsets.only(
//           //         //                       bottom: 8.h),
//           //         //                   child: Container(
//           //         //                     padding:
//           //         //                     EdgeInsets.all(10.sp),
//           //         //                     child: Row(
//           //         //
//           //         //                       children: <Widget>[
//           //         //                         Container(
//           //         //                           width: 80.0.w,
//           //         //                           height: 80.0.h,
//           //         //                           color: Colors.white,
//           //         //                         ),
//           //         //                         SizedBox(
//           //         //                           width: 15.h,
//           //         //                         ),
//           //         //                         Expanded(
//           //         //                           child: Column(
//           //         //                             crossAxisAlignment:
//           //         //                             CrossAxisAlignment
//           //         //                                 .start,
//           //         //                             children: <Widget>[
//           //         //                               Container(
//           //         //                                 width: double
//           //         //                                     .infinity,
//           //         //                                 height: 10
//           //         //                                   ..h,
//           //         //                                 color:
//           //         //                                 Colors.red,
//           //         //                               ),
//           //         //                               Padding(
//           //         //                                 padding: EdgeInsets
//           //         //                                     .symmetric(
//           //         //                                     vertical:
//           //         //                                     2.w),
//           //         //                               ),
//           //         //                               Container(
//           //         //                                 width: double
//           //         //                                     .infinity,
//           //         //                                 height: 10.h,
//           //         //                                 color: Colors
//           //         //                                     .white,
//           //         //                               ),
//           //         //                               SizedBox(
//           //         //                                 height: 10.h,
//           //         //                               ),
//           //         //                               Container(
//           //         //                                 width: 40.w,
//           //         //                                 height: 10.h,
//           //         //                                 color: Colors
//           //         //                                     .white,
//           //         //                               ),
//           //         //                             ],
//           //         //                           ),
//           //         //                         )
//           //         //                       ],
//           //         //                     ),
//           //         //                   ),
//           //         //                 ),
//           //         //             itemCount: 4,
//           //         //           ),
//           //         //         ),
//           //         //       ),
//           //         //     ],
//           //         //   ),
//           //         // ),
//           //
//           //         // Container(
//           //         //   height: 400,
//           //         //   padding: EdgeInsets.symmetric(
//           //         //       horizontal: 10.0.w,
//           //         //       vertical: 15.0.h),
//           //         //   child: SingleChildScrollView(
//           //         //     child: Column(
//           //         //       mainAxisAlignment:
//           //         //           MainAxisAlignment.start,
//           //         //       mainAxisSize: MainAxisSize.min,
//           //         //       children: <Widget>[
//           //         //         FutureBuilder<List<NewsFeed>>(
//           //         //           future: controller.fetchNews(),
//           //         //           builder: (context, snapshot) {
//           //         //             print('dss');
//           //         //             if (snapshot
//           //         //                     .connectionState ==
//           //         //                 ConnectionState.waiting) {
//           //         //               // Show shimmer effect while waiting for the API response
//           //         //
//           //         //               return Shimmer.fromColors(
//           //         //                 direction:
//           //         //                     ShimmerDirection.rtl,
//           //         //                 baseColor: Colors.grey,
//           //         //                 highlightColor:
//           //         //                     AppColor.red,
//           //         //                 child: Directionality(
//           //         //                   textDirection:
//           //         //                       TextDirection.rtl,
//           //         //                   child: ListView.builder(
//           //         //                     shrinkWrap: true,
//           //         //                     itemBuilder: (context,
//           //         //                             index) =>
//           //         //                         Padding(
//           //         //                       padding:
//           //         //                           EdgeInsets.only(
//           //         //                               bottom:
//           //         //                                   8.h),
//           //         //                       child: Container(
//           //         //                         padding:
//           //         //                             EdgeInsets
//           //         //                                 .all(10
//           //         //                                     .sp),
//           //         //                         child: Row(
//           //         //                           children: <
//           //         //                               Widget>[
//           //         //                             Container(
//           //         //                               width:
//           //         //                                   80.0.w,
//           //         //                               height:
//           //         //                                   80.0.h,
//           //         //                               color: Colors
//           //         //                                   .white,
//           //         //                             ),
//           //         //                             SizedBox(
//           //         //                               width: 15.h,
//           //         //                             ),
//           //         //                             Expanded(
//           //         //                               child:
//           //         //                                   Column(
//           //         //                                 crossAxisAlignment:
//           //         //                                     CrossAxisAlignment
//           //         //                                         .start,
//           //         //                                 children: <
//           //         //                                     Widget>[
//           //         //                                   Container(
//           //         //                                     width:
//           //         //                                         double.infinity,
//           //         //                                     height:
//           //         //                                         10.h,
//           //         //                                     color:
//           //         //                                         Colors.red,
//           //         //                                     child:
//           //         //                                         Text('dsasds'),
//           //         //                                   ),
//           //         //                                   Padding(
//           //         //                                     padding:
//           //         //                                         EdgeInsets.symmetric(vertical: 2.w),
//           //         //                                   ),
//           //         //                                   Container(
//           //         //                                     width:
//           //         //                                         double.infinity,
//           //         //                                     height:
//           //         //                                         10.h,
//           //         //                                     color:
//           //         //                                         Colors.white,
//           //         //                                     child:
//           //         //                                         Text('dsasds'),
//           //         //                                   ),
//           //         //                                   SizedBox(
//           //         //                                     height:
//           //         //                                         10.h,
//           //         //                                   ),
//           //         //                                   Container(
//           //         //                                     width:
//           //         //                                         40.w,
//           //         //                                     height:
//           //         //                                         10.h,
//           //         //                                     color:
//           //         //                                         Colors.white,
//           //         //                                     child:
//           //         //                                         Text('dsasds'),
//           //         //                                   ),
//           //         //                                 ],
//           //         //                               ),
//           //         //                             )
//           //         //                           ],
//           //         //                         ),
//           //         //                       ),
//           //         //                     ),
//           //         //                     itemCount:
//           //         //                         5, // Placeholder item count for shimmer effect
//           //         //                   ),
//           //         //                 ),
//           //         //               );
//           //         //             } else if (snapshot
//           //         //                 .hasError) {
//           //         //               // Handle error if API request fails
//           //         //               // return Text('Error: ${snapshot.error}');
//           //         //               return ListView.builder(
//           //         //                 shrinkWrap: true,
//           //         //                 itemBuilder:
//           //         //                     (context, index) {
//           //         //                   print(' fetch data');
//           //         //                   //
//           //         //                   return Padding(
//           //         //                     padding:
//           //         //                         EdgeInsets.only(
//           //         //                             bottom: 8.h),
//           //         //                     child: Container(
//           //         //                       padding:
//           //         //                           EdgeInsets.all(
//           //         //                               10.sp),
//           //         //                       child: Row(
//           //         //                         children: <
//           //         //                             Widget>[
//           //         //                           Container(
//           //         //                             width: 80.0.w,
//           //         //                             height:
//           //         //                                 80.0.h,
//           //         //                             color: Colors
//           //         //                                 .red,
//           //         //                           ),
//           //         //                           SizedBox(
//           //         //                             width: 15.h,
//           //         //                           ),
//           //         //                           Column(
//           //         //                             crossAxisAlignment:
//           //         //                                 CrossAxisAlignment
//           //         //                                     .start,
//           //         //                             children: <
//           //         //                                 Widget>[
//           //         //                               const Text(
//           //         //                                   'sds'),
//           //         //                               Text(controller
//           //         //                                       .newsList[index]
//           //         //                                       .title ??
//           //         //                                   "cvcx"),
//           //         //                               // Display the data retrieved from the API
//           //         //                               // Text('ID: ${data.id}'), // Display the data retrieved from the API
//           //         //                             ],
//           //         //                           )
//           //         //                         ],
//           //         //                       ),
//           //         //                     ),
//           //         //                   );
//           //         //                 },
//           //         //                 itemCount: controller
//           //         //                     .newsList.length,
//           //         //               );
//           //         //             } else {
//           //         //               print(
//           //         //                   'display the fetch data');
//           //         //               // Display the ListView with the fetched data
//           //         //
//           //         //               return ListView.builder(
//           //         //                 shrinkWrap: true,
//           //         //                 itemBuilder:
//           //         //                     (context, index) {
//           //         //                   print(' fetch data');
//           //         //                   //
//           //         //                   return Padding(
//           //         //                     padding:
//           //         //                         EdgeInsets.only(
//           //         //                             bottom: 8.h),
//           //         //                     child: Container(
//           //         //                       padding:
//           //         //                           EdgeInsets.all(
//           //         //                               10.sp),
//           //         //                       child: Row(
//           //         //                         children: <
//           //         //                             Widget>[
//           //         //                           Container(
//           //         //                             width: 80.0.w,
//           //         //                             height:
//           //         //                                 80.0.h,
//           //         //                             color: Colors
//           //         //                                 .red,
//           //         //                           ),
//           //         //                           SizedBox(
//           //         //                             width: 15.h,
//           //         //                           ),
//           //         //                           Column(
//           //         //                             crossAxisAlignment:
//           //         //                                 CrossAxisAlignment
//           //         //                                     .start,
//           //         //                             children: <
//           //         //                                 Widget>[
//           //         //                               const Text(
//           //         //                                   'sds'),
//           //         //                               Text(controller
//           //         //                                       .newsList[index]
//           //         //                                       .title ??
//           //         //                                   "cvcx"),
//           //         //                               // Display the data retrieved from the API
//           //         //                               // Text('ID: ${data.id}'), // Display the data retrieved from the API
//           //         //                             ],
//           //         //                           )
//           //         //                         ],
//           //         //                       ),
//           //         //                     ),
//           //         //                   );
//           //         //                 },
//           //         //                 itemCount: controller
//           //         //                     .newsList.length,
//           //         //               );
//           //         //             }
//           //         //           },
//           //         //         ),
//           //         //       ],
//           //         //     ),
//           //         //   ),
//           //         // ),
//           //       ],
//           //     ),
//           //   ),
//           // ),
//           // SizedBox(
//           //   height: 10.h,
//           // ),
//           // Card(
//           //   child: Padding(
//           //     padding: EdgeInsets.only(left: 15.w),
//           //     child: Column(
//           //       children: [
//           //         const Align(
//           //           // alignment: lang == "ur-PK"
//           //           //     ? Alignment.topRight
//           //           //     : Alignment.topLeft,
//           //           alignment: Alignment.topRight,
//           //           child: Text(
//           //             "آیات وف تھے دے ",
//           //             style: TextStyle(
//           //                 color: Colors.black,
//           //                 fontFamily: 'Jameel Noori Nastaleeq',
//           //                 fontWeight: FontWeight.bold,
//           //                 fontSize: 25),
//           //           ),
//           //         ),
//           //         SizedBox(
//           //           height: 10.h,
//           //         ),
//           //         Card(
//           //           elevation: 5,
//           //           shape: RoundedRectangleBorder(
//           //             borderRadius:
//           //                 BorderRadius.circular(18),
//           //           ),
//           //           child: Container(
//           //             height: 200.h,
//           //             width: 340.w,
//           //             decoration: BoxDecoration(
//           //               gradient: LinearGradient(
//           //                 begin: lang == "ur-PK"
//           //                     ? Alignment.topLeft
//           //                     : Alignment.topRight,
//           //                 end: lang == "ur-PK"
//           //                     ? Alignment.bottomRight
//           //                     : Alignment.bottomRight,
//           //                 colors: const [
//           //                   AppColor.white,
//           //                   AppColor.red
//           //                 ],
//           //               ),
//           //               borderRadius:
//           //                   BorderRadius.circular(18),
//           //               image: const DecorationImage(
//           //                   image: ImageString.ayat,
//           //                   fit: BoxFit.fill,
//           //                   alignment:
//           //                       Alignment.bottomLeft),
//           //             ),
//           //           ),
//           //         ),
//           //         // Card(
//           //         //   child: Padding(
//           //         //     padding: EdgeInsets.all(15.w),
//           //         //     child: SizedBox(
//           //         //       // height: 105.h,
//           //         //       width: 390.w,
//           //         //       child: Column(
//           //         //         mainAxisAlignment:
//           //         //             MainAxisAlignment.center,
//           //         //         children: [
//           //         //           // SizedBox(
//           //         //           //   height: 5.h,
//           //         //           // ),
//           //         //           Container(
//           //         //             height: 190,
//           //         //             child: ListView(
//           //         //               scrollDirection:
//           //         //                   Axis.horizontal,
//           //         //               children: <Widget>[
//           //         //                 SizedBox(
//           //         //                   height: 10.h,
//           //         //                 ),
//           //         //                 Container(
//           //         //                   width: 200,
//           //         //                   decoration:
//           //         //                       BoxDecoration(
//           //         //                     borderRadius:
//           //         //                         BorderRadius
//           //         //                             .circular(10),
//           //         //                     border: Border.all(
//           //         //                       color: Colors.red,
//           //         //                     ),
//           //         //                   ),
//           //         //                   child: const Center(
//           //         //                       child: Text('')),
//           //         //                 ),
//           //         //                 SizedBox(
//           //         //                   width: 10.h,
//           //         //                 ),
//           //         //                 Container(
//           //         //                   width: 200,
//           //         //                   decoration:
//           //         //                       BoxDecoration(
//           //         //                     borderRadius:
//           //         //                         BorderRadius
//           //         //                             .circular(10),
//           //         //                     border: Border.all(
//           //         //                       color: Colors.red,
//           //         //                     ),
//           //         //                   ),
//           //         //                   child: const Center(
//           //         //                       child: Text('')),
//           //         //                 ),
//           //         //                 SizedBox(
//           //         //                   width: 10.h,
//           //         //                 ),
//           //         //                 Container(
//           //         //                   width: 200,
//           //         //                   decoration:
//           //         //                       BoxDecoration(
//           //         //                     borderRadius:
//           //         //                         BorderRadius
//           //         //                             .circular(10),
//           //         //                     border: Border.all(
//           //         //                       color: Colors.red,
//           //         //                     ),
//           //         //                   ),
//           //         //                   child: const Center(
//           //         //                       child: Text('')),
//           //         //                 ),
//           //         //                 SizedBox(
//           //         //                   width: 10.h,
//           //         //                 ),
//           //         //                 Container(
//           //         //                   width: 200,
//           //         //                   decoration:
//           //         //                       BoxDecoration(
//           //         //                     borderRadius:
//           //         //                         BorderRadius
//           //         //                             .circular(10),
//           //         //                     border: Border.all(
//           //         //                       color: Colors.red,
//           //         //                     ),
//           //         //                   ),
//           //         //                   child: const Center(
//           //         //                       child: Text('')),
//           //         //                 ),
//           //         //               ],
//           //         //             ),
//           //         //           ),
//           //         //           // Row(
//           //         //           //   mainAxisAlignment:
//           //         //           //       MainAxisAlignment.spaceBetween,
//           //         //           //   children: [
//           //         //           //     SizedBox(
//           //         //           //       width: ((390.w - 40.w) / 5.3),
//           //         //           //       child: Column(
//           //         //           //         children: [
//           //         //           //           // Image(
//           //         //           //           //   image: ImageString.namaz,
//           //         //           //           //   width: 50.w,
//           //         //           //           //   height: 50.w,
//           //         //           //           //   color: AppColor.fontColorHeading,
//           //         //           //           // ),
//           //         //           //           Text(
//           //         //           //             'News',
//           //         //           //             maxLines: 1,
//           //         //           //             overflow: TextOverflow.ellipsis,
//           //         //           //             // maxFontSize: 13.w,
//           //         //           //             style: GoogleFonts.inter(
//           //         //           //               fontSize: 13.w,
//           //         //           //               fontWeight: FontWeight.w400,
//           //         //           //               color: AppColor.fontColor,
//           //         //           //             ),
//           //         //           //           ),
//           //         //           //
//           //         //           //         ],
//           //         //           //       ),
//           //         //           //     ),
//           //         //           //     SizedBox(
//           //         //           //       width: 5.w,
//           //         //           //     ),
//           //         //           //     SizedBox(
//           //         //           //       width: ((390.w - 40.w) / 5.3),
//           //         //           //       child: Column(
//           //         //           //         children: [
//           //         //           //           Image(
//           //         //           //             image: ImageString.calendar,
//           //         //           //             width: 50.w,
//           //         //           //             height: 50.w,
//           //         //           //             color: AppColor.fontColorHeading,
//           //         //           //           ),
//           //         //           //           Text(
//           //         //           //             'Ajj Ki',
//           //         //           //             maxLines: 1,
//           //         //           //             overflow: TextOverflow.ellipsis,
//           //         //           //             // maxFontSize: 13.w,
//           //         //           //             style: GoogleFonts.inter(
//           //         //           //               fontSize: 13.w,
//           //         //           //               fontWeight: FontWeight.w400,
//           //         //           //               color: AppColor.fontColor,
//           //         //           //             ),
//           //         //           //           ),
//           //         //           //           Text(
//           //         //           //             'Baat',
//           //         //           //             maxLines: 1,
//           //         //           //             overflow: TextOverflow.ellipsis,
//           //         //           //             // maxFontSize: 13.w,
//           //         //           //             style: GoogleFonts.inter(
//           //         //           //               fontSize: 13.w,
//           //         //           //               fontWeight: FontWeight.w400,
//           //         //           //               color: AppColor.fontColor,
//           //         //           //             ),
//           //         //           //           ),
//           //         //           //         ],
//           //         //           //       ),
//           //         //           //     ),
//           //         //           //     SizedBox(
//           //         //           //       width: 5.w,
//           //         //           //     ),
//           //         //           //     InkWell(
//           //         //           //       onTap: () {
//           //         //           //         print(1);
//           //         //           //         Navigator.pushNamed(
//           //         //           //             context, RouteString.surahListScreen);
//           //         //           //       },
//           //         //           //       child: SizedBox(
//           //         //           //         width: ((390.w - 40.w) / 5.3),
//           //         //           //         child: Column(
//           //         //           //           children: [
//           //         //           //             Image(
//           //         //           //               image: ImageString.quran,
//           //         //           //               width: 50.w,
//           //         //           //               height: 50.w,
//           //         //           //               color: AppColor.fontColorHeading,
//           //         //           //             ),
//           //         //           //             Text(
//           //         //           //               'Khulasa E',
//           //         //           //               maxLines: 1,
//           //         //           //               overflow: TextOverflow.ellipsis,
//           //         //           //               // maxFontSize: 13.w,
//           //         //           //               style: GoogleFonts.inter(
//           //         //           //                 fontSize: 13.w,
//           //         //           //                 fontWeight: FontWeight.w400,
//           //         //           //                 color: AppColor.fontColor,
//           //         //           //               ),
//           //         //           //             ),
//           //         //           //             Text(
//           //         //           //               'Quran',
//           //         //           //               maxLines: 1,
//           //         //           //               overflow: TextOverflow.ellipsis,
//           //         //           //               // maxFontSize: 13.w,
//           //         //           //               style: GoogleFonts.inter(
//           //         //           //                 fontSize: 13.w,
//           //         //           //                 fontWeight: FontWeight.w400,
//           //         //           //                 color: AppColor.fontColor,
//           //         //           //               ),
//           //         //           //             ),
//           //         //           //           ],
//           //         //           //         ),
//           //         //           //       ),
//           //         //           //     ),
//           //         //           //     SizedBox(
//           //         //           //       width: 5.w,
//           //         //           //     ),
//           //         //           //     SizedBox(
//           //         //           //       width: ((390.w - 40.w) / 5.3),
//           //         //           //       child: Column(
//           //         //           //         children: [
//           //         //           //           Image(
//           //         //           //             image: ImageString.books,
//           //         //           //             width: 50.w,
//           //         //           //             height: 50.w,
//           //         //           //             color: AppColor.fontColorHeading,
//           //         //           //           ),
//           //         //           //           Text(
//           //         //           //             'Ramzan',
//           //         //           //             maxLines: 1,
//           //         //           //             overflow: TextOverflow.ellipsis,
//           //         //           //             // maxFontSize: 13.w,
//           //         //           //             style: GoogleFonts.inter(
//           //         //           //               fontSize: 13.w,
//           //         //           //               fontWeight: FontWeight.w400,
//           //         //           //               color: AppColor.fontColor,
//           //         //           //             ),
//           //         //           //           ),
//           //         //           //           Text(
//           //         //           //             'Bayanat',
//           //         //           //             maxLines: 1,
//           //         //           //             overflow: TextOverflow.ellipsis,
//           //         //           //             // maxFontSize: 13.w,
//           //         //           //             style: GoogleFonts.inter(
//           //         //           //               fontSize: 13.w,
//           //         //           //               fontWeight: FontWeight.w400,
//           //         //           //               color: AppColor.fontColor,
//           //         //           //             ),
//           //         //           //           ),
//           //         //           //         ],
//           //         //           //       ),
//           //         //           //     ),
//           //         //           //     SizedBox(
//           //         //           //       width: 5.w,
//           //         //           //     ),
//           //         //           //     SizedBox(
//           //         //           //       width: ((390.w - 40.w) / 5.3),
//           //         //           //       child: Column(
//           //         //           //         children: [
//           //         //           //           Image(
//           //         //           //             image: ImageString.molviCategories,
//           //         //           //             width: 50.w,
//           //         //           //             height: 50.w,
//           //         //           //             color: AppColor.fontColorHeading,
//           //         //           //           ),
//           //         //           //           Text(
//           //         //           //             'Ulema Ke',
//           //         //           //             maxLines: 1,
//           //         //           //             overflow: TextOverflow.ellipsis,
//           //         //           //             // maxFontSize: 13.w,
//           //         //           //             style: GoogleFonts.inter(
//           //         //           //               fontSize: 13.w,
//           //         //           //               fontWeight: FontWeight.w400,
//           //         //           //               color: AppColor.fontColor,
//           //         //           //             ),
//           //         //           //           ),
//           //         //           //           Text(
//           //         //           //             'Bayanat',
//           //         //           //             maxLines: 1,
//           //         //           //             overflow: TextOverflow.ellipsis,
//           //         //           //             // maxFontSize: 13.w,
//           //         //           //             style: GoogleFonts.inter(
//           //         //           //               fontSize: 13.w,
//           //         //           //               fontWeight: FontWeight.w400,
//           //         //           //               color: AppColor.fontColor,
//           //         //           //             ),
//           //         //           //           ),
//           //         //           //         ],
//           //         //           //       ),
//           //         //           //     ),
//           //         //           //   ],
//           //         //           // )
//           //         //         ],
//           //         //       ),
//           //         //     ),
//           //         //   ),
//           //         // ),
//           //       ],
//           //     ),
//           //   ),
//           // ),
//
//           // Container(
//           //   width: double.infinity,
//           //   // height: Get.height,
//           //   padding: EdgeInsets.symmetric(
//           //       horizontal: 10.0.w, vertical: 15.0.h),
//           //   child: Column(
//           //     mainAxisSize: MainAxisSize.max,
//           //     children: <Widget>[
//           //       Shimmer.fromColors(
//           //         baseColor: Color(0xffAEAEAE),
//           //         highlightColor: Colors.white,
//           //         child: ListView.builder(
//           //           shrinkWrap: true,
//           //           itemBuilder: (_, __) => Padding(
//           //             padding: EdgeInsets.only(bottom: 8.h),
//           //             child: Container(
//           //               padding: EdgeInsets.all(10.sp),
//           //               child: Row(
//           //                 crossAxisAlignment: CrossAxisAlignment.start,
//           //                 children: <Widget>[
//           //                   Container(
//           //                     width: 80.0.w,
//           //                     height: 80.0.h,
//           //                     color: Colors.white,
//           //                   ),
//           //                   SizedBox(
//           //                     width: 15.h,
//           //                   ),
//           //                   Expanded(
//           //                     child: Column(
//           //                       crossAxisAlignment:
//           //                       CrossAxisAlignment.start,
//           //                       children: <Widget>[
//           //                         Container(
//           //                           width: double.infinity,
//           //                           height: 10..h,
//           //                           color: Colors.white,
//           //                         ),
//           //                         Padding(
//           //                           padding: EdgeInsets.symmetric(
//           //                               vertical: 2.w),
//           //                         ),
//           //                         Container(
//           //                           width: double.infinity,
//           //                           height: 10.h,
//           //                           color: Colors.white,
//           //                         ),
//           //                         SizedBox(
//           //                           height: 10.h,
//           //                         ),
//           //                         Container(
//           //                           width: 40.w,
//           //                           height: 10.h,
//           //                           color: Colors.white,
//           //                         ),
//           //                       ],
//           //                     ),
//           //                   )
//           //                 ],
//           //               ),
//           //             ),
//           //           ),
//           //           itemCount: 6,
//           //         ),
//           //       ),
//           //     ],
//           //   ),
//           // ),
//         ],
//       ),
//     ),
//   ),
// ),
// Card(
//   child: Padding(
//     padding: EdgeInsets.symmetric(vertical: 15.h),
//     child: SizedBox(
//       // height: 170.h,
//       width: 361.w,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Card(
//             child: Padding(
//               padding: EdgeInsets.only(left: 15.w),
//               child: SizedBox(
//                 height: 51.h,
//                 width: 361.w,
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment:
//                           MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment:
//                           CrossAxisAlignment.start,
//                       children: [
//                         const CardHeading(
//                             text: "Daily Ayat"),
//                         Row(
//                           mainAxisAlignment:
//                               MainAxisAlignment.end,
//                           children: [
//                             Image(
//                               image:
//                                   ImageString.profileIcon,
//                               width: 30.w,
//                               height: 30.w,
//                               // color: AppColor.fontColorHeading,
//                             ),
//                             Image(
//                               image: ImageString.appBarLogo,
//                               width: 30.w,
//                               height: 30.w,
//                               // color: AppColor.fontColorHeading,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     // SizedBox(
//                     //   height: 10.h,
//                     // ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 10.h,
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 15.w),
//             child: KText2(
//               text: "Verse",
//               fontSize: 12.w,
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 15.w),
//             child: KText2(
//               text: "Surat-un-Najam [53-40]",
//               fontSize: 8.w,
//             ),
//           ),
//           SizedBox(
//             height: 10.h,
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 15.w),
//             child: const Align(
//               alignment: Alignment.centerRight,
//               child: Image(
//                 image: ImageString.ayat,
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   ),
// ),
// Card(
//   child: Padding(
//     padding: EdgeInsets.symmetric(vertical: 15.h),
//     child: SizedBox(
//       // height: 170.h,
//       width: 361.w,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Card(
//             child: Padding(
//               padding: EdgeInsets.only(left: 15.w),
//               child: SizedBox(
//                 height: 51.h,
//                 width: 361.w,
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment:
//                           MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment:
//                           CrossAxisAlignment.start,
//                       children: [
//                         const CardHeading(
//                             text: "Daily Hadith"),
//                         Row(
//                           mainAxisAlignment:
//                               MainAxisAlignment.end,
//                           children: [
//                             Image(
//                               image: ImageString.speaker,
//                               width: 30.w,
//                               height: 30.w,
//                               // color: AppColor.fontColorHeading,
//                             ),
//                             Image(
//                               image: ImageString.heart,
//                               width: 30.w,
//                               height: 30.w,
//                               // color: AppColor.fontColorHeading,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     // SizedBox(
//                     //   height: 10.h,
//                     // ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 10.h,
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 15.w),
//             child: KText2(
//               text: "Hadith of the Moment",
//               fontSize: 12.w,
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 15.w),
//             child: KText2(
//               text: "Sahi Bukhari",
//               fontSize: 8.w,
//             ),
//           ),
//           SizedBox(
//             height: 10.h,
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 15.w),
//             child: const Align(
//               alignment: Alignment.centerRight,
//               child: Image(
//                 image: ImageString.hadith,
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   ),
// ),
// Card(
//   child: Padding(
//     padding: EdgeInsets.symmetric(vertical: 15.h),
//     child: SizedBox(
//       // height: 280.h,
//
//       width: 361.w,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Card(
//             child: Padding(
//               padding: EdgeInsets.only(left: 15.w),
//               child: SizedBox(
//                 height: 51.h,
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment:
//                           MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment:
//                           CrossAxisAlignment.start,
//                       children: [
//                         const CardHeading(
//                             text: "Daily Dua"),
//                         Row(
//                           mainAxisAlignment:
//                               MainAxisAlignment.end,
//                           children: [
//                             Image(
//                               image: ImageString.speaker,
//                               width: 30.w,
//                               height: 30.w,
//                               // color: AppColor.fontColorHeading,
//                             ),
//                             Image(
//                               image: ImageString.heart,
//                               width: 30.w,
//                               height: 30.w,
//                               // color: AppColor.fontColorHeading,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 10.h,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 10.h,
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 15.w),
//             child: KText2(
//               text: "Dua",
//               fontSize: 12.w,
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 15.w),
//             child: KText2(
//               text: "Supplication before ablution",
//               fontSize: 8.w,
//             ),
//           ),
//           SizedBox(
//             height: 10.h,
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 15.w),
//             child: const Align(
//               alignment: Alignment.centerRight,
//               child: Image(
//                 image: ImageString.dua1,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 10.h,
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 15.w),
//             child: const Align(
//               alignment: Alignment.centerRight,
//               child: Image(
//                 image: ImageString.dua2,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 10.h,
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 15.w),
//             child: const Align(
//               alignment: Alignment.centerRight,
//               child: Image(
//                 image: ImageString.dua3,
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   ),
// ),
  }
}
