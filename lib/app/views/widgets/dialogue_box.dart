import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controller/home_screen/home_screen_controller.dart';
import 'ktext1.dart';


Future<dynamic> citySelectDialogue(
    BuildContext context, HomeScreenController controller) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SizedBox(
          // width: 231.w,
          // height: 127.h,
          child: AlertDialog(
            // title: Text("Success"),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.sp))),
            content: SingleChildScrollView(
              child: Container(
                width: 231.w,
                // height: 150.h,
                padding: EdgeInsets.all(25.w),
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                 //   itemCount: controller.cities.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ListTile(
                          onTap: () {
                          //  controller.selectCity(controller.cities[index]);
                            Navigator.pop(context);
                          },
                          title: KText1(
                              text: 'City',
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500, fontFamily: '',),
                        )),
              ),
            ),
          ),
        );
      });
}
