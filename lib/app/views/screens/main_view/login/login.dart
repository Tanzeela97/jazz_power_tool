import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jazzpowertoolsapp/app/views/widgets/widget_loader.dart';


import '../../../../controller/login_controller/login.dart';
import '../../../../data/constant/app_color.dart';
import '../../../../data/constant/image_string.dart';
import '../../../../data/constant/route_string.dart';

class Login extends StatefulWidget {
  const Login();

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final controller = Get.put(LoginController());
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
  final _formKey = GlobalKey<FormState>();
  final desiredLength = 12;

  void _onTextChanged() {
    if (_phoneController.text.length > desiredLength) {
      _phoneController.text = _phoneController.text.substring(0, desiredLength);
      _phoneController.selection =
          TextSelection.fromPosition(TextPosition(offset: desiredLength));
    }
  }

  @override
  void initState() {
    _phoneController.addListener(_onTextChanged);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String lang = Get.locale!.languageCode;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // foregroundColor: Colors.transparent,
        elevation: 0,
        // leading: lang == "ur"
        //     ? KBackButtonUrdu(
        //   function: () {
        //     Navigator.popAndPushNamed(context, RouteString.home);
        //   },
        // )
        //     : KBackButton(
        //   function: () {
        //     Navigator.popAndPushNamed(context, RouteString.home);
        //   },
        // ),
      ),
      backgroundColor: AppColor.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                    height: 10.h,
                  ),
                  Text(
                    "لاگ ان",
                    style: TextStyle(
                    fontSize: lang == "ur" ? 40.sp : 30.sp,
                      color: AppColor.yellow,
                      fontFamily: lang == "ur" ? "j_n_n_k" : "a_m",
                    ),
                  ),
                  Text(
                    "موبائل نمبر درج کریں",
                    style: TextStyle(
                      fontSize: lang == "ur" ? 40.sp : 30.sp,
                      color: AppColor.red,
                      fontFamily: lang == "ur" ? "j_n_n_k" : "a_m",
                    ),
                  ),

                  // Text(
                  //   "signin".tr,
                  //   style: TextStyle(
                  //     fontSize: lang == "ur" ? 40.sp : 30.sp,
                  //     color: AppColor.red,
                  //     fontFamily: lang == "ur" ? "j_n_n_k" : "a_m",
                  //   ),
                  // ),

                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "",
                    style: TextStyle(
                      fontSize: lang == "ur" ? 30.sp : 20.sp,
                      color: AppColor.red,
                      fontFamily: lang == "ur" ? "j_n_n_k" : "a_m",
                    ),
                  ),
                  // Text(
                  //   "mobile_num".tr,
                  //   style: TextStyle(
                  //     fontSize: lang == "ur" ? 30.sp : 20.sp,
                  //     color: AppColor.red,
                  //     fontFamily: lang == "ur" ? "j_n_n_k" : "a_m",
                  //   ),
                  // ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.phone,

                      controller: _phoneController,

                      autovalidateMode: AutovalidateMode.onUserInteraction,

                      decoration: InputDecoration(

                        // hintText: 'phone_number'.tr,
                        // enabledBorder: InputBorder.none,
                        focusedBorder: UnderlineInputBorder(
                       borderSide: BorderSide(color: Colors.red),
                        ),
                        // errorText: "invalid_num".tr,
                        prefixIcon: lang == "ur"
                            ? null
                            : Container(
                          width: 20,
                          height: 20,
                          padding: EdgeInsets.all(10),
                          child: Image(image: ImageString.paksistan),
                        ),
                        suffixIcon: lang == "ur"
                            ? Container(
                          width: 20,
                          height: 20,
                          padding: EdgeInsets.all(10),
                          child: Image(image: ImageString.paksistan),
                        )
                            : null,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 18),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        // hintText: '3XXXXXXXXX'.tr,
                        hintStyle:
                        TextStyle(color: Colors.black54, fontSize: 15.sp),

                        // border: InputBorder.none,
                      ),
                      // countries: [
                      //   'PK',
                      // ],
                      // initialCountryCode: 'PK',
                      onChanged: (phone) {
                        setState(() {});
                        // _phoneController.text = phone.completeNumber;
                      },
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GetBuilder<LoginController>(
                        builder: (_) => Checkbox(
                          value: controller.term,
                          onChanged: (val) {
                            controller.setTerm(val!);
                          },
                          activeColor: AppColor.red,
                        ),
                      ),
                      // const SizedBox(width: 5),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => AboutUs(
                            //       enumAboutUs: EnumAboutUs.term,
                            //     ),
                            //   ),
                            // );
                          },
                          child: RichText(
                            text: TextSpan(
                              text: lang == "ur" ? "".tr : "${"agree".tr} ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                // color: AppColor.black,
                                letterSpacing: 2,
                                fontWeight: FontWeight.w300,
                                fontFamily:
                                lang == "ur" ? "j_n_n_k" : "a_m",
                                fontSize: lang == "ur" ? 25.sp : 16.sp,
                              ),
                              children: [
                                TextSpan(
                                  text: 'میں شرائط وضوابط سے اتفاق کرتا ہوں ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                    color: AppColor.red,
                                    letterSpacing: 1,
                                    fontFamily:
                                    lang == "ur" ? "j_n_n_k" : "a_m",
                                    fontSize: lang == "ur" ? 25.sp : 16.sp,
                                    //decoration: TextDecoration.underline,
                                  ),
                                ),
                                // TextSpan(
                                //   text: "terms_conditions".tr,
                                //   style: Theme.of(context)
                                //       .textTheme
                                //       .bodyMedium!
                                //       .copyWith(
                                //     color: AppColor.red,
                                //     letterSpacing: 2,
                                //     fontFamily:
                                //     lang == "ur" ? "j_n_n_k" : "a_m",
                                //     fontSize: lang == "ur" ? 25.sp : 16.sp,
                                //     decoration: TextDecoration.underline,
                                //   ),
                                // ),
                                // if (lang == "ur")
                                //   TextSpan(
                                //     text: "agree".tr,
                                //     style: Theme.of(context)
                                //         .textTheme
                                //         .bodyMedium!
                                //         .copyWith(
                                //       // color: AppColor.black,
                                //       letterSpacing: 2,
                                //       fontWeight: FontWeight.w300,
                                //       fontFamily:
                                //       lang == "ur" ? "j_n_n_k" : "a_m",
                                //       fontSize:
                                //       lang == "ur" ? 25.sp : 16.sp,
                                //     ),
                                //   ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  GetBuilder<LoginController>(
                    builder: (_) {
                      if (controller.isLoading) {
                        return const WidgetLoading();
                      }
                      return ElevatedButton(
                        onPressed: () async {
                          bool kIsWeb = const bool.fromEnvironment(
                              'dart.library.js_util');
                          if (controller.term) {
                            if (_phoneController.text.trim().length ==
                                desiredLength) {
                              if (kIsWeb) {
                                controller
                                    .setNumber(_phoneController.text.trim());
                                controller.snackBar(
                                    "${"otp sent".tr} ${controller.number!}");
                                _phoneController.clear();
                                // ignore: use_build_context_synchronously
                                Navigator.pushReplacementNamed(
                                    context, RouteString.otpVerification);
                                controller.setTerm(false);
                                controller.startTimer();
                              } else {
                                controller
                                    .setNumber(_phoneController.text.trim());
                                dynamic result =
                                await controller.otpLogin(false);
                                // print("error");
                                if (result != null) {
                                  controller.snackBar(
                                      "${"otp sent".tr} ${controller.number!}");
                                  _phoneController.clear();
                                  // ignore: use_build_context_synchronously
                                  controller.startTimer();
                                  Navigator.pushReplacementNamed(
                                      context, RouteString.otpVerification);
                                  controller.setTerm(false);
                                } else {
                                  controller.snackBar("otpgen".tr);
                                }
                              }
                            } else {
                              controller.snackBar("invalid num".tr);
                            }
                          } else {
                            controller.snackBar("agree ".tr);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          // shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          //   RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(18.0),
                          //   ),
                          // ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          elevation: 5,
                          backgroundColor: controller.term
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
                              color: controller.term
                                  ? AppColor.red
                                  : AppColor.inactiveButtonColor),
                          child: Icon(
                            Icons.arrow_forward,
                            color: controller.term
                                ? AppColor.fontColorButton
                                : AppColor.grey,
                          ),
                        ),
                      );
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
