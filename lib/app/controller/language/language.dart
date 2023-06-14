import 'package:get/get.dart';

class MoreScreenController extends GetxController {
  String _language = "اردو";

  String get language => _language;

  setLanguage(String lang) {
    _language = lang;
    update();
  }

  bool _isLoading = false;

  bool get loading => _isLoading;

  setLoading(bool val) {
    _isLoading = val;
    update();
  }

  List<String> listOfLanguage = ["اردو", "English"];
}
//   class MoreScreenController extends GetxController {
//   RxString _language = "اردو".obs;
//   String get language => _language.value;
//   setLanguage(String lang) {
//   _language.value = lang;
//   update();
//   }
//
//   RxBool _isLoading = false.obs;
//   bool get loading => _isLoading.value;
//   setLoading(bool val) {
//   _isLoading.value = val;
//   update();
//   }
//
//   List<String> listOfLanguage = ["اردو", "English"];
//   }


