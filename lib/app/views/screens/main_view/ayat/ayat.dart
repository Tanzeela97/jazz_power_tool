import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jazzpowertoolsapp/app/data/constant/app_color.dart';

import '../../../../data/constant/image_string.dart';

class AyatScreen extends StatefulWidget {
  const AyatScreen();

  @override
  State<AyatScreen> createState() => _AyatScreenState();
}

class _AyatScreenState extends State<AyatScreen> {
  int currentDay = DateTime.now().day;

  final ayats = [
    "البقرہ: اے ایمان والو! تم پر روزے فرض کیے گئے ہیں جس طرح تم سے پہلے لوگوں پر فرض کیے گئے تھے تاکہ تم پرہیزگاری اختیار کرو۔"
        "البقرہ: چند دنوں کے لیے۔ لیکن تم میں سے جو کوئی بیمار ہو یا سفر پر ہو تو وہ دوسرے دنوں کی تعداد میں روزے رکھے۔"
        "البقرہ: اور جو اس کی استطاعت نہیں رکھتے وہ کسی مسکین کو کھانا کھلا کر فدیہ لے سکتے ہیں۔"
        "البقرہ: رمضان وہ مہینہ ہے جس میں قرآن نازل کیا گیا جو لوگوں کے لیے ہدایت ہے اور ہدایت اور امتیاز کی واضح دلیلیں ہیں۔"
        "البقرہ: اللہ تمہارے لیے آسانی چاہتا ہے اور تمہارے لیے تنگی نہیں چاہتا"
        "البقرہ: کھاؤ پیو یہاں تک کہ دن کی سفیدی رات کی تاریکی سے فجر کے وقت واضح ہو جائے، پھر رات تک روزہ پورا کرو۔"
        "البقرہ: وہ لوگ جو غیب پر ایمان رکھتے ہیں اور نماز قائم کرتے ہیں اور جو کچھ ہم نے انہیں دیا ہے اس میں سے خرچ کرتے ہیں۔"
        "البقرہ: یہی لوگ اپنے رب کی طرف سے سیدھے راستے پر ہیں اور یہی لوگ فلاح پانے والے ہیں۔"
        "البقرہ: اے لوگو! اپنے رب کی بندگی کرو جس نے تمہیں اور تم سے پہلے لوگوں کو پیدا کیا تاکہ تم پرہیزگار بنو۔"
        "البقرہ: وہی ہے جس نے تمہارے لیے جو کچھ زمین میں ہے پیدا کیا، اور اس نے اپنے آپ کو آسمان کی طرف متوجہ کیا، تو اس نے ان کو سات آسمان بنائے۔"
        "البقرہ: اور حق کو باطل کے ساتھ نہ ملایا کرو اور نہ حق کو چھپاؤ جبکہ تم جانتے ہو۔"

  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Container(
        height: 250,
        width: double.infinity,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            padding: const EdgeInsets.all(16),

            decoration:  BoxDecoration(

              borderRadius: BorderRadius.circular(18),
              color: AppColor.white,
              image: const DecorationImage(

                image: ImageString.ayatBackground,
                fit: BoxFit.fill,
              ),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 1, // Display only one ayat
              itemBuilder: (context, index) => ListTile(
                title: Container(
                  child: Text(

                    ayats[(currentDay - 1) % ayats.length],
                    // Use modulo operator to handle index out of range
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,

                    style:const TextStyle(
                      color: AppColor.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
