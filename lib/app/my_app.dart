import 'package:cache_manager/core/read_cache_service.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jazzpowertoolsapp/app/routes/route_generator.dart';
import 'package:jazzpowertoolsapp/app/views/translation/translation.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


import 'controller/home_screen/home_screen_controller.dart';
import 'controller/language/language.dart';
import 'controller/theme/theme.dart';
import 'data/constant/app_theme.dart';
import 'data/constant/route_string.dart';

class MyApp extends StatefulWidget {
  final bool login;
  final String route;

  const MyApp({Key? key, required this.login, required this.route}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {

  String lang = "ur";
  final moreScreenController = Get.put(MoreScreenController());
  final homeScreenController = Get.put(HomeScreenController( const bool.fromEnvironment('dart.library.js_util')));
 // final loginController = Get.put(LoginController());
  final ThemeController themeController = Get.put(ThemeController());

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
    setConfiguration();
    super.initState();
  }
  setConfiguration() async {
    lang = await ReadCache.getString(key: "lang") ?? "ur";

    homeScreenController.login = widget.login;
    if (widget.login) {
      homeScreenController.checkGender();
    }
    // print(lang);
    var locale = const Locale("ur", "PK");
    if (lang == "ur") {
      locale = const Locale("ur", "PK");
      moreScreenController.setLanguage("اردو");
    } else {
      locale = const Locale("en", "US");
      moreScreenController.setLanguage("English");
    }

    Get.updateLocale(locale);
    // print("$login $route");
    // setState(() {});
   // FlutterNativeSplash.remove();
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
         // locale: Get.deviceLocale, // or specify a specific locale

          //fallbackLocale: const Locale('en', 'US'),
          theme: AppTheme.lightTheme(),
          darkTheme: AppTheme.darkTheme(),
        //  themeMode: themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
         themeMode: ThemeMode.light,

         /// initialRoute: widget.route,

          localizationsDelegates: const [
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          locale: Locale(lang, "PK"),
          supportedLocales: const [Locale("ur", "PK"), Locale("en", "US")],

         initialRoute: RouteString.onboardingTwo,
          initialBinding: BindingsBuilder(() {
            Get.put(ThemeController()); // Register the ThemeController
          }),
          onGenerateRoute: RouteGenerator.generateRoute,
          navigatorObservers: [RouteObservers.routeObserver],
          // theme: ThemeData(
          //   brightness: Brightness.light,
          //   textButtonTheme: TextButtonThemeData(
          //     style: ButtonStyle(
          //       overlayColor:
          //       MaterialStateProperty.all<Color>(Colors.transparent),
          //     ),
          //   ),
          // ),
        ),
      );

    }
}
