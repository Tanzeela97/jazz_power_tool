import 'dart:async';

import 'package:cache_manager/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';



import '../../data/constant/app_color.dart';
import '../../model/authentication.dart';
import '../../services/remote_services.dart';

class LoginController extends GetxController {
  // LoginController() {
  //   checkLogin();
  // }

  String? _number;
  String? get number => _number;
  setNumber(String number) {
    _number = "$number";
  }

  bool _term = false;
  bool get term => _term;
  setTerm(bool val) {
    _term = val;
    update();
  }

  bool _otpPin = false;
  bool get otpPin => _otpPin;
  setOtpPin(bool val) {
    _otpPin = val;
    update();
  }

  bool _timeUp = true;
  bool get timeUp => _timeUp;
  setTimeUp(bool val) {
    _timeUp = val;
    update();
  }

  int _minutesLeft = 5;
  int _secondsLeft = 00;
  String _timeLeft = "5:00";
  String get timeLeft => _timeLeft;

  Timer? _timer;

  startTimer() {
    _timeUp = false;
    _minutesLeft = 5;
    _secondsLeft = 00;
    _timeLeft = "5:00";
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsLeft == 0 && _minutesLeft > 0) {
        _minutesLeft--;
        _secondsLeft = 59;
        _timeLeft = '$_minutesLeft:$_secondsLeft';
      } else if (_secondsLeft > 0) {
        _secondsLeft--;
        if (_secondsLeft < 10) {
          _timeLeft = '$_minutesLeft:0$_secondsLeft';
        } else {
          _timeLeft = '$_minutesLeft:$_secondsLeft';
        }
      } else if (_secondsLeft == 0 && _minutesLeft == 0) {
        _timeUp = true;
        update();
        timer.cancel();
      }
      update();
    });
  }

  stopTimer() {
    _timer!.cancel();
    _timeUp = false;
    update();
  }

  late AuthStatusModel authStatusModel;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isLoadingResend = false;
  bool get isLoadingResend => _isLoadingResend;

  checkLogin() async {
    dynamic result = await ReadCache.getJson(key: "auth_status_model");
    if (result != null) {
      authStatusModel = AuthStatusModel.fromJson(result);
    }
  }

  Future otpLogin(bool resend) async {
    if (resend) {
      _isLoadingResend = true;
    } else {
      _isLoading = true;
    }
    update();

    try {
      var result = await RemoteServices.loginWithOtp(_number);
      // _isLoading = false;
      // update();
      // print("eer");
      return result;
    } on Exception catch (_) {
    } finally {
      if (resend) {
        _isLoadingResend = false;
        _minutesLeft = 5;
        _secondsLeft = 0;
        _timeLeft = "5:00";
        _timeUp = false;
        startTimer();
      } else {
        _isLoading = false;
      }
      update();
    }
  }

  Future verifyOtp({required String code}) async {
    _isLoading = true;
    update();

    try {
      var result = await RemoteServices.verifyOtp(number, code);
      print(result);
      return result;
    } on Exception catch (_) {
      _isLoading = false;
      update();
    } finally {
      _isLoading = false;
      update();
    }
  }

  Future checkStatus() async {
    try {
      var result = await RemoteServices.checkStatus(_number);
      // print('res $result');
      return result;
    } on Exception catch (_) {
      // _hasError.value = true;
    } finally {
      // _isLoading = false;
    }
  }

  Future subscription() async {
    // _isLoading = true;
    // update();

    try {
      var result =
      await RemoteServices.subscription(number, authStatusModel.token!);
      // print('res $result');
      return result;
    } on Exception catch (_) {
      // _isLoading = false;
      // update();
    } finally {
      // _isLoading = false;
      // update();
    }
  }

  snackBar(msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  loading({required context, required color, required fontFamily}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: color,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "loading".tr,
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: AppColor.red,
                    fontFamily: fontFamily,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
