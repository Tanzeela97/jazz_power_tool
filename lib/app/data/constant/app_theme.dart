import 'package:flutter/material.dart';
import 'package:jazzpowertoolsapp/app/data/constant/app_color.dart';

// class AppTheme {
//   //
//   AppTheme._();
//
//   static final ThemeData lightTheme = ThemeData(
//    // scaffoldBackgroundColor: Colors.white,
//     backgroundColor: Colors.white,
//     // colorScheme: const ColorScheme.light(
//     //   primary: Colors.white,
//     //   onPrimary: Colors.white,
//     //   primaryVariant: Colors.white38,
//     //   secondary: Colors.red,
//     // ),
//     cardTheme: const CardTheme(
//       color: Colors.white,
//     ),
//     // iconTheme: const IconThemeData(
//     //   color: Colors.white54,
//     // ),
//     textTheme: const TextTheme(
//       subtitle1: TextStyle(
//         color: Colors.white,
//         fontSize: 20.0,
//       ),
//     ),
//   );
//
//   static final ThemeData darkTheme = ThemeData(
//    // scaffoldBackgroundColor: Colors.black,
//     backgroundColor: Colors.black,
//     // colorScheme: const ColorScheme.light(
//     //   primary: Colors.black,
//     //   onPrimary: Colors.black,
//     //   primaryVariant: Colors.black,
//     //   secondary: Colors.red,
//     // ),
//     cardTheme: const CardTheme(
//       color: Colors.black,
//     ),
//     // iconTheme: const IconThemeData(
//     //   color: Colors.white54,
//     // ),
//     textTheme: const TextTheme(
//       subtitle1: TextStyle(
//         color: Colors.white,
//         fontSize: 20.0,
//       ),
//     ),
//   );
// }
class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(

      brightness: Brightness.light,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white, // Set the background color of the BottomNavigationBar
      ),
        cardTheme: const CardTheme(
      color: Colors.white,
    ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(

      brightness: Brightness.dark,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black, // Set the background color of the BottomNavigationBar
        ),
      cardTheme: const CardTheme(
        color: Colors.black,
      ),
    textTheme: const TextTheme(
      subtitle1: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),


    ));
  }
}
