import 'dart:async';

import 'package:cache_manager/core/delete_cache_service.dart';
import 'package:cache_manager/core/read_cache_service.dart';
import 'package:cache_manager/core/write_cache_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:jazzpowertoolsapp/app/data/constant/app_color.dart';

import '../../data/constant/storage_string.dart';
import '../../model/authentication.dart';
import '../../model/city.dart';
import '../../model/namaz_time_day.dart';
import '../../model/news_feed.dart' as news_data;


import '../../model/forex.dart' as forex_list;
import '../../model/news_feed.dart';
import '../../services/remote_services.dart';

const store_key = StorageString.NewsStorageKey;

class HomeScreenController extends GetxController {
  RxList<news_data.Data> newsList = <news_data.Data>[].obs;

  List<City> cities = [];
  City selectedCity = City.fromJson({
    "location": {
      "coordinates": ["24.8608", "67.0104"]
    },
    "_id": "5c3896851f879d18e293e392",
    "name": "Karachi",
    "sort": "1"
  });
  late NamazTimeDay namazTimeDay;

  late bool kIsWeb;
  String name = "Hello";
  Timer? timer;
  AuthStatusModel? authStatusModel;
  String? formattedTime;
  bool isLoading = true;
  bool cityChanged = false;
  int refres = 0;
  String fajrTime = "";
  String duhrTime = "";
  String asrTime = "";
  String maghribTime = "";
  String eshaTime = "";
  late Duration nextDuration;
  late ScrollController scrollController;
  int start = 0;
  int end = 15;
  bool isFirstLoadRunning = false;
  bool isLoadMoreRunning = false;
  DateTime? unFormattedTime;
  String timeDayFajr = "",
      timeDayZuhr = "",
      timeDayAsr = "",
      timeDayMaghrib = "",
      timeDayIsha = "";

  late Duration nextNamazDuration;
  late Duration elapsedDuration;
  String? currentNamaz;
  String? nextNamaz;

  final _newsList = <NewsFeed>[].obs;

  get news_List => _newsList.value;

  HomeScreenController(web) {
    setWeb(web);
    //loadCities();
    getNamazTimings(selectedCity);
    getFetchNewsFeed();
  }
  setLogout() async {
    login = false;
    subscription = false;
    number = '';
    // name = await ReadCache.getString(key: "name") ?? "Hello";
    authStatusModel = null;
    update();
  }

  setWeb(bool web) {
    kIsWeb = web;
  }

  Future<void> onRefresh() async {
    timer!.cancel();
   await getNamazTimings(selectedCity);
  }


  // loadCities() async {
  //   isLoading = true;
  //   cities = await RemoteServices.getCityList();
  //   // isLoading = false;
  //   update();
  // }



  // selectCity(City city) async {
  //   selectedCity = city;
  //   await getNamazTimings(selectedCity);
  //   update();
  // }

  final box = GetStorage();

//  Logger.level = Level.debug;

  List<news_data.Data> newsFeeds = [];
  List<forex_list.Data> forex = [];

  // Future<List<NewsFeed>> getFetchNewsFeed() async {
  //   try {
  //     final List<NewsFeed> newsList = await RemoteServices.fetchData();
  //     if (newsList != null) {
  //       // Update the newsFeeds variable with the fetched data
  //       newsFeeds = newsList;
  //       print(newsList.first.title);
  //
  //       print('Success state');
  //       return newsFeeds;
  //     } else {
  //       // Handle the case when the API response is null
  //       print('API response is null');
  //     }
  //   } catch (err) {
  //     // Handle the error state
  //     print('Error state: $err');
  //   }
  //   return newsList;
  // }

  Future<void>  getFetchNewsFeed() async {
    try {

      final List<news_data.Data> newsList = (await RemoteServices.fetchNewsData());
      if (newsList != null) {
        // Update the newsFeeds variable with the fetched data
        // Decode the response data using UTF-8 encoding
       newsFeeds = newsList;

      } else {
        // Handle the case when the API response is null
        print('API response is null');
      }
    } catch (err) {
      // Handle the error state
      print('Error state: $err');
    }
  }
///forex api
  Future<void>  getForex() async {
    try {

      final List<forex_list.Data> forexList = (await RemoteServices.getForexData());
      if (forexList != null) {
        // Update the newsFeeds variable with the fetched data
        // Decode the response data using UTF-8 encoding
        forex = forexList;
        print(forexList.first.buying);

        print('Success state');
      } else {
        // Handle the case when the API response is null
        print('API response is null');
      }
    } catch (err) {
      // Handle the error state
      print('Error state: $err');
    }
  }



  getNamazTimingsAPICall(City city) async {
    isLoading = true;
    print("api call");
    namazTimeDay = await RemoteServices.getNamazTimings(city);
    if (kIsWeb) {

    } else {

    }

    print(namazTimeDay.dateStr);

    final dateStr = namazTimeDay.dateStr.split('-').reversed.join('-');

// Define an array of prayer times in the order they occur
    final prayerTimes = [
      namazTimeDay.fajr,
      namazTimeDay.sunrise,
      namazTimeDay.dhuhr,
      namazTimeDay.asr,
      namazTimeDay.maghrib,
      namazTimeDay.isha,
    ];

// Calculate the duration between each pair of prayer times
    final durations = [
      for (var i = 0; i < prayerTimes.length - 1; i++)
        DateTime.parse('$dateStr ${prayerTimes[i + 1]}')
            .difference(DateTime.parse('$dateStr ${prayerTimes[i]}')),
    ];

// Calculate the duration between isha and the next day's fajr
    final eshaDuration = DateTime.parse('$dateStr ${namazTimeDay.fajr}')
        .add(const Duration(days: 1))
        .difference(DateTime.parse('$dateStr ${namazTimeDay.isha}'));
    durations.add(eshaDuration);
    List<String> stringList = [];
    for (var d in durations) {
      stringList.add(d.inMinutes.toString());
    }

    await WriteCache.setListString(key: 'durations', value: stringList);
    // await prefs.setStringList('trending', trending);
  }

  getNamazTimings(City city) async {
    if (kIsWeb) {
     // trending = [];
    }
    // final SharedPreferences prefs = await SharedPreferences.getInstance();

    // login = await ReadCache.getBool(key: "login") ?? false;

    subscription = await ReadCache.getBool(key: 'subscription') ?? false;
    number = await ReadCache.getString(key: "number") ?? "";

    // print("$subscription $number");
    final String? date = await ReadCache.getString(key: 'date_str');
    print(date);


    String? dateStr;
    if (date != null) {
      dateStr = date.split('-').reversed.join('-');
      final days = DateTime.parse(dateStr).difference(DateTime.now());
      dateStr = date;
      print(days.inDays);
      if (days.inDays < 0 || cityChanged) {
        cityChanged = false;
        await getNamazTimingsAPICall(city);
        NamazTimeDay timeDay =
        NamazTimeDay.fromJson(await ReadCache.getJson(key: "namaztimeday"));
        namazTimeDay = timeDay;
        print(namazTimeDay.dateStr);
        final List<String>? stringList =
        await ReadCache.getStringList(key: 'durations');
        List<Duration> durations = [];
        for (var d in stringList!) {
          durations.add(Duration(minutes: int.parse(d)));
        }
        print(dateStr);
        calculateDurations(dateStr, timeDay, durations);
      } else {
        // print("shared");

        // if (kIsWeb == false) {
        //  // trending = [];
        //   dynamic result = await ReadCache.getJson(key: "trending") ?? {};
        //   if (result != null) {
        //   //  trending = [];
        //     for (var r in result["data"]) {
        //       print(r);
        //       //trending.add(Trending.fromJson(r));
        //     }
        //   }
        // }

        NamazTimeDay timeDay =
        NamazTimeDay.fromJson(await ReadCache.getJson(key: "namaztimeday"));
        namazTimeDay = timeDay;
        final List<String>? stringList =
        await ReadCache.getStringList(key: 'durations');
        List<Duration> durations = [];
        for (var d in stringList!) {
          durations.add(Duration(minutes: int.parse(d)));
        }
        print(dateStr);
        calculateDurations(dateStr, timeDay, durations);
      }
    } else {
      print("Exception");
      await getNamazTimingsAPICall(city);
      print("Exception1");
      // if (kIsWeb == false) {
      //  // trending = [];
      //   dynamic result = await ReadCache.getJson(key: "trending") ?? {};
      //
      //   if (result != null) {
      //    // trending = [];
      //     for (var r in result["data"]) {
      //       print(r);
      //     //  trending.add(Trending.fromJson(r));
      //     }
      //   }
      // }

      dateStr = namazTimeDay.dateStr;
      calculateDurations(dateStr, namazTimeDay, null);
    }
    // print("${namazTimeDay.dateStr} ${namazTimeDay.fajr}");
    // Extract the date string into a separate variable for readability

// Define an array of prayer times in the order they occur
  }

  calculateDurations(
      String? dateStr, NamazTimeDay timeDay, List<Duration>? durations) {
    print(namazTimeDay.dateStr);
    final prayerTimes = [
      timeDay.fajr,
      timeDay.sunrise,
      timeDay.dhuhr,
      timeDay.asr,
      timeDay.maghrib,
      timeDay.isha,
    ];


    dateStr = dateStr!.split('-').reversed.join('-');
    // print("date2:  $dateStr");
    print("fajr: ${"$dateStr ${namazTimeDay.fajr}"}");
    if (durations == null) {


      durations = [
        for (var i = 0; i < prayerTimes.length - 1; i++)
          DateTime.parse('$dateStr ${prayerTimes[i + 1]}')
              .difference(DateTime.parse('$dateStr ${prayerTimes[i]}')),
      ];

      final eshaDuration = DateTime.parse('$dateStr ${namazTimeDay.fajr}')
          .add(const Duration(days: 1))
          .difference(DateTime.parse('$dateStr ${namazTimeDay.isha}'));
      durations.add(eshaDuration);
    }

    Map namaz = {};
    for (int i = 0, j = 1; i < prayerTimes.length; i++, j++) {
      print(
          "${prayerTimes[i]} ${DateTime.parse("$dateStr ${prayerTimes[i]}").difference(DateTime.now()).inMinutes} ${const Duration(minutes: 0).inMinutes} ${durations[i].inMinutes}");
      if (DateTime.parse("$dateStr ${prayerTimes[i]}")
          .difference(DateTime.now())
          .inMinutes >
          const Duration(minutes: 0).inMinutes) {
        // print(i);
        namaz = {
          "duration": durations[i - 1 < 0 ? 5 : i - 1].inMinutes,
          "prayer_time": i - 1 < 0
              ? "$dateStr ${prayerTimes[i]}"
              : "$dateStr ${prayerTimes[i]}",
          "current_namaz": i - 1 < 0 ? i : i,
          "next_namaz": i - 1 < 0 ? i + 1 : i + 1,
        };
        break;
      }
    }

    if (namaz.isEmpty) {
      namaz = {
        "duration": durations[5].inMinutes,
        "prayer_time": "$dateStr ${prayerTimes[0]}",
        "current_namaz": 0,
        "next_namaz": 1,
      };
    }

    switch (namaz['current_namaz']) {
      case 0:
        currentNamaz = "isha";
        nextNamaz = "fajr";
        break;
      case 1:
        currentNamaz = "fajr";
        nextNamaz = "sunrise";
        break;
      case 2:
        currentNamaz = "sunrise";
        nextNamaz = "duhr";
        break;
      case 3:
        currentNamaz = "duhr";
        nextNamaz = "asr";
        break;
      case 4:
        currentNamaz = "asr";
        nextNamaz = "maghrib";
        break;
      case 5:
        currentNamaz = "maghrib";
        nextNamaz = "isha";
        break;
    }

    fajrTime = DateFormat('jm')
        .format(DateTime.parse("$dateStr ${namazTimeDay.fajr}"));
    duhrTime = DateFormat('jm')
        .format(DateTime.parse("$dateStr ${namazTimeDay.dhuhr}"));
    asrTime =
        DateFormat('jm').format(DateTime.parse("$dateStr ${namazTimeDay.asr}"));
    maghribTime = DateFormat('jm')
        .format(DateTime.parse("$dateStr ${namazTimeDay.maghrib}"));
    eshaTime = DateFormat('jm')
        .format(DateTime.parse("$dateStr ${namazTimeDay.isha}"));
    print(namaz);
    nextNamazDuration = Duration(minutes: namaz["duration"]);
    print(
        "${DateTime.parse(namaz['prayer_time']).add(const Duration(days: 1)).difference(DateTime.now())} ${DateTime.parse(namaz['prayer_time']).add(const Duration(days: 1))}");
    final days = DateTime.parse(dateStr).difference(DateTime.now());
    print("dayss ${days.inHours}");
    if (currentNamaz == "isha" && days.inHours < 8 && days.inHours < -15) {
      elapsedDuration = DateTime.parse(namaz['prayer_time'])
          .add(const Duration(days: 1))
          .difference(DateTime.now());
    } else {
      elapsedDuration =
          DateTime.parse(namaz["prayer_time"]).difference(DateTime.now());
    }
    var next = nextNamazDuration.inMinutes;
    var elapsedD = elapsedDuration.inMinutes;
    int elapsedTime = next - elapsedD!;
    refres = ((next / 60) * 60).round();

    print("${next} $elapsedTime");
    // elapsedDuration = Duration(minutes: elapsedTime);
    nextDuration = nextNamazDuration;
    nextNamazDuration = Duration(minutes: ((next / (next)) * 60).round());
    elapsedDuration = Duration(minutes: ((elapsedTime / (next)) * 60).round());
    // if (elapsedDuration.inMinutes >= nextNamazDuration.inMinutes) {
    //   refres = 1;
    // }
    unFormattedTime = DateTime.parse(namaz["prayer_time"]);
    formattedTime =
        DateFormat('jm').format(DateTime.parse(namaz["prayer_time"]));
    DateTime x = DateTime.parse("$dateStr ${timeDay.fajr}");
    if (x.hour >= 0 && x.hour <= 11) {
      timeDayFajr = "time_day_m".tr;
    } else if (x.hour >= 12 && x.hour <= 16) {
      timeDayFajr = "time_day_an".tr;
      // print(timeDay);
    } else if (x.hour >= 17 && x.hour <= 20) {
      timeDayFajr = "time_day_e".tr;
    } else if (x.hour >= 21 && x.hour <= 23) {
      timeDayFajr = "time_day_m".tr;
    }
    x = DateTime.parse("$dateStr ${timeDay.dhuhr}");
    if (x.hour >= 0 && x.hour <= 11) {
      timeDayZuhr = "time_day_m".tr;
    } else if (x.hour >= 12 && x.hour <= 16) {
      timeDayZuhr = "time_day_an".tr;
      // print(timeDay);
    } else if (x.hour >= 17 && x.hour <= 20) {
      timeDayZuhr = "time_day_e".tr;
    } else if (x.hour >= 21 && x.hour <= 23) {
      timeDayZuhr = "time_day_m".tr;
    }
    x = DateTime.parse("$dateStr ${timeDay.asr}");
    if (x.hour >= 0 && x.hour <= 11) {
      timeDayAsr = "time_day_m".tr;
    } else if (x.hour >= 12 && x.hour <= 16) {
      timeDayAsr = "time_day_an".tr;
      // print(timeDay);
    } else if (x.hour >= 17 && x.hour <= 20) {
      timeDayAsr = "time_day_e".tr;
    } else if (x.hour >= 21 && x.hour <= 23) {
      timeDayAsr = "time_day_m".tr;
    }
    x = DateTime.parse("$dateStr ${timeDay.maghrib}");
    if (x.hour >= 0 && x.hour <= 11) {
      timeDayMaghrib = "time_day_m".tr;
    } else if (x.hour >= 12 && x.hour <= 16) {
      timeDayMaghrib = "time_day_an".tr;
      // print(timeDay);
    } else if (x.hour >= 17 && x.hour <= 20) {
      timeDayMaghrib = "time_day_e".tr;
    } else if (x.hour >= 21 && x.hour <= 23) {
      timeDayMaghrib = "time_day_m".tr;
    }
    x = DateTime.parse("$dateStr ${timeDay.isha}");
    if (x.hour >= 0 && x.hour <= 11) {
      timeDayIsha = "time_day_m".tr;
    } else if (x.hour >= 12 && x.hour <= 16) {
      timeDayIsha = "time_day_an".tr;
      // print(timeDay);
    } else if (x.hour >= 17 && x.hour <= 20) {
      timeDayIsha = "time_day_e".tr;
    } else if (x.hour >= 21 && x.hour <= 23) {
      timeDayIsha = "time_day_m".tr;
    }

    // nextNamazDuration =
    //     Duration(seconds: ((nextNamazDuration.inMinutes / 60) * 100).round());
    // elapsedDuration =
    //     Duration(seconds: ((elapsedDuration.inMinutes / 60) * 100).round());

    print("${nextNamazDuration.inMinutes} ${elapsedDuration.inMinutes}");

    nextNamazTimer();
    isLoading = false;
    update();
  }


  nextNamazTimer() async {
    print("refresh $refres");
    timer = Timer.periodic(Duration(seconds: refres), (timer) async {
      // print(nextNamazDuration.inMinutes);
      print(refres);
      elapsedDuration += Duration(minutes: 1);
      print(elapsedDuration.inMinutes);
      update();
      // print("${elapsedDuration.inMinutes} >= ${nextNamazDuration.inMinutes}");
      if (elapsedDuration.inMinutes >= nextNamazDuration.inMinutes - 1) {
        timer.cancel();
        update();

        // final SharedPreferences prefs = await SharedPreferences.getInstance();

        final List<String>? stringList =
        await ReadCache.getStringList(key: 'durations');
        final String? date = await ReadCache.getString(key: 'date_str');
        print("current: $nextNamaz");
        String dateStr = date!.split('-').reversed.join('-');
        final days = DateTime.parse(dateStr).difference(DateTime.now());
        print("${days.inDays} ${days.inHours} $date ${DateTime.now()}");
        if (currentNamaz == "fajsr") {
          print("going for api");
          getNamazTimings(selectedCity);
          update();
          return;
        }

        List<Duration> durations = [];
        for (var d in stringList!) {
          durations.add(Duration(minutes: int.parse(d)));
        }
        calculateDurations(date, namazTimeDay, durations);
        update();
      }
    });
  }

  void firstLoad() async {

    cities = [];
    start = 0;
    end = 15;
    cities = await RemoteServices.getCityList(0, 15);
    isFirstLoadRunning = false;
    update();
  }

  void loadMore() async {
   if (isFirstLoadRunning == false && isLoadMoreRunning == false) {
      isLoadMoreRunning = true; // Display a progress indicator at the bottom
      update();
      start += 15;
      end += 15;
      if (end == 315) {
        end = 313;
      }
      if (start <= 313 && end <= 313) {
        var result = await RemoteServices.getCityList(start, end);
        cities.addAll(result);
      }

      isLoadMoreRunning = false;
      update();
    }
  }

  late bool login;
  late bool subscription;
  late String number;

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

  Future unsubscription({required String? number}) async {
    try {
      if (kIsWeb) {
        subscription = false;
        number = '';
        // final SharedPreferences prefs = await SharedPreferences.getInstance();
        await DeleteCache.deleteKey("subscription");
        await DeleteCache.deleteKey("number");
        update();
      } else {
        var result = await RemoteServices.unSubscription(number);
        // print(result);
        return result;
      }
    } on Exception catch (_) {
    } finally {
      subscription = false;
      number = '';
      // final SharedPreferences prefs = await SharedPreferences.getInstance();
      await DeleteCache.deleteKey("subscription");
      await DeleteCache.deleteKey("number");
      update();
      // _isLoading = false;
    }
  }

  snackBar(msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        textColor: AppColor.white,
        fontSize: 16.0);
  }
}

