import 'package:cache_manager/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import '../../controller/drawer/drawer.dart';
import '../../data/constant/app_color.dart';
import '../../data/constant/image_string.dart';

Future<dynamic> confirmDialoge(
    {required BuildContext context,
      required String title,
      required String msg,
      required String funButtonTitle,
      required String cancelButtonTitle,
      required Function function,
      required Function cancelFunction,
      required String fontFamily}) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SizedBox(
          // width: 332.w,
          // height: 108.h,
          child: AlertDialog(
            // title: Text("Success"),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(33),
              ),
            ),
            title: Text(
              "",
              style: TextStyle(
                fontSize: fontFamily == "j_n_n_k" ? 28.sp : 20.sp,
                color: AppColor.red,
                fontFamily: fontFamily,
              ),
            ),
            // title: Text(
            //   title,
            //   style: TextStyle(
            //     fontSize: fontFamily == "j_n_n_k" ? 28.sp : 20.sp,
            //     color: AppColor.red,
            //     fontFamily: fontFamily,
            //   ),
            // ),
            content: Container(
              padding: EdgeInsets.all(10.w),
              // alignment: Alignment.center,
            //   child: Text(
            //     msg,
            //     style: TextStyle(
            //       fontSize: fontFamily == "j_n_n_k" ? 25.sp : 18.sp,
            //       fontFamily: fontFamily,
            //     ),
            //     textAlign: TextAlign.center,
            //   ),
            // ),
            child: Text(
              "کیا تم باہر جانا چاہتے ہو",
              style: TextStyle(
                fontSize: fontFamily == "j_n_n_k" ? 25.sp : 18.sp,
                fontFamily: fontFamily,
              ),
              textAlign: TextAlign.center,
            ),
          ),
            actionsAlignment: MainAxisAlignment.spaceAround,
            actions: [
              SizedBox(
                width: 70,
                height: 70,
                child: TextButton(
                  onPressed: () {
                    cancelFunction();
                  }, child: Text(" ہاں",style: TextStyle(fontSize: 20,color: AppColor.red),),
                  // icon: Image(
                  //   image: ImageString.jazzLogo,
                  //   fit: BoxFit.fill,
                  // ),
                ),
              ),
              SizedBox(
                height: 70,
                width: 70,
                // child: IconButton(
                //   onPressed: () {
                //     function();
                //     // Navigator.pop(context);
                //   },
                //   icon: Image(
                //     image: ImageString.jazzLogo,
                //     fit: BoxFit.fill,
                //   ),
                // ),
               child: TextButton(
                  onPressed: () {
                    cancelFunction();
                  }, child: Text("نہیں",style: TextStyle(fontSize: 20,color: AppColor.red),),
              ),),
            ],
          ),
        );
      });
}

Future<dynamic> languageSelectDialogue(
    BuildContext context, MoreScreenController controller, bool login) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SizedBox(
          child: AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(33),
              ),
            ),
            content: Container(
              width: 231.w,
              height: 200.h,
              padding: EdgeInsets.all(10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () async {
                      controller.setLanguage("اردو");
                      if (login) {
                        await WriteCache.setString(key: "lang", value: "ur");
                      } else {
                        await WriteCache.setString(key: "lang", value: "ur");
                      }
                      var locale = const Locale("ur", "PK");
                      Get.updateLocale(locale);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "اردو",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColor.red,
                          fontFamily: "j_n_n_k"),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Container(
                    width: 108.w,
                    height: 1.h,
                    color: AppColor.dividerColor,
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  TextButton(
                    onPressed: () async {
                      controller.setLanguage("English");
                      if (login) {
                        await WriteCache.setString(key: "lang", value: "en");
                      } else {
                        await WriteCache.setString(key: "lang", value: "ur");
                      }
                      var locale = const Locale("en", "US");
                      Get.updateLocale(locale);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "English",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColor.red,
                        fontFamily: "Poppins",
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
