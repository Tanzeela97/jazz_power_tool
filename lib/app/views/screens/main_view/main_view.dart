import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../controller/drawer/drawer.dart';
import '../../../controller/home_screen/home_screen_controller.dart';
import '../../../controller/main_view/main_view_controller.dart';
import '../../../data/constant/app_color.dart';
import '../../../data/constant/app_string.dart';
import '../../../data/constant/image_string.dart';


import 'package:cache_manager/cache_manager.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/constant/route_string.dart';
import '../../widgets/drawer.dart';


import 'package:cache_manager/cache_manager.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';


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
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.Key,
      drawer: CustomDrawer(),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: GetBuilder<MainViewController>(builder: (_) {
          return controller.page();
        }),
      ),
      bottomNavigationBar: GetBuilder<MainViewController>(
        builder: (_) {
          return BottomNavigationBar(
            // type: BottomNavigationBarType.fixed,
            // fixedColor: Colors.transparent,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                icon: ImageIcon(
                  ImageString.menu,
                  size: 60,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  ImageString.emotions,
                  size: 60,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  ImageString.home,
                  size: 60,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  ImageString.game,
                  size: 60,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  ImageString.favourite,
                  size: 60,
                ),
                label: "",
              ),
            ],
            currentIndex: controller.index,
            onTap: (value) {
              controller.changePage(value);
            },
            unselectedItemColor: AppColor.red,
            selectedItemColor: AppColor.colorDemo,
          );
        },
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  CustomDrawer();
  MoreScreenController drawerController = Get.find();
  HomeScreenController homeScreenController = Get.find();

  String lang = Get.locale!.languageCode;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration:  const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  AppColor.red,
                  AppColor.red,
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    // await languageSelectDialogue(context);
                  },
                  child: Container(
                    constraints: const BoxConstraints(
                      maxHeight: 60,
                      maxWidth: 60,
                    ),
                    width: 60.w,
                    height: 60.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    // backgroundColor: Colors.yellow,
                    child:  const Image(
                      image: ImageString.jazzLogo,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  constraints: const BoxConstraints(
                    maxWidth: 300,
                  ),
                  width: 120.w,
                  child: Text(
                    "Tezz",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: /*lang == "ur" ? 'j_n_n_k' : */ "Poppins",
                      fontSize: /*lang == "ur" ? 40.sp : */
                      20.sp,
                      color: AppColor.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text('login'),
            onTap: () {
              Navigator.popAndPushNamed(
                  context, RouteString.login);
            },
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                lang == "ur" ? 0 : 15.w, 5, lang == "ur" ? 15 : 0, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 80.w,
                  child: Text(
                    "language".tr,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: lang == "ur" ? 20.sp : 12.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColor.red,
                        fontFamily: lang == "ur" ? "j_n_n_k" : "Poppins"),
                  ),
                ),
                SizedBox(
                  width: 180.w,
                  child: GetBuilder<MoreScreenController>(
                    builder: (_) => DropdownButton2(
                      isExpanded: true,
                      items:
                      drawerController.listOfLanguage.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              items,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: lang == "ur" ? 20.sp : 18.sp,
                                  fontWeight: FontWeight.normal,
                                  color: AppColor.red,
                                  fontFamily:
                                  lang == "ur" ? "j_n_n" : "Poppins"),
                            ),
                          ),
                        );
                      }).toList(),
                      value: drawerController.language,
                      onChanged: (String? newValue) async {
                        drawerController.setLanguage(newValue!);
                        var locale = const Locale("ur", "PK");
                        if (newValue == "English") {
                          if (homeScreenController.login) {
                            await WriteCache.setString(
                                key: "lang", value: "en");
                            locale = const Locale("en", "US");
                          } else {
                            await WriteCache.setString(
                                key: "lang", value: "ur");
                            locale = const Locale("ur", "PK");
                          }
                        } else {
                          if (homeScreenController.login) {
                            await WriteCache.setString(
                                key: "lang", value: "en");
                            // locale = const Locale("en", "US");
                          } else {
                            await WriteCache.setString(
                                key: "lang", value: "ur");
                            // locale = const Locale("ur", "PK");
                          }
                        }
                        Navigator.pop(context);
                        Get.updateLocale(locale);
                      },
                      buttonStyleData: ButtonStyleData(
                        // height: 50,
                        width: 160.w,
                        // padding: const EdgeInsets.only(left: 14, right: 14),

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: Colors.black26,
                          ),
                          color: AppColor.white,
                        ),
                        elevation: 2,
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                        ),
                        iconEnabledColor: AppColor.red,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        // maxHeight: 200,
                        width: 160.w,
                        padding: null,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: AppColor.white,
                        ),
                        elevation: 8,
                        offset: const Offset(0, 0),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(40),
                          thickness: MaterialStateProperty.all<double>(6),
                          thumbVisibility:
                          MaterialStateProperty.all<bool>(true),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                        // padding: EdgeInsets.only(left: 14, right: 14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // onTap: () {
          //   languageSelectDialogue(
          //       context, drawerController, homeScreenController.login);
          // },

          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}
