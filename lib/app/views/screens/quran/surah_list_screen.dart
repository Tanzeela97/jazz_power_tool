import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jazzpowertoolsapp/app/data/constant/app_color.dart';

import '../../../data/constant/image_string.dart';
import '../../../data/constant/route_string.dart';

class SurahListScreen extends StatefulWidget {
  const SurahListScreen();

  @override
  State<SurahListScreen> createState() => _SurahListScreenState();
}

class _SurahListScreenState extends State<SurahListScreen> {
  final item = [
    // "Al-Fatiha",
    // "Al-Baqarah",
    // "Ali 'Imran",
    // "An-Nisa",
    // "Al-Ma'idah",
    // "Al-An'am",
    // "Al-A'raf"
    "الفاتحہ",
    "البقرہ",
    "علی عمران",
    "النساء",
    "المائدۃ",
    "الانعام",
    "الاعراف"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Container(
                    height: 150.h,
                    width: 390.w,
                    alignment: Alignment.center,
                    child: Text(
                      'قرآن',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Jameel Noori Nastaleeq',
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w600,
                         color: AppColor.fontColorButton,
                      ),
                    ),
                    decoration: const BoxDecoration(
                      color: AppColor.red,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      // color: Colors.black,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: item.length,
                    itemBuilder: (context, index) => ListTile(
                      onTap: () =>
                          Navigator.pushNamed(context, RouteString.quranScreen),
                      leading: Image(
                        image: ImageString.favoriteIcon,
                        height: 25.h,
                        width: 25.w,
                      ),
                      title: Text(
                        item[index],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w500,
                          // color: AppColor.fontColorButton,
                        ),
                      ),
                    ),
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
