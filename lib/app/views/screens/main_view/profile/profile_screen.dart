import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/constant/app_color.dart';
import '../../../../data/constant/image_string.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen();

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Profile",
          style: GoogleFonts.inter(
            fontSize: 21.sp,
            fontWeight: FontWeight.w600,
            color: AppColor.white,
          ),
        ),
        actions: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(10.sp),
              child: Text(
                "Edit",
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 25.h,
            ),
            CircleAvatar(
              radius: 50.w,
              backgroundColor: AppColor.scaffoldBackgroundColor,
              child:  Image(
                image: ImageString.proPicMale,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Shaikh Zohaib Akram",
              style: GoogleFonts.inter(
                fontSize: 19.sp,
                fontWeight: FontWeight.w600,
                // color: color.redButton,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Member since September-2022",
              style: GoogleFonts.inter(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                // color: color.redButton,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.w),
              child: Card(
                elevation: 5,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        "Gender",
                        style: GoogleFonts.inter(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          // color: color.redButton,
                        ),
                      ),
                      trailing: Text(
                        "Male",
                        style: GoogleFonts.inter(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          // color: color.redButton,
                        ),
                      ),
                    ),
                    Divider(
                      color: AppColor.dividerColor,
                    ),
                    ListTile(
                      title: Text(
                        "Location",
                        style: GoogleFonts.inter(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          // color: color.redButton,
                        ),
                      ),
                      trailing: Text(
                        "Karachi",
                        style: GoogleFonts.inter(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          // color: color.redButton,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 140.h,
            ),
            Container(
              width: 366.w,
              padding: EdgeInsets.all(15.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColor.red,
              ),
              child: Text(
                "Logout",
                style: GoogleFonts.inter(
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.fontColorButton,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: 366.w,
              padding: EdgeInsets.all(15.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColor.scaffoldBackgroundColor,
              ),
              child: Text(
                "Deactivate",
                style: GoogleFonts.inter(
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.red,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: 366.w,
              padding: EdgeInsets.fromLTRB(25.w, 15.h, 10.w, 15.h),
              // margin: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 49.w,
                    height: 42.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.sp),
                      color: AppColor.inactiveButtonColor,
                    ),
                    child: Image(
                      image: ImageString.jazzLogo,
                      width: 30.w,
                      height: 30.h,
                    ),
                  ),
                  SizedBox(
                    width: 250.w,
                    child: Column(
                      children: [
                        Text(
                          "Want to give us feedback?",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            // color: color.redButton,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "Share your thoughts now",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            // color: color.redButton,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_right,
                    color: AppColor.inactiveButtonColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
