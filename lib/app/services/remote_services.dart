
import 'dart:convert';

import '../data/json_data/constant_cities.dart' as c;

import '../data/constant/api_string.dart';
import '../model/city.dart';
import '../model/namaz_time_day.dart';
import '../model/news_feed.dart';
import 'fetch_api_service.dart';
import 'package:http/http.dart' as http;
class RemoteServices {
  static Future<List<City>> getCityList() async {
    try {
      var objList = await c.cities;
      // logger.d(objList);
      return objList.map<City>((e) => City.fromJson(e)).toList();
    } on Exception catch (err) {
      print("Something went wrong on RemoteServices -> GetCityList() ${err}");
      throw Error();
    }
  }

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
    // print(response);

    // if (response[0]['status'] == 'failed') {
    //   return null;
    // }

    return NamazTimeDay.fromJson(response);
  }

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

  static  Future<List<Data>>  fetchData() async {

    final response = await http.get(Uri.parse('https://ap-1.ixon.cc/api/v3/rdrss?sourcelist=EXPRESS_TRIBUNE_PK.NEWS.PAKISTAN.TEXT'));


      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        List<dynamic> responseData = data['data'] as List<dynamic>;
        final List<Data> newsList = responseData.map((data) => Data.fromJson(data)).toList();
        return newsList;


    } else {
      throw Exception('Failed to fetch data from the API');
    }
  }







}
