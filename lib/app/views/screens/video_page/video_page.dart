import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/constant/app_color.dart';
import '../../../data/constant/image_string.dart';
import '../../widgets/ktext1.dart';


class VideoPage extends StatefulWidget {
  const VideoPage();

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.white,
        foregroundColor: AppColor.fontColorButton,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Trending',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.inter(
            fontSize: 19.w,
            fontWeight: FontWeight.w500,
            // color: AppColor.fontColorButton,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            // color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: AppColor.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: SizedBox(
          width: 390.h,
          child: Column(
            children: [
              Container(
                width: 390.w,
                padding: EdgeInsets.only(bottom: 10.h),
                decoration: BoxDecoration(
                  color: AppColor.grey,
                  borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                ),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 390.w,
                          height: 181.h,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.sp)),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            child: Image(
                              image: ImageString.faviconAppbar,
                              width: 106.w,
                              height: 73.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          width: 60.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            shape: BoxShape.circle,
                            // borderRadius:
                            //     BorderRadius.all(Radius.circular(12.sp)),
                          ),
                          alignment: Alignment.center,
                          child: const FaIcon(
                            FontAwesomeIcons.play,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      width: 390.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 330.w,
                            padding: EdgeInsets.symmetric(
                              horizontal: 15.w,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                KText1(
                                  text: "Masail",
                                  fontSize: 20.w,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                KText1(
                                  text: "Mojuda Mahine k Bayanat",
                                  fontSize: 18.w,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 10.h),
                              child: const Image(
                                image: ImageString.favoriteIcon,
                                // color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              // HeaderTile(color: color, title: "related_news".tr),
              SizedBox(
                height: 12.h,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Center(
                        // child: Tile02(
                        //   color: color,
                        //   news: News(
                        //       title: 'telethon'.tr,
                        //       thumbnail: 'assets/telethon.png',
                        //       views: '106.4K'.tr,
                        //       latest: 'A Day Ago'.tr,
                        //       source: 'pakistan'.tr,
                        //       favourites: '106.4K'.tr),
                        //   source: false,
                        // ),
                        );
                  }),
              SizedBox(
                height: 15.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
