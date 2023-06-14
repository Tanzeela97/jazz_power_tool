import 'package:cache_manager/cache_manager.dart';
import 'package:get/get.dart';

import '../../model/city.dart';

class ProfileController extends GetxController {
  String _name = "Hello";
  String get name => _name;
  setName(String val) {
    _name = val;
    update();
  }

  bool _male = false;
  bool get male => _male;

  bool _female = true;
  bool get female => _female;

  toggleGender(bool m, bool f) {
    _male = m;
    _female = f;
    update();
  }

  City _city = City.fromJson({
    "location": {
      "coordinates": ["24.8608", "67.0104"]
    },
    "_id": "5c3896851f879d18e293e392",
    "name": "Karachi",
    "sort": "1"
  });
  City get city => _city;
  setCity(City c) {
    _city = c;
    _cityChanged = true;
    update();
  }

  bool _cityChanged = false;
  get cityChanged => _cityChanged;
  setCityChanged() {
    _cityChanged = false;
    update();
  }

  String profileDetails = "";

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int? _day;
  int? _month;
  int? _year;
  get date => "$_year-$_month-$_day";

  setDate({int? day, int? month, int? year}) {
    _day = day;
    _month = month;
    _year = year;
    update();
  }

  updateData(String n) async {
    _isLoading = true;
    update();
    // print(name);
    if (n.isNotEmpty) {
      _name = n;

      await WriteCache.setString(key: "name", value: _name);
    }
    await WriteCache.setString(key: "gender", value: _male ? "male" : "female");
    await WriteCache.setJson(key: "city", value: _city.toJson());
    _isLoading = false;
    update();
  }
}
