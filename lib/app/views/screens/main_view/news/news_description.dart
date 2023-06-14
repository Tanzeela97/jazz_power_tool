import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:jazzpowertoolsapp/app/controller/home_screen/home_screen_controller.dart';
import 'package:jazzpowertoolsapp/app/data/constant/app_color.dart';
import 'package:jazzpowertoolsapp/app/model/news_feed.dart' as news;

import '../../../../data/constant/route_string.dart';
import '../../../../services/remote_services.dart';

class NewsDescriptiom extends StatefulWidget {
  NewsDescriptiom({Key? key}) : super(key: key);

  @override
  State<NewsDescriptiom> createState() => _NewsDescriptiomState();
}

class _NewsDescriptiomState extends State<NewsDescriptiom> {

  bool isLoading = false;
 // String lang = Get.locale!.toLanguageTag();
  final homeController = Get.put(HomeScreenController(const bool.fromEnvironment('dart.library.js_util')));

  void initState() {
    homeController.setWeb(kIsWeb);

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.red,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  size: 20,
                  color: Colors.grey,
                ),
                onPressed: () =>
                    Navigator.popAndPushNamed(context, RouteString.home),
              )),
          body: GetBuilder<HomeScreenController>(
            builder: (_) => ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  final newsItem = homeController.newsList.first;
                  //final newsItem = newsList?[index];
                  return Container(
                    height: 700,
                    width: double.infinity,
                    child: Card(
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                            child: Image.network(newsItem.image ?? "",
                                height: 150,
                                width: double.infinity,
                                fit: BoxFit.cover, errorBuilder:
                                    (BuildContext context, Object exception,
                                        StackTrace? stackTrace) {
                              return Image.asset(
                                'assets/images/jazz_logo.png',
                                // Path to your placeholder image asset
                                height: 150,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              );
                            }),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  newsItem.title ?? "",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  newsItem.description ?? "",
                                  style: const TextStyle(fontSize: 18.0),
                                  maxLines: 8,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          ListTile(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(height: 10),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: FadeInImage.assetNetwork(
                                    placeholder: 'assets/images/jazz_logo.png',
                                    image: newsItem.image ?? "",
                                    width: 120.0,
                                    height: 120.0,
                                    fit: BoxFit.cover,
                                    imageErrorBuilder:
                                        (context, exception, stackTrace) {
                                      return Image.asset(
                                        'assets/images/jazz_logo.png',
                                        width: 120.0,
                                        height: 100.0,
                                        fit: BoxFit.cover,
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(width: 20.0),
                                Expanded(
                                  child: Text(
                                    newsItem.title ?? "...",
                                    textDirection: TextDirection.rtl,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontFamily: 'Jameel Noori Nastaleeq',
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8.0),
                              ],
                            ),
                            // onTap: () {
                            //   Navigator.popAndPushNamed(
                            //       context, RouteString.newsDescription);
                            // },
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const SizedBox(width: 20.0),
                                  const Icon(Icons.access_time),
                                  const SizedBox(width: 10.0),
                                  Text(
                                    //(14,20)
                                    (newsItem.pubdate ?? "").length >= 20
                                        ? (newsItem.pubdate ?? "")
                                            .substring(14, 20)
                                        : (newsItem.pubdate ?? ""),
                                    style: const TextStyle(fontSize: 18),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                  const SizedBox(width: 120.0),
                                  Image.network(
                                    newsItem.icon ?? '',
                                    width: 40.0,
                                    height: 40.0,
                                    fit: BoxFit.contain,
                                    errorBuilder: (_, __, ___) => Image.asset(
                                        'assets/images/jazz_logo.png'),
                                  ),
                                  const SizedBox(width: 8.0),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )),
    );
  }
}
