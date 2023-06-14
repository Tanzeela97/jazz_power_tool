import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../data/constant/app_color.dart';
import '../../../../model/news_feed.dart';

class News extends StatelessWidget {
  List<Data>? newsFeeds;

   News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        color: AppColor.white,
        height: 400.0,
        child: Align(
          alignment: Alignment.center,
          child: ListView.builder(
            itemCount: newsFeeds?.length,
            itemBuilder: (context, index) {
              final newsItem = newsFeeds?[index];

              return ListTile(
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
                        image: newsItem?.image ?? "",
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

                    // ClipRRect(
                    //   borderRadius:
                    //   const BorderRadius.all(Radius.circular(10.0)),
                    //   child:FadeInImage.assetNetwork(
                    //     placeholder: 'assets/images/favicon.png', // Replace with your placeholder image asset
                    //     image: newsItem?.image ?? "",
                    //     width: 100.0,
                    //     height: 80.0,
                    //     fit: BoxFit.cover,
                    //
                    //   ),
                    // ),
                    const SizedBox(width: 20.0),
                    Expanded(
                      child: Text(
                        newsItem?.title ?? "...",
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Jameel Noori Nastaleeq',
                        ),
                      ),
                    ),
                    // FadeInImage(
                    //   placeholder: const AssetImage(
                    //       'assets/images/favicon.png'),
                    //   image: NetworkImage(newsItem?.icon ?? ''),
                    //   width: 50.0,
                    //   height: 50.0,
                    //   fit: BoxFit.cover,
                    //   imageErrorBuilder: (_, __, ___) =>
                    //       Image.asset('assets/images/favicon.png'),
                    // ),
                    // FadeInImage(
                    //   placeholder: const NetworkImage(
                    //       'assets/images/favicon.png'),
                    //   image: NetworkImage(newsItem?.icon ?? ''),
                    //   width: 50.0,
                    //   height: 50.0,
                    //   fit: BoxFit.cover,
                    // ),
                    const SizedBox(width: 8.0),
                  ],
                ),
                onTap: () {
                  // Handle item tap
                },
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
                        (newsItem?.pubdate ?? "").substring(0, 20),
                        style: const TextStyle(fontSize: 18),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      const SizedBox(width: 120.0),
                      Image.network(
                        newsItem?.icon ?? '',
                        width: 40.0,
                        height: 40.0,
                        fit: BoxFit.contain,
                        errorBuilder: (_, __, ___) =>
                            Image.asset('assets/images/jazz_logo.png'),
                      ),
                      const SizedBox(width: 8.0),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
///news
//   Directionality(
//                   textDirection: lang == "ur-PK"? TextDirection.ltr:TextDirection.rtl,
//                   child: Container(
//                     color: isDarkMode ? AppColor.black : AppColor.white,
//                   // color: AppColor.white,
//                     height: 400.0,
//                     child: Align(
//                       alignment: Alignment.center,
//                       child: ListView.builder(
//                         itemCount:
//                             showAllItems ? newsFeeds?.length : maxVisibleItems,
//                         itemBuilder: (context, index) {
//                           final newsItem = newsFeeds?[index];
//
//                           return ListTile(
//                             contentPadding:
//                                 const EdgeInsets.symmetric(horizontal: 16.0),
//                             title: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 const SizedBox(height: 10),
//                                 ClipRRect(
//                                   borderRadius: BorderRadius.circular(10.0),
//                                   child: FadeInImage.assetNetwork(
//                                     placeholder: 'assets/images/jazz_logo.png',
//                                     image: newsItem?.image ?? "",
//                                     width: 120.0,
//                                     height: 120.0,
//                                     fit: BoxFit.cover,
//                                     imageErrorBuilder:
//                                         (context, exception, stackTrace) {
//                                       return Image.asset(
//                                         'assets/images/jazz_logo.png',
//                                         width: 120.0,
//                                         height: 100.0,
//                                         fit: BoxFit.cover,
//                                       );
//                                     },
//                                   ),
//                                 ),
//                                 const SizedBox(width: 20.0),
//                                 Expanded(
//                                   child: Text(
//                                     newsItem?.title ?? "...",
//                                     textDirection: TextDirection.rtl,
//                                     style:  TextStyle(
//                                       color: isDarkMode ? AppColor.white : AppColor.black,
//                                       fontSize: 18,
//                                       fontFamily: lang == "ur-PK"
//                                           ? "Jameel Noori Nastaleeq"
//                                           : "Poppins",
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(width: 8.0),
//                               ],
//                             ),
//                             onTap: () {
//                              Navigator.popAndPushNamed(context, RouteString.newsDescription);
//                             },
//                             subtitle: Padding(
//                               padding: const EdgeInsets.only(top: 8.0),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [
//                                   const SizedBox(width: 20.0),
//                                   const Icon(Icons.access_time),
//                                   const SizedBox(width: 10.0),
//                                   Text(
//                                     //(14,20)
//                                     (newsItem?.pubdate ?? "").length >= 20
//                                         ? (newsItem?.pubdate ?? "")
//                                             .substring(14, 20)
//                                         : (newsItem?.pubdate ?? ""),
//                                     style:  TextStyle(fontSize: 18,color: isDarkMode ? AppColor.white : AppColor.black,
//                                       fontFamily: lang == "ur-PK"
//                                       ? "Jameel Noori Nastaleeq"
//                                       : "Poppins",),
//                                     overflow: TextOverflow.ellipsis,
//
//                                     maxLines: 3,
//
//                                   ),
//                                   const SizedBox(width: 120.0),
//                                   Image.network(
//                                     newsItem?.icon ?? '',
//                                     width: 40.0,
//                                     height: 40.0,
//                                     fit: BoxFit.contain,
//                                     errorBuilder: (_, __, ___) => Image.asset(
//                                         'assets/images/jazz_logo.png'),
//                                   ),
//                                   const SizedBox(width: 8.0),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//                 Visibility(
//                   visible: (newsFeeds?.isNotEmpty ?? false) &&
//                       (newsFeeds!.length > maxVisibleItems),
//                   child: Container(
//                     width: double.infinity,
//                     color: isDarkMode ? AppColor.black : AppColor.white,
//                     //color: AppColor.white,
//                     child: TextButton(
//                       onPressed: () {
//                         setState(() {
//                           showAllItems = !showAllItems;
//                         });
//                       },
//                       child: Text(
//                         showAllItems ? "less".tr : 'more'.tr,
//                         style: const TextStyle(color: AppColor.red),
//                       ),
//                     ),
//                   ),
//                 ),