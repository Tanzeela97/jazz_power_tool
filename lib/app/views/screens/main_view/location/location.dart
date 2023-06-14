import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/home_screen/home_screen_controller.dart';
import '../../../../data/constant/app_color.dart';
import '../../../../data/constant/image_string.dart';
import '../../../../data/constant/route_string.dart';

class Location extends StatelessWidget {
  final homeController = Get.put(
      HomeScreenController(const bool.fromEnvironment('dart.library.js_util')));


  @override
  Widget build(BuildContext context) {
    String lang = Get.locale!.toLanguageTag();
    return Scaffold(
      body: Row(
        mainAxisAlignment: lang == "ur"
            ? MainAxisAlignment.start
            : MainAxisAlignment.start,
        // crossAxisAlignment:
        //     CrossAxisAlignment.start,
        children: [
          Container(
            width: 75.w,
            alignment: lang == "ur"
                ? Alignment.centerRight
                : Alignment.centerLeft,
            // color: Colors.amber,
            child: FittedBox(
              child: Text(
                homeController
                    .selectedCity.name,
                maxLines: 1,
                overflow:
                TextOverflow.ellipsis,
                textAlign: lang == "ur"
                    ? TextAlign.right
                    : TextAlign.left,
                style: TextStyle(
                  fontFamily: lang == "ur"
                      ? 'j_n_n'
                      : "Poppins",
                  fontWeight:
                  FontWeight.normal,
                  fontSize: lang == "ur"
                      ? 22.sp
                      : 18.sp,
                  color: AppColor
                      .fontColorButton,
                ),
              ),
            ),
          ),
          TextButton(
            style: ButtonStyle(
              overlayColor:
              MaterialStateProperty.all(
                  Colors.transparent),
            ),
            onPressed: () {
// print(1);
// citySelectDialogue(
//     context, controller);
              Navigator.pushNamed(
                  context,
                  RouteString
                      .cityListScreen);
            },
            child: Container(
              width: 45.w,
              height: 30.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
// color:
//     AppColor.fontColorButton,
                borderRadius:
                BorderRadius.circular(
                    4),
              ),

            ),
          ),
        ],
      ));

  }
}
