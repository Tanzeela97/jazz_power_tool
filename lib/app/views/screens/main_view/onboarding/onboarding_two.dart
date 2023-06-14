import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jazzpowertoolsapp/app/views/screens/main_view/onboarding/onboarding_three.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../data/constant/app_color.dart';
import '../../../../data/constant/app_string.dart';
import '../../../../data/constant/image_string.dart';
import '../../../../data/constant/route_string.dart';
import '../../../widgets/ktext1.dart';

class OnboardingScreenTwo extends StatefulWidget {
  const OnboardingScreenTwo({Key? key}) : super(key: key);

  @override
  State<OnboardingScreenTwo> createState() => _OnboardingScreenTwoState();
}

class _OnboardingScreenTwoState extends State<OnboardingScreenTwo> {
  DateTime currentBackPressTime = DateTime.now();
  late final TextEditingController _phoneController =
  TextEditingController(text: "92")
    ..addListener(() {
      if (!_phoneController.text.startsWith("92")) {
        _phoneController.value =
            _phoneController.value.copyWith(text: "92");
        _phoneController.selection =
            TextSelection.fromPosition(const TextPosition(offset: 2));
      }
    });
  String? phoneNum = '';
  final desiredLength = 12;

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
  void initState() {
    // _phoneController = TextEditingController(text: "92");
    _phoneController.addListener(_onTextChanged);
    Timer(
      Duration(seconds: 1), // Set the duration for how long the splash screen should be displayed (e.g., 2 seconds)
          () {
        // After the duration, navigate to the next screen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => OnboardingScreenThree()),
            );

      },
    );
    super.initState();
  }

  void _onTextChanged() {
    if (_phoneController.text.length > desiredLength) {
      _phoneController.text = _phoneController.text.substring(0, desiredLength);
      _phoneController.selection =
          TextSelection.fromPosition(TextPosition(offset: desiredLength));
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration:   BoxDecoration(
              image: DecorationImage(
                image: ImageString.splash,
                fit: BoxFit.fill,
              ),
            ),


        ),
      ),));

  }
}
