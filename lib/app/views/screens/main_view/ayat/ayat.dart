import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jazzpowertoolsapp/app/data/constant/app_color.dart';

import '../../../../controller/home_screen/home_screen_controller.dart';
import '../../../../data/constant/image_string.dart';
import '../../../widgets/button_text2.dart';

class AyatScreen extends StatefulWidget {
  const AyatScreen();

  @override
  State<AyatScreen> createState() => _AyatScreenState();
}

class _AyatScreenState extends State<AyatScreen> {
  int currentDay = DateTime.now().day;
  final homeController = Get.put(
      HomeScreenController(const bool.fromEnvironment('dart.library.js_util')));

  // final ayats = [
  //   "البقرہ: اے ایمان والو! تم پر روزے فرض کیے گئے ہیں جس طرح تم سے پہلے لوگوں پر فرض کیے گئے تھے تاکہ تم پرہیزگاری اختیار کرو۔"
  //       "البقرہ: چند دنوں کے لیے۔ لیکن تم میں سے جو کوئی بیمار ہو یا سفر پر ہو تو وہ دوسرے دنوں کی تعداد میں روزے رکھے۔"
  //       "البقرہ: اور جو اس کی استطاعت نہیں رکھتے وہ کسی مسکین کو کھانا کھلا کر فدیہ لے سکتے ہیں۔"
  //       "البقرہ: رمضان وہ مہینہ ہے جس میں قرآن نازل کیا گیا جو لوگوں کے لیے ہدایت ہے اور ہدایت اور امتیاز کی واضح دلیلیں ہیں۔"
  //       "البقرہ: اللہ تمہارے لیے آسانی چاہتا ہے اور تمہارے لیے تنگی نہیں چاہتا"
  //       "البقرہ: کھاؤ پیو یہاں تک کہ دن کی سفیدی رات کی تاریکی سے فجر کے وقت واضح ہو جائے، پھر رات تک روزہ پورا کرو۔"
  //       "البقرہ: وہ لوگ جو غیب پر ایمان رکھتے ہیں اور نماز قائم کرتے ہیں اور جو کچھ ہم نے انہیں دیا ہے اس میں سے خرچ کرتے ہیں۔"
  //       "البقرہ: یہی لوگ اپنے رب کی طرف سے سیدھے راستے پر ہیں اور یہی لوگ فلاح پانے والے ہیں۔"
  //       "البقرہ: اے لوگو! اپنے رب کی بندگی کرو جس نے تمہیں اور تم سے پہلے لوگوں کو پیدا کیا تاکہ تم پرہیزگار بنو۔"
  //       "البقرہ: وہی ہے جس نے تمہارے لیے جو کچھ زمین میں ہے پیدا کیا، اور اس نے اپنے آپ کو آسمان کی طرف متوجہ کیا، تو اس نے ان کو سات آسمان بنائے۔"
  //       "البقرہ: اور حق کو باطل کے ساتھ نہ ملایا کرو اور نہ حق کو چھپاؤ جبکہ تم جانتے ہو۔"
  //
  // ];

  @override
  Widget build(BuildContext context) {
    String lang = Get.locale!.languageCode;
    // return Card(
    //   elevation: 5,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(18),
    //   ),
    //   child: Container(
    //     height: 250,
    //     width: double.infinity,
    //     child: Directionality(
    //       textDirection: TextDirection.rtl,
    //       child: Container(
    //         padding: const EdgeInsets.all(16),
    //
    //         decoration:  BoxDecoration(
    //
    //           borderRadius: BorderRadius.circular(18),
    //           color: AppColor.white,
    //           image: const DecorationImage(
    //
    //             image: ImageString.ayatBackground,
    //             fit: BoxFit.fill,
    //           ),
    //         ),
    //         child: ListView.builder(
    //           shrinkWrap: true,
    //           itemCount: 1, // Display only one ayat
    //           itemBuilder: (context, index) => ListTile(
    //             title: Container(
    //               child: Text(
    //
    //                 ayats[(currentDay - 1) % ayats.length],
    //                 // Use modulo operator to handle index out of range
    //                 maxLines: 10,
    //                 overflow: TextOverflow.ellipsis,
    //
    //                 style:const TextStyle(
    //                   color: AppColor.white,
    //                   fontSize: 18,
    //                   fontWeight: FontWeight.w700,
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    //
    // );
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Container(
        // height: 220.h,
        constraints: BoxConstraints(minHeight: 280.h),
        width: 360.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          image: const DecorationImage(
            image: ImageString.ayatBackground,
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ayat_of_the_day".tr,
                    textAlign: lang == "ur" ? TextAlign.right : TextAlign.left,
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: lang == "ur" ? 60.sp : 40.sp,
                      fontFamily:
                      lang == "ur" ? 'Jameel Noori Nastaleeq' : "Poppins",
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image(
                      //   image: ImageString.whiteHeart,
                      //   width: 50.w,
                      //   height: 50.h,
                      // ),
                      // Image(
                      //   image: ImageString.whiteSpeaker,
                      //   width: 50.w,
                      //   height: 50.h,
                      // ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 10.h),

              const Divider(
                color: Colors.white,
                height: 20,
              ),

              SizedBox(height: 6.h),
              Text(
                lang == "ur"
                    ? homeController.ayatOfTheDay.urdu!
                    : homeController.ayatOfTheDay.english!,
                // maxLines: 1,
                // overflow: TextOverflow.ellipsis,
                //  textAlign: lang == "ur" ? TextAlign.right : TextAlign.left,
                style: TextStyle(
                  fontFamily:
                  lang == "ur" ? "Jameel Noori Nastaleeq" : "Poppins",
                  fontSize: lang == "ur" ? 35.sp : 20.sp,
                  wordSpacing: 2,
                  height: 2,
                  fontWeight: FontWeight.w500,
                  color: AppColor.fontColorButton,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
