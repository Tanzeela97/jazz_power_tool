import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:jazzpowertoolsapp/app/views/widgets/widget_loader.dart';

import '../../../../controller/drawer/drawer.dart';
import '../../../../controller/home_screen/home_screen_controller.dart';
import '../../../../data/constant/app_color.dart';
import '../../../widgets/button_text2.dart';
import '../../../widgets/dialogue_widget.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen();

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  final lang = Get.locale!.languageCode;
  final controller = Get.put(MoreScreenController());
  HomeScreenController homeScreenController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "language".tr,
                  style: TextStyle(
                      fontSize: lang == "ur" ? 35.sp : 25.sp,
                      wordSpacing: 2,
                      fontWeight: FontWeight.bold,
                      color: AppColor.red,
                      fontFamily: lang == "ur" ? "j_n_n_k" : "Poppins"),
                ),
                SizedBox(
                  height: 22.h,
                ),
                GestureDetector(
                  onTap: () {
                    languageSelectDialogue(
                        context, controller, homeScreenController.login);
                  },
                  child: GetBuilder<MoreScreenController>(
                    builder: (_) => Container(
                      width: 310.w,
                      height: 50.h,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColor.dividerColor,
                          ),
                          borderRadius:
                          BorderRadius.all(Radius.circular(15.sp))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.language,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: lang == "ur" ? 30.sp : 20.sp,
                                fontWeight: FontWeight.normal,
                                color: AppColor.red,
                                fontFamily:
                                lang == "ur" ? "j_n_n_k" : "Poppins"),
                            textAlign: TextAlign.center,
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: AppColor.red,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                GetBuilder<MoreScreenController>(builder: (_) {
                  if (controller.loading) {
                    return const WidgetLoading();
                  }
                  return TextButton(
                    onPressed: () {
                      if (homeScreenController.subscription) {}
                    },
                    child: Container(
                      width: 310.w,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: AppColor.red,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: ButtonText2(
                        text: homeScreenController.subscription
                            ? "unsubscribe".tr
                            : "subscribe.tr",
                        fontSize: lang == "ur" ? 24.sp : 18.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: lang == "ur" ? "j_n_n_k" : "Poppins",
                      ),
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
