import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

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
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration:   BoxDecoration(
                  image: DecorationImage(
                    image: ImageString.backgroundSplash3,
                    fit: BoxFit.fill,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 60.h,
                      ),
                      Text(
                        "about_you".tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 35.sp,
                          color: AppColor.black,
                          fontFamily: "j_n_n_k",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 100.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10),
                        child: Form(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 90.w,
                                    height: 50.h,
                                    child: KText1(
                                      text: "phone_num".tr,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "j_n_n_k",
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  SizedBox(
                                    width: 275.w,
                                    height: 50.h,
                                    child: Material(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      elevation: 10,
                                      child: TextFormField(
                                        textAlign: TextAlign.left,
                                        // flagsButtonMargin:
                                        //     const EdgeInsets.symmetric(
                                        //         horizontal: 10),
                                        // showCountryFlag: false,

                                        controller: _phoneController,
                                        // initialValue: "92",
                                        // invalidNumberMessage: "invalid_num".tr,
                                        // showDropdownIcon: false,
                                        autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: AppColor.white,
                                          // hintText: 'phone_number'.tr,
                                          // enabledBorder: InputBorder.none,
                                          // focusedBorder: UnderlineInputBorder(
                                          //   borderSide: BorderSide(color: Colors.black54),
                                          // ),
                                          contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 18, vertical: 18),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(15.0),
                                            borderSide: BorderSide.none,
                                          ),
                                          // hintText: '3XXXXXXXXX'.tr,
                                          hintStyle: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 15.sp),
                                          prefixIcon: Container(
                                            width: 20,
                                            height: 20,
                                            padding: EdgeInsets.all(10),
                                            child: const Image(
                                                image: ImageString.paksistan),
                                          ),
                                          // border: InputBorder.none,
                                        ),
                                        // countries: [
                                        //   'PK',
                                        // ],
                                        // initialCountryCode: 'PK',
                                        // maxLength: 10,
                                        onChanged: (phone) {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 90.w,
                                    height: 50.h,
                                    child: KText1(
                                      text: "name".tr,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "j_n_n_k",
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  SizedBox(
                                    width: 275.w,
                                    height: 50.h,
                                    child: Material(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      elevation: 10,
                                      child: TextFormField(
                                        textAlign: TextAlign.right,
                                        autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: AppColor.white,
                                          // hintText: 'phone_number'.tr,
                                          // enabledBorder: InputBorder.none,
                                          // focusedBorder: UnderlineInputBorder(
                                          //   borderSide: BorderSide(color: Colors.black54),
                                          // ),
                                          contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 18, vertical: 18),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(15.0),
                                            borderSide: BorderSide.none,
                                          ),
                                          // hintText: '3XXXXXXXXX'.tr,
                                          hintStyle: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 15.sp),

                                          // border: InputBorder.none,
                                        ),
                                        onChanged: (phone) {
                                          // _phoneController.text = phone.completeNumber;
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 90.w,
                                    height: 50.h,
                                    child: KText1(
                                      text: "dob".tr,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "j_n_n_k",
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  SizedBox(
                                    width: 77.w,
                                    height: 50.h,
                                    child: Material(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      elevation: 10,
                                      child: TextFormField(
                                        textAlign: TextAlign.right,
                                        autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: AppColor.white,
                                          // hintText: 'phone_number'.tr,
                                          // enabledBorder: InputBorder.none,
                                          // focusedBorder: UnderlineInputBorder(
                                          //   borderSide: BorderSide(color: Colors.black54),
                                          // ),
                                          contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 18, vertical: 18),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(15.0),
                                            borderSide: BorderSide.none,
                                          ),
                                          // hintText: '3XXXXXXXXX'.tr,
                                          hintStyle: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 15.sp),

                                          // border: InputBorder.none,
                                        ),
                                        onChanged: (phone) {
                                          // _phoneController.text = phone.completeNumber;
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  SizedBox(
                                    width: 77.w,
                                    height: 50.h,
                                    child: Material(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      elevation: 10,
                                      child: TextFormField(
                                        textAlign: TextAlign.right,
                                        autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: AppColor.white,
                                          // hintText: 'phone_number'.tr,
                                          // enabledBorder: InputBorder.none,
                                          // focusedBorder: UnderlineInputBorder(
                                          //   borderSide: BorderSide(color: Colors.black54),
                                          // ),
                                          contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 18, vertical: 18),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(15.0),
                                            borderSide: BorderSide.none,
                                          ),
                                          // hintText: '3XXXXXXXXX'.tr,
                                          hintStyle: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 15.sp),

                                          // border: InputBorder.none,
                                        ),
                                        onChanged: (phone) {
                                          // _phoneController.text = phone.completeNumber;
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  SizedBox(
                                    width: 96.w,
                                    height: 50.h,
                                    child: Material(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      elevation: 10,
                                      child: TextFormField(
                                        textAlign: TextAlign.right,
                                        autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: AppColor.white,
                                          // hintText: 'phone_number'.tr,
                                          // enabledBorder: InputBorder.none,
                                          // focusedBorder: UnderlineInputBorder(
                                          //   borderSide: BorderSide(color: Colors.black54),
                                          // ),
                                          contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 18, vertical: 18),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(15.0),
                                            borderSide: BorderSide.none,
                                          ),
                                          // hintText: '3XXXXXXXXX'.tr,
                                          hintStyle: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 15.sp),

                                          // border: InputBorder.none,
                                        ),
                                        onChanged: (phone) {
                                          // _phoneController.text = phone.completeNumber;
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 90.w,
                                    height: 50.h,
                                    child: KText1(
                                      text: "gender".tr,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "j_n_n_k",
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  SizedBox(
                                    width: 275.w,
                                    height: 50.h,
                                    child: Material(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      elevation: 10,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 265.w / 2,
                                            child: RadioListTile(
                                              value: false,
                                              groupValue: true,
                                              onChanged: (val) {},
                                              activeColor: AppColor.black,
                                              title: KText1(
                                                text: "male".tr,
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "j_n_n_k",
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 265.w / 2,
                                            child: RadioListTile(
                                              value: true,
                                              groupValue: true,
                                              onChanged: (val) {},
                                              activeColor: AppColor.white,
                                              title: KText1(
                                                text: "female".tr,
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "j_n_n_k",
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 90.w,
                                    height: 50.h,
                                    child: KText1(
                                      text: "city".tr,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "j_n_n_k",
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  SizedBox(
                                    width: 275.w,
                                    height: 50.h,
                                    child: Material(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      elevation: 10,
                                      child: ListTile(
                                        title: KText1(
                                          text: "کراچی",
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "j_n_n_k",
                                        ),
                                        trailing: const Icon(Icons.pin_drop),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RouteString.onboardingThree);
                            },
                            child: Image(
                              image: ImageString.leftArrow,
                              height: 50.h,
                              width: 50.w,
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 50.h,
                      // ),

                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 10.w),
                child: SmoothPageIndicator(
                  controller: PageController(initialPage: 1),
                  count: 3,
                  effect: WormEffect(
                    activeDotColor: AppColor.red,
                    spacing: 14.w,
                    dotWidth: 16.sp,
                    dotHeight: 16.sp,
                    dotColor: AppColor.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
