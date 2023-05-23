import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../controller/main_view/main_view_controller.dart';
import '../../../data/constant/app_color.dart';
import '../../../data/constant/app_string.dart';
import '../../../data/constant/image_string.dart';


class MainView extends StatefulWidget {
  const MainView();

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final controller = Get.put(MainViewController());
  DateTime currentBackPressTime = DateTime.now();

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > const Duration(seconds: 1)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: AppString.exit);
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: onWillPop,
        child: GetBuilder<MainViewController>(builder: (_) {
          return controller.page();
        }),
      ),
      bottomNavigationBar: GetBuilder<MainViewController>(
        builder: (_) {
          return Theme(
            data: Theme.of(context).copyWith(
                // sets the background color of the `BottomNavigationBar`
                canvasColor: AppColor.fontColorButton,
                textTheme: Theme.of(context).textTheme),
            child: BottomNavigationBar(
              // type: BottomNavigationBarType.fixed,
              // fixedColor: Colors.transparent,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items:  const [
                BottomNavigationBarItem(
                  icon: Image(
                    image: ImageString.menu,
                    height: 60,
                    width: 60,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Image(
                    image: ImageString.emotions,
                    height: 60,
                    width: 60,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Image(
                    image: ImageString.home,
                    height: 60,
                    width: 60,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Image(
                    image: ImageString.game,
                    height: 60,
                    width: 60,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Image(
                    image: ImageString.favourite,
                    height: 60,
                    width: 60,
                  ),
                  label: "",
                ),
              ],
              currentIndex: controller.index,
              onTap: (value) {
                controller.changePage(value);
              },
              // unselectedItemColor: AppColor.fontColor,
              // selectedItemColor: AppColor.green,
            )
          );
        },
      ),
    );
  }
}
