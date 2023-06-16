import 'package:cache_manager/core/read_cache_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'app/data/constant/route_string.dart';
import 'app/my_app.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const bool kIsWeb = bool.fromEnvironment('dart.library.js_util');
  if (kIsWeb) {
    //   await Firebase.initializeApp(
    //     options: const FirebaseOptions(
    //         apiKey: "AIzaSyC-eqvBICJvs8rvB0oTWODYKWdpBfVr8YY",
    //         authDomain: "jazzpowertoolweb.firebaseapp.com",
    //         projectId: "jazzpowertoolweb",
    //         storageBucket: "jazzpowertoolweb.appspot.com",
    //         messagingSenderId: "230165034396",
    //         appId: "1:230165034396:web:8bd9d83bdba08cae1c4459",
    //         measurementId: "G-ETPHWEN2W3"
    //   )
    //   );
    // } else {
    //   await Firebase.initializeApp();
    // }
  }

  Paint.enableDithering = true;
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await FastCachedImageConfig.init(clearCacheAfter: const Duration(days: 1));
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  bool login = await ReadCache.getBool(key: "login") ?? false;
  final route;

  if (login) {
    route = RouteString.home;
  } else {
    route = RouteString.onboardingThree;
  }

  runApp(MyApp(login: login, route: route));
}
