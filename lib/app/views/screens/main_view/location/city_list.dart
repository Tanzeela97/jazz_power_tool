import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jazzpowertoolsapp/app/views/widgets/widget_loader.dart';

import '../../../../controller/home_screen/home_screen_controller.dart';
import '../../../../controller/profile/profile_controller.dart';
import '../../../../data/constant/app_color.dart';
import '../../../../data/constant/image_string.dart';
import '../../../widgets/kback_button.dart';
import '../../../widgets/kback_button_ur.dart';

class CityListScreen extends StatefulWidget {
  const CityListScreen();

  @override
  State<CityListScreen> createState() => _CityListScreenState();
}

class _CityListScreenState extends State<CityListScreen> {
  HomeScreenController homeScreenController = Get.find();
  final ProfileController profileController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    homeScreenController.firstLoad();
    homeScreenController.scrollController = ScrollController()
      ..addListener(homeScreenController.loadMore);
  }

  // @override
  // void dispose() {
  //   controller.surahScrollController.removeListener(controller.loadMore);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    String lang = Get.locale!.languageCode;
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<HomeScreenController>(
          builder: (_) => Container(
            color: isDarkMode ? AppColor.black : AppColor.white,
            child: homeScreenController.isFirstLoadRunning
                ? const Center(
              child: WidgetLoading(),
            )
                : Column(
              children: [
                Stack(
                  alignment: lang == "ur"
                      ? Alignment.topRight
                      : Alignment.topLeft,
                  children: [
                    Container(
                      height: 150.h,
                      width: 390.w,
                      alignment: Alignment.center,
                      child: Text(
                        'Cites',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          // color: AppColor.fontColorButton,
                        ),
                      ),
                      decoration: const BoxDecoration(
                        color: AppColor.red,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                    ),
                    lang == "ur"
                        ? const KBackBtnUrdu()
                        : const KBackBtn(),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Directionality(
                  textDirection: lang == "ur"
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  child: Expanded(
                    child: ListView.builder(
                      controller: homeScreenController.scrollController,
                      itemCount: homeScreenController.cities.length,
                      itemBuilder: (_, index) {
                        // print(index);
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10),
                          child: ListTile(
                            onTap: () async {
                              if (profileController.profileDetails ==
                                  "update") {
                                profileController.setCity(
                                    homeScreenController.cities[index]);
                                Navigator.pop(context);
                                return;
                              }
                              Navigator.pop(context);
                              homeScreenController.selectCity(
                                  homeScreenController.cities[index]);

                              // Navigator.pushNamed(
                              //     context, RouteString.quranScreen);
                              print(index + 1);
                              // dynamic result =
                              //     await RemoteServices.getAyats(
                              //         controller.surhas[index], 1);
                              // result.enAyat.forEach((element) {
                              //   print("a ${element.text}");
                              // });
                            },
                            leading: Container(
                              height: 30,
                              width: 30,
                              // decoration:  BoxDecoration(
                              //   image: DecorationImage(
                              //     image: ImageString.starIcon,
                              //     fit: BoxFit.fill,
                              //   ),
                              // ),
                              alignment: Alignment.center,
                              child: Text(
                                homeScreenController.cities[index].sort,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.inter(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  // color: AppColor.fontColorButton,
                                ),
                              ),
                            ),
                            title: Text(
                              homeScreenController.cities[index].name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.inter(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                // color: AppColor.fontColorButton,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                // when the _loadMore function is running
                if (homeScreenController.isLoadMoreRunning == true)
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Center(
                      child: WidgetLoading(),
                    ),
                  ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
