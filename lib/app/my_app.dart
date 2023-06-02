import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jazzpowertoolsapp/app/routes/route_generator.dart';
import 'package:jazzpowertoolsapp/app/views/translation/translation.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'controller/drawer/drawer.dart';
import 'controller/home_screen/home_screen_controller.dart';
import 'data/constant/route_string.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  String lang = "ur";
  final moreScreenController = Get.put(MoreScreenController());
  final homeScreenController = Get.put(HomeScreenController( const bool.fromEnvironment('dart.library.js_util')));
 // final loginController = Get.put(LoginController());

  @override
  void initState() {
    // scheduleMicrotask(() {
    //   precacheImage(ImageString.ajKiBaat, context);
    //   precacheImage(ImageString.appBarLogo, context);
    //   precacheImage(ImageString.ayat, context);
    //   precacheImage(ImageString.books, context);
    //   precacheImage(ImageString.calendar, context);
    //   precacheImage(ImageString.dua, context);
    //   precacheImage(ImageString.dua1, context);
    //   precacheImage(ImageString.dua2, context);
    //   precacheImage(ImageString.dua3, context);
    //   precacheImage(ImageString.duain, context);
    //   precacheImage(ImageString.favoriteIcon, context);
    //   precacheImage(ImageString.food, context);
    //   precacheImage(ImageString.hadith, context);
    //   precacheImage(ImageString.homeIcon, context);
    //   precacheImage(ImageString.forwordButton, context);
    //   precacheImage(ImageString.backwordButton, context);
    // });
    super.initState();
  }

  //language
  // final localeBloc = sl<LocaleBloc>();
  // @override
  // Widget build(BuildContext context) {
    // print('${Get.width} ${Get.height}');
    // return GetMaterialApp(
    //
    //     debugShowCheckedModeBanner: false,
    //     builder: (context, widget) => ResponsiveWrapper.builder(
    //       BouncingScrollWrapper.builder(context, widget!),
    //       maxWidth: 1200,
    //       minWidth: 450,
    //       defaultScale: true,
    //       breakpoints: const [
    //         ResponsiveBreakpoint.resize(450, name: MOBILE),
    //         ResponsiveBreakpoint.autoScale(800, name: TABLET),
    //         ResponsiveBreakpoint.autoScale(1000, name: TABLET),
    //         ResponsiveBreakpoint.resize(1200, name: DESKTOP),
    //         ResponsiveBreakpoint.autoScale(2460, name: "4K"),
    //       ],
    //     ),
    //
    //     translations: Localization(), // Translations class
    //     locale: const Locale('en', 'US'), // Default locale
    //     fallbackLocale: const Locale('en', 'US'),
    //     initialRoute: RouteString.home,
    //     onGenerateRoute: RouteGenerator.generateRoute,
    //     navigatorObservers: [RouteObservers.routeObserver],
    //   );

    @override
    Widget build(BuildContext context) {
      // print('${Get.width} ${Get.height}');
      return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          translations: Localization(),
          themeMode: ThemeMode.light,
          locale: const Locale("ur", "PK"),
          initialRoute: RouteString.onboardingThree,
          onGenerateRoute: RouteGenerator.generateRoute,
          navigatorObservers: [RouteObservers.routeObserver],
          theme: ThemeData(
            brightness: Brightness.light,
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                overlayColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
              ),
            ),
          ),
        ),
      );

    }
}
