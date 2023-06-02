import 'package:cache_manager/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


import '../../../../controller/home_screen/home_screen_controller.dart';
import '../../../../controller/login_controller/login.dart';
import '../../../../data/constant/app_color.dart';
import '../../../../data/constant/image_string.dart';
import '../../../../data/constant/route_string.dart';
import '../../../widgets/button_text2.dart';
import '../../../widgets/dialogue_widget.dart';
import '../../../widgets/kback_button.dart';
import '../../../widgets/kback_button_ur.dart';
import '../../../widgets/widget_loader.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({Key? key}) : super(key: key);

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  LoginController loginController = Get.find();
  HomeScreenController homeScreenController = Get.find();
  String? _pinCode = "";
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // loginController.startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String lang = Get.locale!.languageCode;
    print(390.w);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: lang == "ur"
            ? KBackButtonUrdu(
          function: () {
            confirmDialoge(
                context: context,
                title: "edit".tr,
                msg: "edit_num".tr,
                funButtonTitle: "edit".tr,
                cancelButtonTitle: "cancel".tr,
                function: () {
                  loginController.stopTimer();
                  Navigator.popAndPushNamed(context, RouteString.login);
                },
                cancelFunction: () {
                  Navigator.pop(context);
                },
                fontFamily: "j_n_n_k");
          },
        )
            : KBackButton(
          function: () {
            confirmDialoge(
                context: context,
                title: "edit".tr,
                msg: "edit_num".tr,
                funButtonTitle: "edit".tr,
                cancelButtonTitle: "cancel".tr,
                function: () {
                  loginController.stopTimer();
                  Navigator.pushReplacementNamed(
                      context, RouteString.login);
                },
                cancelFunction: () {
                  Navigator.pop(context);
                },
                fontFamily: "a_m");
          },
        ),
      ),
      backgroundColor: AppColor.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: SizedBox(
              // width: 370.w,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 130.h,
                  ),
                  Text(
                    "TEZ",
                    style: TextStyle(
                      // fontSize: lang == "ur" ? 40.sp : 30.sp,
                      fontSize: 65.sp,
                      color: AppColor.red,
                      fontFamily: lang == "ur" ? "j_n_n_k" : "a_m",
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    "او ٹی پی کی تصدیق",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: lang == "ur" ? 35.sp : 25.sp,
                      color: Colors.black,
                      fontFamily: lang == "ur" ? "j_n_n_k" : "a_m",
                    ),
                  ),

                  // Text(
                  //   "verify_otp".tr,
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(
                  //     fontSize: lang == "ur" ? 35.sp : 25.sp,
                  //     color: Colors.black,
                  //     fontFamily: lang == "ur" ? "j_n_n_k" : "a_m",
                  //   ),
                  // ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    lang == "ur"
                        ? "${loginController.number}: ${"اس نمبر پر بھیجا گیااو  ٹی  پی درج کریں"}"
                        : "${"اس نمبر پر بھیجا گیااو  ٹی  پی درج کریں".tr} ${loginController.number}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: lang == "ur" ? 25.sp : 16.sp,
                      color: Colors.black,
                      fontFamily: lang == "ur" ? "j_n_n_k" : "a_m",
                    ),
                  ),
                  // Text(
                  //   lang == "ur"
                  //       ? "${loginController.number}: ${"verify_otp1".tr}"
                  //       : "${"verify_otp1".tr} ${loginController.number}",
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(
                  //     fontSize: lang == "ur" ? 25.sp : 16.sp,
                  //     color: Colors.black,
                  //     fontFamily: lang == "ur" ? "j_n_n_k" : "a_m",
                  //   ),
                  // ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: PinCodeTextField(
                      appContext: context,
                      scrollPadding: EdgeInsets.all(10),

                      // pastedTextStyle: const TextStyle(
                      //   color: AppColor.black,
                      //   fontWeight: FontWeight.bold,
                      // ),
                      enablePinAutofill: true,
                      length: 6,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50.w < 51 ? 50.w : 50,
                        fieldWidth: 50.w < 51 ? 50.w : 50,
                        activeFillColor: AppColor.white,
                        selectedColor: AppColor.grey,
                        selectedFillColor: AppColor.white,
                        inactiveFillColor: AppColor.white,
                        inactiveColor: AppColor.grey,
                        activeColor: AppColor.red,
                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      keyboardType: TextInputType.number,
                      onCompleted: (pin) {
                        print(pin);
                        loginController.setOtpPin(true);
                        _pinCode = pin;
                      },
                      onChanged: (value) {
                        // if (value.length.clamp(0, AuthConstant.OTP_DIGITS) ==
                        //     AuthConstant.OTP_DIGITS) {
                        //   valueNotifier.value = true;
                        // } else {
                        //   valueNotifier.value = false;
                        // }
                        if (value.length < 5) {
                          loginController.setOtpPin(false);
                        }
                      },
                      beforeTextPaste: (text) {
                        return true;
                      },
                    ),
                  ),
                  SizedBox(height: 15.h),
                  GetBuilder<LoginController>(
                    builder: (_) {
                      if (loginController.isLoading) {
                        return const WidgetLoading();
                      }
                      return ElevatedButton(
                        onPressed: () async {
                          bool kIsWeb = const bool.fromEnvironment(
                              'dart.library.js_util');

                          if (loginController.otpPin && _pinCode!.length < 7) {
                            if (kIsWeb) {
                              loginController.snackBar("pin_verified".tr);
                              // ignore: use_build_context_synchronously
                              confirmDialoge(
                                  context: context,
                                  title: "subscription".tr,
                                  msg: "sub_msg".tr,
                                  funButtonTitle: "subscribe".tr,
                                  cancelButtonTitle: "cancel".tr,
                                  cancelFunction: () {
                                    loginController.setOtpPin(false);
                                    loginController.stopTimer();
                                    Navigator.popAndPushNamed(
                                        context, RouteString.home);
                                  },
                                  function: () async {
                                    Navigator.pop(context);
                                    loginController.loading(
                                        context: context,
                                        color: AppColor.red,
                                        fontFamily:
                                        lang == "ur" ? "j_n_n_k" : "a_m");
                                    // await loginController.checkStatus();
                                    // dynamic result =
                                    //     await loginController.subscription();
                                    // print(result['sub']);
                                    // if (result['sub'] == 'true') {
                                    loginController.snackBar("success".tr);
                                    await WriteCache.setBool(
                                        key: "login", value: true);
                                    await WriteCache.setString(
                                        key: "number",
                                        value: loginController.number!);
                                    homeScreenController.number =
                                    loginController.number!;
                                    homeScreenController.login = true;
                                    // final SharedPreferences prefs =
                                    //     await SharedPreferences.getInstance();
                                    await WriteCache.setBool(
                                        key: "subscription", value: true);
                                    // await WriteCache.setString(
                                    //     key: "number",
                                    //     value: loginController.number!);
                                    homeScreenController.subscription = true;
                                    // homeScreenController.number =
                                    //     loginController.number!;
                                    loginController.setOtpPin(false);
                                    loginController.stopTimer();
                                    // ignore: use_build_context_synchronously
                                    Navigator.popAndPushNamed(
                                        context, RouteString.home);
                                    // } else if (result["message"] ==
                                    //         "Access denied." ||
                                    //     result["sub"] == "false") {
                                    //   loginController.snackBar("error".tr);

                                    //   // ignore: use_build_context_synchronously
                                    //   Navigator.popAndPushNamed(
                                    //       context, RouteString.home);
                                    // }
                                  },
                                  fontFamily: lang == "ur" ? "j_n_n_k" : "a_m");
                            } else {
                              dynamic result = await loginController.verifyOtp(
                                  code: _pinCode!);

                              if (result == "Invalid PIN") {
                                loginController.snackBar("pin_invalid".tr);
                              } else {
                                loginController.authStatusModel = result;
                                loginController.snackBar("pin_verified".tr);
                                await WriteCache.setString(
                                    key: "number",
                                    value: loginController.number!);
                                // ignore: use_build_context_synchronously
                                confirmDialoge(
                                    context: context,
                                    title: "subscription".tr,
                                    msg: "sub_msg".tr,
                                    funButtonTitle: "subscribe".tr,
                                    cancelButtonTitle: "cancel".tr,
                                    cancelFunction: () {
                                      loginController.setOtpPin(false);
                                      loginController.stopTimer();
                                      Navigator.popAndPushNamed(
                                          context, RouteString.home);
                                    },
                                    function: () async {
                                      Navigator.pop(context);
                                      loginController.loading(
                                          context: context,
                                          color: AppColor.red,
                                          fontFamily:
                                          lang == "ur" ? "j_n_n_k" : "a_m");
                                      await loginController.checkStatus();
                                      dynamic result =
                                      await loginController.subscription();
                                      // print(result['sub']);
                                      if (result['sub'] == 'true') {
                                        loginController.snackBar("success".tr);
                                        await WriteCache.setBool(
                                            key: "login", value: true);
                                        await WriteCache.setString(
                                            key: "number",
                                            value: loginController.number!);
                                        homeScreenController.number =
                                        loginController.number!;
                                        homeScreenController.login = true;
                                        // final SharedPreferences prefs =
                                        //     await SharedPreferences.getInstance();

                                        await WriteCache.setBool(
                                            key: "subscription", value: true);
                                        // await WriteCache.setString(
                                        //     key: "number",
                                        //     value: loginController.number!);
                                        homeScreenController.subscription =
                                        true;
                                        // homeScreenController.number =
                                        //     loginController.number!;
                                        loginController.setOtpPin(false);
                                        loginController.stopTimer();
                                        // ignore: use_build_context_synchronously
                                        Navigator.popAndPushNamed(
                                            context, RouteString.home);
                                      } else if (result["message"] ==
                                          "Access denied." ||
                                          result["sub"] == "false") {
                                        loginController.snackBar("error".tr);
                                        loginController.setOtpPin(false);
                                        loginController.stopTimer();
                                        // ignore: use_build_context_synchronously
                                        Navigator.popAndPushNamed(
                                            context, RouteString.home);
                                      }
                                    },
                                    fontFamily:
                                    lang == "ur" ? "j_n_n_k" : "a_m");
                              }
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          elevation: 5,
                          backgroundColor: loginController.otpPin
                              ? AppColor.red
                              : AppColor.inactiveButtonColor,
                        ),
                        child: Container(
                          width: Get.width - 70,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: loginController.otpPin
                                  ? AppColor.red
                                  : AppColor.inactiveButtonColor),
                          // child: ButtonText2(
                          //   text: "submit".tr,
                          //   fontSize: lang == "ur" ? 24.sp : 18.sp,
                          //   color: AppColor.red,
                          //   fontWeight: FontWeight.w400,
                          // ),
                          child: ButtonText2(
                            text: "تصدیق",
                            fontSize: lang == "ur" ? 24.sp : 18.sp,
                            color: AppColor.red,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 10.h),
                  GetBuilder<LoginController>(
                    builder: (_) {
                      if (loginController.isLoadingResend) {
                        return const WidgetLoading();
                      }

                      if (loginController.timeUp == false) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Text(
                            //   "${"resend_otp".tr}: ",
                            //   textAlign: TextAlign.center,
                            //   style: TextStyle(
                            //     fontSize: 16.sp,
                            //     color: AppColor.red,
                            //     fontFamily: lang == "ur" ? "j_n_n_k" : "a_m",
                            //   ),
                            // ),
                            Text(
                              "${"دوبارہ بھیجیں"}: ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: AppColor.red,
                                fontFamily: lang == "ur" ? "j_n_n_k" : "a_m",
                              ),
                            ),
                            Text(
                              "${loginController.timeLeft}",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: lang == "ur" ? 22.sp : 16.sp,
                                color: AppColor.red,
                                fontFamily: lang == "ur" ? "j_n_n_k" : "a_m",
                              ),
                            ),
                          ],
                        );
                      } else {
                        return ElevatedButton(
                          onPressed: () async {
                            dynamic result =
                            await loginController.otpLogin(true);
                            if (result != null) {
                              loginController.snackBar(
                                  "${"otp_sent".tr} ${loginController.number!}");
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            elevation: 5,
                            backgroundColor: AppColor.red,
                          ),
                          child: Container(
                            width: Get.width - 70,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: AppColor.red),
                            child: ButtonText2(
                              text: "resend".tr,
                              fontSize: lang == "ur" ? 24.sp : 18.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
