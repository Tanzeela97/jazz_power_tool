import 'package:cache_manager/core/write_cache_service.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../controller/home_screen/home_screen_controller.dart';
import '../../controller/language/language.dart';
import '../../data/constant/app_color.dart';
import '../../data/constant/image_string.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key}) : super(key: key);
  MoreScreenController drawerController = Get.find();
  HomeScreenController  homeScreenController = Get.find();

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
                  AppColor.white,
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
                    child:  Image(
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
                    "Hello",
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
