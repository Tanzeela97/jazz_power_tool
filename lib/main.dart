import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const bool kIsWeb = bool.fromEnvironment('dart.library.js_util');
  // if (kIsWeb) {
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


  Paint.enableDithering = true;
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);


  runApp(const MyApp());
}
