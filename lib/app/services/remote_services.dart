
import 'dart:convert';

import 'package:cache_manager/core/write_cache_service.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jazzpowertoolsapp/app/model/joke.dart';

import '../data/json_data/constant_cities.dart' as c;
import '../data/json_data/constant_ayat.dart' as a;
import '../data/json_data/constant_joke.dart' as jokes;
import '../model/ayat_of_the_day.dart';
import '../model/ayat.dart';

import '../data/constant/api_string.dart';
import '../model/authentication.dart';

import '../model/city.dart';
import '../model/forex.dart' as forex;
import '../model/namaz_time_day.dart';
import '../model/news_feed.dart' as news_feed;
import 'fetch_api_service.dart';
import 'package:http/http.dart' as http;
class RemoteServices {
  static Future<List<City>> getCityList(int start, int end) async {
    try {
      var objList = await c.cities.getRange(start, end);
      // logger.d(objList);
      return objList.map<City>((e) => City.fromJson(e)).toList();
    } on Exception catch (err) {
      print("Something went wrong on RemoteServices -> GetCityList() ${err}");
      throw Error();
    }
  }

  // static Future getAyats(Surah surah, int start, String tr) async {
  //   var parse = Uri.parse(ApiString.baseUrl);
  //   var uri = Uri.https(parse.authority, ApiString.quran_endpoint, {
  //     'surah': surah.no.toString(),
  //     'ayat': start.toString(),
  //     'limit': "10",
  //     'lang': "ar,$tr",
  //   });
  //   // print(uri);
  //   dynamic response = await FecthApiService.get(uri: uri);
  //   // print(response);
  //
  //   // if (response[0]['status'] == 'failed') {
  //   //   return null;
  //   // }
  //
  //   for (var ayats in response["data"]) {
  //     if (ayats["lang"] == "AR") {
  //       surah.arAyat.add(Ayat.fromJson(ayats));
  //     }
  //     if (ayats["lang"] == "UR") {
  //       surah.trAyat.add(Ayat.fromJson(ayats));
  //     }
  //     if (ayats["lang"] == "EN") {
  //       surah.trAyat.add(Ayat.fromJson(ayats));
  //     }
  //   }
  //
  //   print(response["count"] / 3);
  //
  //   return surah;
  // }
  //

  static Future getNamazTimings(City city) async {
    var parse = Uri.parse(ApiString.baseUrl);
    var uri = Uri.https(parse.authority, ApiString.prayerTime, {
      'lt': city.location.coordinates[0],
      'lg': city.location.coordinates[1],
      'm': "KARACHI",
      'a': "HANAFI",
      'tz': "5",
      'f': "24h",
    });
    // print(uri);
    dynamic response = await FecthApiService.get(uri: uri);


    return NamazTimeDay.fromJson(response);
  }
  ///ayat hardcoded through json
  static Future getAyatOfTheDay() async {
    try {
      var objList = a.ayat;
      var index = DateTime.now().day;
      index -= 1;
      var ayatOfTheDay = objList.elementAt(index);
      await WriteCache.setJson(key: "ayat_of_the_day", value: ayatOfTheDay);
      return AyatOfTheDay.fromJson(ayatOfTheDay);
    } on Exception catch (err) {
      print(
          "Something went wrong on RemoteServices -> AyatOfTheDayList() ${err}");
      throw Error();
    }
  }

  ///joke hardcoded through json
  static Future<JokeOfTheDay> getJokeOfTheDay() async {
    try {
      var objList = jokes.jokes;
      var index = DateTime.now().day - 1;
      index = index % objList.length; // Wrap index within the range of objList
      var jokeOfTheDay = objList[index];
      await WriteCache.setJson(key: "joke_of_the_day", value: jokeOfTheDay);
      return JokeOfTheDay.fromJson(jokeOfTheDay);
    } on Exception catch (err) {
      print("Something went wrong on RemoteServices -> getJokeOfTheDay() $err");
      throw Error();
    }
  }

  // static Future getJokeOfTheDay() async {
  //   try {
  //     var objList = jokes.jokes;
  //     var index = DateTime.now().day;
  //     index -= 1;
  //     var jokeOfTheDay = objList.elementAt(index);
  //     await WriteCache.setJson(key: "joke_of_the_day", value: jokeOfTheDay);
  //     return JokeOfTheDay.fromJson(jokeOfTheDay);
  //   } on Exception catch (err) {
  //     print(
  //         "Something went wrong on RemoteServices ->JokeOfTheDayList() ${err}");
  //     throw Error();
  //   }
  // }

//    Future getNewsFeed(String? sourceList, {String? responseString}) async {
//     var endpointUrl = ApiString.newsFeedUrl;
//     Map<String, String> queryParams = {
//       'sourcelist': 'EXPRESS_TRIBUNE_PK.NEWS.PAKISTAN.TEXT',
//     };
//     String queryString = Uri(queryParameters: queryParams).query;
//
//     var requestUrl = endpointUrl + '?' + queryString; // result
//     var response = await FecthApiService.get(uri: requestUrl as Uri);
//     print(response.body);
//
//   if (response.statusCode == 200) {
//       var data = json.decode(response.body);
//
//     List<dynamic> responseData = data['data'] as List<dynamic>;
//       return (responseData).map((i) => NewsFeed.fromJson(i)).toList();
//
//   }
//
//
// }
///News Api
  ///
  static  Future<List<news_feed.Data>>  fetchNewsData(String lang) async {



    final response = await http.get(Uri.parse(  lang == "ur"

        ? '${ApiString.newsFeedUrl}' + '${ApiString.urduNews}'
        : '${ApiString.englishNews}'));
//    final response = await http.get(Uri.parse(ApiString.newsFeedUrl+'sourcelist=AAJ_NEWS_PK.NEWS.TOPSTORIES.TEXT'));

    print(' news');
    print(response);


    if (response.statusCode == 200) {
        final decodedData = utf8.decode(response.bodyBytes);
        var data = json.decode(decodedData);
        print(data);
        //var data = json.decode(response.body);
        List<dynamic> responseData = data['data'] as List<dynamic>;
        final List<news_feed.Data> newsList = responseData.map((data) => news_feed.Data.fromJson(data)).toList();
        return newsList;


    } else {
      throw Exception('Failed to fetch data from the API');
    }
  }
///forex
  static  Future<List<forex.Data>>  getForexData() async {

    final response = await http.get(Uri.parse('https://ap-1.ixon.cc/api/v2/forex?clientid=10010&api_key=c4d3db743df74385b7e7&currency=usd,aed,gbp'));


    if (response.statusCode == 200) {
      final decodedData = utf8.decode(response.bodyBytes);
      var data = json.decode(decodedData);
      //var data = json.decode(response.body);
      List<dynamic> responseData = data['data'] as List<dynamic>;
      final List<forex.Data> forexList = responseData.map((data) => forex.Data.fromJson(data)).toList();
      return forexList;


    } else {
      throw Exception('Failed to fetch data from the API');
    }
  }


  ///verifyOtp
  static Future verifyOtp(String? number, String code) async {
    if (number!.isEmpty) {
      number = null;
    }
    var uri = Uri.https(ApiString.loginWithOtp, ApiString.OtpEndpoint, {
      'msisdn': '$number',
      'operator': 'Zong',
      'menu': "cureg_vkey",
      'key': code,
    });
    // print(uri);
    dynamic response = await FecthApiService.get(uri: uri);
    print(response);

    if (response[0]['status'] == 'failed') {
      return response[0]["desc"];
    }

    if (response == null) {
      return null;
    }

    await WriteCache.setJson(key: "auth_status_model", value: response[0]);

    return AuthStatusModel.fromJson(response[0]);
  }
  ///subscription
  static Future subscription(String? number, String token) async {
    const dt = '2020-09-17T12:59:43.377Z';

    // print(token);

    if (number!.isEmpty) {
      number = null;
    }
    Uri uri1 = Uri.https(ApiString.loginWithOtp, ApiString.OtpEndpoint, {
      'msisdn': '$number',
      'operator': 'Zong',
      'dt': dt,
      'menu': "subscription",
      'Authorization': "bearer+" + token,
    });
    Uri uri2 = Uri.parse(uri1.toString().replaceAll("%2B", "+"));
    Uri uri3 = Uri.parse(uri2.toString().replaceAll("%3A", ":"));

    print(uri3);

    dynamic response = await FecthApiService.get(uri: uri3);

    print('response $response');

    return response;
    // log(response.first);

    // return AuthStatusModel.fromJson(response.first);
  }
  ///checkStatus
  static Future checkStatus(String? number) async {
    if (number!.isEmpty) {
      number = null;
    }
    var uri = Uri.https(ApiString.loginWithOtp, ApiString.OtpEndpoint, {
      'msisdn': '$number',
      'operator': 'Zong',
      'menu': "is_expired",
    });
    await FecthApiService.get(uri: uri);
  }
  ///unSubscription
  static Future unSubscription(String? number) async {
    if (number!.isEmpty) {
      number = null;
    }
    var uri = Uri.https(ApiString.loginWithOtp, ApiString.OtpEndpoint, {
      'msisdn': '$number',
      'operator': 'Zong',
      'menu': "unsub_zong",
    });

    // print(uri);

    dynamic response = await FecthApiService.get(uri: uri);
    return response;
    // log(response.first);

    // return AuthStatusModel.fromJson(response.first);
  }
  /// loginWithOtp
  static Future loginWithOtp(String? number) async {
    if (number!.isEmpty) {
      number = null;
    }
    var uri = Uri.https(ApiString.loginWithOtp, ApiString.OtpEndpoint, {
      'msisdn': '$number',
      'operator': 'Zong',
      'menu': "cureg_ckey",
    });

    // print(uri);

    dynamic response = await FecthApiService.get(uri: uri);

    print(response);
    return response != null ? response[0]['status_text'] : null;
  }
}






