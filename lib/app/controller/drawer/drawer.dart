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
