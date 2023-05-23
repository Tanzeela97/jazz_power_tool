import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:intl/intl.dart';

import '../../data/constant/storage_string.dart';
import '../../model/city.dart';
import '../../model/namaz_time_day.dart';
import '../../model/news_feed.dart' as newsData;

import '../../model/news_feed.dart';
import '../../services/remote_services.dart';

const store_key = StorageString.NewsStorageKey;

class HomeScreenController extends GetxController {
  RxList<newsData.Data> newsList = <newsData.Data>[].obs;

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
  String? currentNamaz;
  String? nextNamaz;
  Duration? nextNamazDuration;
  Duration? elapsedDuration;

  // Duration? fajrDuration;
  // Duration? sunriseDuration;
  // Duration? duhrDuration;
  // Duration? asrDuration;
  // Duration? magribDuration;
  // Duration? eshaDuration;
  String? formattedTime;
  bool isLoading = true;

  var _newsList = <NewsFeed>[].obs;

  get news_List => _newsList.value;

  HomeScreenController() {
    loadCities();
    getNamazTimings(selectedCity);
    getFetchNewsFeed();
  }

  loadCities() async {
    isLoading = true;
    cities = await RemoteServices.getCityList();
    // isLoading = false;
    update();
  }

  Future<List<newsData.Data>> fetchNews() async {
    try {
      List<newsData.Data> data = await RemoteServices.fetchData();

      return data; // Return an empty list if data is null
    } catch (e) {
      print('Error: $e');
      return []; // Return an empty list in case of an error
    }
  }

  getNamazTimings(City city) async {
    isLoading = true;
    namazTimeDay = await RemoteServices.getNamazTimings(city);
    // print("${namazTimeDay.dateStr} ${namazTimeDay.fajr}");
    // Extract the date string into a separate variable for readability
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

    Map namaz = {};
    for (int i = 0, j = 1; i < prayerTimes.length; i++, j++) {
      // print(DateTime.parse("$dateStr ${prayerTimes[i]}")
      //     .difference(DateTime.now())
      //     .inMinutes);
      // print(
      //     "${prayerTimes[i]} ${DateTime.parse("$dateStr ${prayerTimes[i]}").difference(DateTime.now()).inMinutes} ${const Duration(minutes: 0).inMinutes} ${durations[i].inMinutes}");
      if (DateTime.parse("$dateStr ${prayerTimes[i]}")
              .difference(DateTime.now())
              .inMinutes >
          const Duration(minutes: 0).inMinutes) {
        // print(i);
        namaz = {
          "duration": durations[i - 1 < 0 ? i : i - 1].inMinutes,
          "prayer_time": "$dateStr ${prayerTimes[i]}",
          "current_namaz": i - 1,
          "next_namaz": i,
        };
        break;
      }
    }

    if (namaz.isEmpty) {
      namaz = {
        "duration": durations[5].inMinutes,
        "prayer_time": "$dateStr ${prayerTimes[5]}",
        "current_namaz": 5,
        "next_namaz": 0,
      };
    }
    // print(namaz);

    switch (namaz['current_namaz']) {
      case 0:
        currentNamaz = "Fajr";
        nextNamaz = "Sunrise";
        break;
      case 1:
        currentNamaz = "Sunrise";
        nextNamaz = "Duhr";
        break;
      case 2:
        currentNamaz = "Duhr";
        nextNamaz = "Asr";
        break;
      case 3:
        currentNamaz = "Asr";
        nextNamaz = "Maghrib";
        break;
      case 4:
        currentNamaz = "Maghrib";
        nextNamaz = "Isha";
        break;
      case 5:
        currentNamaz = "Esha";
        nextNamaz = "Fajr";
        break;
    }

    elapsedDuration =
        DateTime.parse(namaz["prayer_time"]).difference(DateTime.now());
    formattedTime =
        DateFormat('jm').format(DateTime.parse(namaz["prayer_time"]));
    nextNamazDuration =
        durations[currentNamaz == "Esha" ? 5 : namaz["current_namaz"]];
    // print(
    //     "$currentNamaz $nextNamaz ${elapsedDuration!.inMinutes} $formattedTime");
    isLoading = false;
    update();
  }

  selectCity(City city) async {
    selectedCity = city;
    await getNamazTimings(selectedCity);
    update();
  }

  final box = GetStorage();

//  Logger.level = Level.debug;

  List<newsData.Data> newsFeeds = [];

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
      final List<newsData.Data> newsList = (await RemoteServices.fetchData());
      if (newsList != null) {
        // Update the newsFeeds variable with the fetched data
        newsFeeds = newsList;
        print(newsList.first.title);

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

//  getFetchNewsFeed([String? param]) async {
//
//
//   try {
//
//     var objList = await RemoteServices.fetchData();
//
//
//     print('success state');
//    } on Exception catch (err) {
//
//  print('error state ${err}');
//   }
// }
}
