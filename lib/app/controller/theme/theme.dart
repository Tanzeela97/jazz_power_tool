import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import '../../data/constant/app_theme.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;

  void toggleTheme() {
    isDarkMode.toggle();
    updateTheme();
    update();
  }

  void updateTheme() {
    Get.changeTheme(
        isDarkMode.value ? AppTheme.darkTheme() : AppTheme.lightTheme());
  update();
  }
}
//darkMode() {
//     scaffoldBackgroundColor = const Color(0xff000000).obs;
//     scaffoldBackgroundColor1 = const Color(0xff000000).obs;
//     cardColor = const Color(0xff000000).obs;
//     fontColor = const Color(0xffffffff).obs;
//     Get.changeTheme(ThemeData.dark());
//     update();
//   }
//
//   lighhtMode() {
//     scaffoldBackgroundColor = const Color(0xffF6F6F5).obs;
//     scaffoldBackgroundColor1 = const Color(0xffd9e6b1).obs;
//     cardColor = const Color(0xffffffff).obs;
//     fontColor = const Color(0xff000000).obs;
//     Get.changeTheme(ThemeData.light());
//     update();
//   }
//}