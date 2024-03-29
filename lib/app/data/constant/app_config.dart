// import 'package:flutter/widgets.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
//
// class AppConfig {
//   static AppConfig? _instance;
//
//   MediaQueryData _mediaQueryData;
//   double? _screenWidth;
//   double? _screenHeight;
//   double? _blockSizeHorizontal;
//   double? _blockSizeVertical;
//   double? safeBlockHorizontal;
//   double?safeBlockVertical;
//
//
//   factory AppConfig.of(BuildContext context) {
//     _instance ??= AppConfig(context);
//     return _instance!;
//   }
//
//   AppConfig(BuildContext context) {
//     _mediaQueryData = MediaQuery.of(context);
//     _screenWidth = _mediaQueryData.size.width;
//     _screenHeight = _mediaQueryData.size.height;
//     if (kIsWeb) {
//       if (_screenWidth < 800) {
//         _blockSizeHorizontal = _screenWidth / 100;
//         _blockSizeVertical = _screenHeight / 100;
//       } else {
//         _blockSizeHorizontal = _screenWidth / 300;
//         _blockSizeVertical = _screenHeight / 300;
//       }
//     } else {
//       _blockSizeHorizontal = _screenWidth / 100;
//       _blockSizeVertical = _screenHeight / 100;
//     }
//   }
//
//   double appHeight(double v) {
//     return _blockSizeVertical * v;
//   }
//
//   double appWidth(double v) {
//     return _blockSizeHorizontal * v;
//   }
// }
