import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jazzpowertoolsapp/app/data/constant/app_color.dart';

import '../../../../controller/home_screen/home_screen_controller.dart';
import '../../../../data/constant/image_string.dart';
import '../../../widgets/button_text2.dart';

class JokeScreen extends StatelessWidget {
  JokeScreen({Key? key}) : super(key: key);
  int currentDay = DateTime.now().day;

  final joke = [
    " کوئی آنکھوں سے بات کر لیتا ہے. کوئی آنکھوں میں ملاقات کرلیتا ہے. بڑا مشکل ہوتا ہے جواب دینا. جب کوئی انگلش میں سوالات کر لیتا ہے"
        " زندگی بےحال ہے سُر ہے نہ تال ہے. میسج باکس بھی کنگال ہے. کیا آپ کی ایس ایم ایس فیکٹری میں ہڑتال ہے. یار کچھ تو بھیجو یہ میرے موبائل کی زندگی کا سوال ہے"
        " پھول ایسا ہو جو گھر کو خوشبو سے بھردے،ہم سفر ایسا ہو جو اندھیروں کو روشن کردے،دوست ایسا ہو جو زندگی کو خوشی اور موبائل کو بیلنس سے بھردے"
        "آج اپنی گرل فرینڈ کی شادی میں آ کے یہ احساس ہوا کہ مٹر پنیر اچھا ہو تو محبت بھی پھیکی لگتی ہے۔ ایک پلیٹ اور دے یار دل ٹوٹا ہے!"
        " آنسو تیرے نکلیں تو آنکھیں میری ہوں. دل تیرا دھڑکے تو دھڑکن میری ہو. خدا کرے دوستی ہماری اتنی گہری ہو. کہ نوکری تو کرے اور سیلری میری ہو"
        " بیوی کو اپنی پلکوں پہ بٹھا لو. دے کر خوشی سارے غم چرا لو. پیار ایسا کرو کہ سب دیکھتے رہ جائیں. پڑوسن بھی کہے،مجھے اپنا بنا لو"
        " جو مشکل سے ملے وہ ہے خوشی، جو کسی کسی کو ملے وہ ہے پیار، جو سب کو ملے وہ ہے غم، جو نصیب والوں کو ملے وہ ہیں ہم، ہے نہ بات میں دم۔"
        " یہ سن کر دماغ ہی گھوم گیا جناب، جب گرل فرینڈ کی دادی نے مجھ سے پوچھا، تم فیس بک پر فراز؟"
        " ساری زندگی کر کے برباد عشق کی لذت چکھ لی، اس نے بھی برقعہ پہن لیا ہم نے بھی داڑھی رکھ لی"
        " اس بے وفا کو نہ آیا ہماری محبت کا یقین، ہم نے کہا ہم مر جائیں اس نے کہا آمین۔ثمہ آمین"
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final jokeController = Get.put(HomeScreenController(
        const bool.fromEnvironment('dart.library.js_util')));
    String lang = Get.locale!.languageCode;

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
          gradient: LinearGradient(
            // begin: lang == "ur" ? Alignment.topLeft : Alignment.topRight,
            // end: lang == "ur" ? Alignment.bottomRight : Alignment.bottomRight,
            colors: const [AppColor.red, AppColor.red],
          ),
          borderRadius: BorderRadius.circular(18),
          color: AppColor.red,
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
                    "joke_of_the_day".tr,
                 //   textAlign: lang == "ur_PK" ? TextAlign.right : TextAlign.left,
                    style: TextStyle(
                      fontSize: lang == "ur" ? 60.sp : 40.sp,
                      fontFamily:
                          lang == "ur" ? 'Jameel Noori Nastaleeq' : "Poppins",
                      fontWeight: FontWeight.bold,
                      color: AppColor.fontColorButton,
                    ),
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
                    ? jokeController.jokeOfTheDay.urdu!
                    : jokeController.jokeOfTheDay.english!,
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
