import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:jazzpowertoolsapp/app/views/screens/quiz/quiz_screen.dart';


import '../../views/screens/main_view/home/home_screen.dart';
import '../../views/screens/main_view/language/language_drop.dart';
import '../../views/screens/main_view/profile/profile_screen.dart';
import '../../views/screens/main_view/randomizer/randomizer.dart';
import '../../views/widgets/drawer.dart';

class MainViewController extends GetxController {
  int index = 0;
  MainViewController() {
    index = 2;

    update();
  }

  final GlobalKey<ScaffoldState> Key = GlobalKey();
  void changePage(number) {
    if (number == 0) {
      //index = 0;
      Key.currentState!.openDrawer();
    }
    // else if (number == 1) {
    //   index = 1;
    // }
    else if (number == 2) {
      index = 2;
    }
    // else if (number == 3) {
    //   index = 3;
    // }
    update();
  }

  page() {
    // if (index == 0) {
    //   return const HomeScreen();
    // } else if (index == 1) {
    //   return const Randomizer();
    // } else if (index == 2) {
    //   return const ProfileScreen();
    // }
    // else if (index == 3) {
    //   return QuizPage();
    // }
    if (index == 0) {
      return const MoreScreen();
    }
    // else if (index == 1) {
    //   return const Randomizer();
    // }
    else if (index == 2) {
      return const HomeScreen();
    }
    // else if (index == 3) {
    //   return QuizPage();
    // }

    update();
  }
}
