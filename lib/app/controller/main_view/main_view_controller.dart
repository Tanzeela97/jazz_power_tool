import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:jazzpowertoolsapp/app/views/screens/quiz/quiz_screen.dart';
import 'package:jazzpowertoolsapp/app/views/widgets/widget_loader.dart';


import '../../views/screens/main_view/home/home_screen.dart';
import '../../views/screens/main_view/language/language_drop.dart';
import '../../views/screens/main_view/profile/profile_screen.dart';
import '../../views/screens/main_view/randomizer/randomizer.dart';
import '../../views/widgets/drawer.dart';



class MainViewController extends GetxController {
  int index = 2;

  MainViewController() {
    index = 2;

    update();
  }

  void changePage(number) {
    if (number == 0) {

    } else if (number == 1) {
      index = 1;
    } else if (number == 2) {
      index = 2;
    } else if (number == 3) {
      index = 3;
    } else if (number == 4) {
      index = 4;
    }
    update();
  }

  page() {
    if (index == 0) {
      return const MoreScreen();
    } else if (index == 1) {
      return const WidgetLoading();
    } else if (index == 2) {
      return const HomeScreen();
    } else if (index == 3) {
      return const WidgetLoading();
    } else if (index == 4) {
      return const WidgetLoading();
    }
    update();
  }
}
