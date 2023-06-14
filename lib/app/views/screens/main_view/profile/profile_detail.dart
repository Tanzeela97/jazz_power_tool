import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:jazzpowertoolsapp/app/views/widgets/widget_loader.dart';

import '../../../../controller/home_screen/home_screen_controller.dart';
import '../../../../controller/profile/profile_controller.dart';
import '../../../../controller/theme/theme.dart';
import '../../../../data/constant/app_color.dart';
import '../../../../data/constant/image_string.dart';
import '../../../../data/constant/route_string.dart';
import '../../../widgets/kback_button.dart';
import '../../../widgets/kback_button_ur.dart';
import '../../../widgets/ktext1.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({Key? key}) : super(key: key);

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  DateTime currentBackPressTime = DateTime.now();
  final homeController = Get.put(
      HomeScreenController(const bool.fromEnvironment('dart.library.js_util')));
  ThemeController themeController = Get.find();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dayController = TextEditingController();
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final profileController = Get.put(ProfileController());
  final format = DateFormat("dd-MM-yyyy");
  String lang = Get.locale!.languageCode;
  final desiredDayLength = 2;
  final desiredMonthLength = 2;
  final desiredYearLength = 4;

  void _onDayTextChanged() {
    if (_dayController.text.length > desiredDayLength) {
      _dayController.text = _dayController.text.substring(0, desiredDayLength);
      _dayController.selection =
          TextSelection.fromPosition(TextPosition(offset: desiredDayLength));
    }
  }

  void _onMonthTextChanged() {
    if (_monthController.text.length > desiredMonthLength) {
      _monthController.text =
          _monthController.text.substring(0, desiredMonthLength);
      _monthController.selection =
          TextSelection.fromPosition(TextPosition(offset: desiredMonthLength));
    }
  }

  void _onYearTextChanged() {
    if (_yearController.text.length > desiredYearLength) {
      _yearController.text =
          _yearController.text.substring(0, desiredYearLength);
      _yearController.selection =
          TextSelection.fromPosition(TextPosition(offset: desiredYearLength));
    }
  }

  @override
  void initState() {
    _dayController.addListener(_onDayTextChanged);
    _monthController.addListener(_onMonthTextChanged);
    _yearController.addListener(_onYearTextChanged);
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dayController.dispose();
    _monthController.dispose();
    _yearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return GetBuilder<ThemeController>(
      builder: (_) => Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration:  BoxDecoration(
              image: DecorationImage(
                image: ImageString.backgroundImage,
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  lang == "ur"
                      ? Align(
                    alignment: Alignment.topRight,
                    child: KBackBtnUrdu(
                      function: () {
                        Navigator.popAndPushNamed(
                            context, RouteString.home);
                      },
                    ),
                  )
                      : Align(
                    alignment: Alignment.topLeft,
                    child: KBackBtn(
                      function: () {
                        Navigator.popAndPushNamed(
                            context, RouteString.home);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  Text(
                    "about_you".tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: lang == "ur" ? 45.sp : 30.sp,

                      fontFamily: lang == "ur" ? "Jameel Noori Nastaleeq" : "Poppins",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 10.w, vertical: 10),
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 90.w,
                                height: 50.h,
                                alignment: Alignment.center,
                                child: KText1(
                                  text: "name".tr,
                                color: AppColor.white,
                                  fontSize: lang == "ur" ? 18.sp : 14.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily:
                                  lang == "ur" ? "Jameel Noori Nastaleeq" : "Poppins",
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              SizedBox(
                                width: 275.w,
                                height: 50.h,
                                child: Material(
                                  color:isDarkMode?Colors.grey:AppColor.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  elevation: 10,
                                  child: TextFormField(
                                    // textAlign: TextAlign.left,
                                    keyboardType: TextInputType.name,
                                    controller: _nameController,
                                    autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: isDarkMode?Colors.grey:Colors.white,
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
                                      print(_nameController.text.trim());
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 90.w,
                                height: 50.h,
                                child: KText1(
                                  color: AppColor.white,
                                  text: "dob".tr,
                                  fontSize: lang == "ur" ? 18.sp : 14.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily:
                                  lang == "ur" ? "Jameel Noori Nastaleeq" : "Poppins",
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              SizedBox(
                                width: 77.w,
                                height: 50.h,
                                child: Material(
                                  color:isDarkMode?Colors.grey:AppColor.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  elevation: 10,
                                  child: TextFormField(
                                    textAlign: TextAlign.left,
                                    controller: _dayController,
                                    autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor:isDarkMode?Colors.grey:AppColor.white,
                                      contentPadding:
                                      const EdgeInsets.symmetric(
                                          horizontal: 18, vertical: 18),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(15.0),
                                        borderSide: BorderSide.none,
                                      ),
                                      hintStyle: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 15.sp),
                                    ),
                                    onChanged: (val) {},
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
                                  color:isDarkMode?Colors.grey:AppColor.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  elevation: 10,
                                  child: TextFormField(
                                    textAlign: TextAlign.left,
                                    controller: _monthController,
                                    autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      filled: true,
                                      // fillColor: themeController
                                      //     .scaffoldBackgroundColor.value,
                                      fillColor: isDarkMode?Colors.grey:Colors.white,


                                      contentPadding:
                                      const EdgeInsets.symmetric(
                                          horizontal: 18, vertical: 18),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(15.0),
                                        borderSide: BorderSide.none,
                                      ),
                                      hintStyle: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 15.sp),
                                    ),
                                    onChanged: (val) {
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
                                  color: isDarkMode?Colors.grey:Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  elevation: 10,
                                  child: TextFormField(
                                    textAlign: TextAlign.left,
                                    controller: _yearController,
                                    autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: isDarkMode?Colors.grey:Colors.white,
                                       // fillColor:AppColor.white,
                                      contentPadding:
                                      const EdgeInsets.symmetric(
                                          horizontal: 18, vertical: 18),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(15.0),
                                        borderSide: BorderSide.none,
                                      ),
                                      hintStyle: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 15.sp),

                                      // border: InputBorder.none,
                                    ),
                                    onChanged: (val) {
                                      // _phoneController.text = phone.completeNumber;
                                    },
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
                              Container(
                                alignment: Alignment.center,
                                width: 90.w,
                                height: 50.h,
                                child: KText1(
                                  text: "gender".tr,
                                  fontSize: lang == "ur" ? 18.sp : 14.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily:
                                  lang == "ur" ? "Jameel Noori Nastaleeq" : "Poppins",
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              SizedBox(
                                width: 275.w,
                                height: 50.h,
                                child: Material(
                                  color:isDarkMode?Colors.grey:AppColor.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  elevation: 10,
                                  child: GetBuilder<ProfileController>(
                                    builder: (_) => Row(
                                      children: [
                                        SizedBox(
                                          width: 275.w / 2,
                                          child: RadioListTile(
                                            contentPadding: EdgeInsets.zero,
                                            value: profileController.male,
                                            groupValue: true,
                                            onChanged: (val) {
                                              profileController.toggleGender(
                                                  true, false);
                                            },
                                            activeColor:AppColor.red,
                                            title: KText1(
                                              text: "male".tr,
                                              fontSize:
                                              lang == "ur" ? 18.sp : 14.sp,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: lang == "ur"
                                                  ? "Jameel Noori Nastaleeq"
                                                  : "Poppins",
                                                color:AppColor.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(

                                          width: 275.w / 2,
                                          child: RadioListTile(
                                            contentPadding: EdgeInsets.zero,
                                            value: profileController.female,
                                            groupValue: true,
                                            onChanged: (val) {
                                              profileController.toggleGender(
                                                  false, true);
                                            },

                                            activeColor: AppColor.red,
                                            title: KText1(
                                              text: "female".tr,
                                              fontSize:
                                              lang == "ur" ? 18.sp : 14.sp,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: lang == "ur"
                                                  ? "Jameel Noori Nastaleeq"
                                                  : "Poppins",
                                                color:AppColor.black
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
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
                              Container(
                                alignment: Alignment.center,
                                width: 90.w,
                                height: 50.h,
                                child: KText1(
                                  text: "city".tr,
                                  fontSize: lang == "ur" ? 18.sp : 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.white,
                                  fontFamily:
                                  lang == "ur" ? "Jameel Noori Nastaleeq" : "Poppins",
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              SizedBox(
                                width: 275.w,
                                height: 50.h,
                                child: Material(

                                color:isDarkMode?Colors.grey:AppColor.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  elevation: 10,
                                  child: GetBuilder<ProfileController>(
                                    builder: (_) => ListTile(
                                      title: KText1(
                                        text: profileController.city.name,
                                        fontSize: lang == "ur" ? 18.sp : 14.sp,
                                        fontWeight: FontWeight.normal,
                                          fontFamily:
                                          lang == "ur" ? "Jameel Noori Nastaleeq" : "Poppins",
                                        color:AppColor.black),
                                      trailing: const Icon(Icons.pin_drop),
                                      onTap: () {
                                        profileController.profileDetails =
                                        "update";
                                        Navigator.pushNamed(context,
                                            RouteString.cityListScreen)
                                            .then((value) {
                                          profileController.profileDetails = "";
                                        });
                                      },
                                    ),
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
                  GetBuilder<ProfileController>(builder: (_) {
                    if (profileController.isLoading) {
                      return const WidgetLoading();
                    }
                    return TextButton(
                      onPressed: () async {
                        if (_yearController.text.isNotEmpty &&
                            _monthController.text.isNotEmpty &&
                            _dayController.text.isNotEmpty) {
                          int? day = int.tryParse(_dayController.text);
                          int? month = int.tryParse(_monthController.text);
                          int? year = int.tryParse(_yearController.text);

                          if (day == null) {
                            homeController.snackBar("Day is not correct");
                            return;
                          }
                          if (month == null) {
                            homeController.snackBar("Month is not correct");
                            return;
                          }
                          if (year == null) {
                            homeController.snackBar("Year is not correct");
                            return;
                          }
                          if (year > DateTime.now().year || year < 1950) {
                            homeController.snackBar(
                                "Year can be from 1950 to ${DateTime.now().year}");
                            return;
                          }
                          if (month > 12 || month < 1) {
                            homeController.snackBar("Months are from 1 to 12");
                            return;
                          }
                          if ((month == 1 ||
                              month == 3 ||
                              month == 5 ||
                              month == 7 ||
                              month == 8 ||
                              month == 10 ||
                              month == 12) &&
                              (day > 31 || day < 1)) {
                            homeController.snackBar("Days are from 1 to 31");
                            return;
                          }
                          if ((month == 4 ||
                              month == 6 ||
                              month == 9 ||
                              month == 11) &&
                              (day > 30 || day < 1)) {
                            homeController.snackBar("Days are from 1 to 30");
                            return;
                          }
                          if ((month == 2) && (day > 29 || day < 1)) {
                            homeController.snackBar("Days are from 1 to 29");
                            return;
                          }
                          profileController.setDate(
                              day: day, month: month, year: year);
                        }

                        await profileController
                            .updateData(_nameController.text.trim());
                        // print(profileController.name);
                        if (profileController.cityChanged) {
                          homeController.selectCity(profileController.city);
                        }
                        profileController.setCityChanged();
                        homeController.setName(profileController.name);
                        homeController.checkGender();
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: 300.w,
                        decoration: BoxDecoration(
                          // shape: BoxShape.circle,
                          borderRadius: BorderRadius.circular(18),
                          color: AppColor.white
                        ),
                        alignment: Alignment.center,
                        child: Text("submit".tr,
                            style: TextStyle(
                              fontSize: lang == "ur" ? 24.sp : 18.sp,
                              color: AppColor.red,
                              fontWeight: FontWeight.w400,
                            )),
                      ),
                    );
                  }),
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
        ),
      ),
    );
  }
}
