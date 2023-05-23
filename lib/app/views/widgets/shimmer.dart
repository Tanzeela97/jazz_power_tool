import 'package:flutter/material.dart';


class CustomShimmer extends StatefulWidget {
  const CustomShimmer();

  @override
  State<CustomShimmer> createState() => _CustomShimmerState();
}

class _CustomShimmerState extends State<CustomShimmer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: SingleChildScrollView(
        //   child: Container(
        //     width: double.infinity,
        //     // height: Get.height,
        //     padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 15.0.h),
        //     child: Column(
        //       mainAxisSize: MainAxisSize.max,
        //       children: <Widget>[
        //         Expanded(
        //           child: Shimmer.fromColors(
        //             baseColor: Color(0xffAEAEAE),
        //             highlightColor: Colors.white,
        //             child: ListView.builder(
        //               itemBuilder: (_, __) => Padding(
        //                 padding: EdgeInsets.only(bottom: 8.h),
        //                 child: Container(
        //                   padding: EdgeInsets.all(10.sp),
        //                   child: Row(
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     children: <Widget>[
        //                       Container(
        //                         width: 80.0.w,
        //                         height: 80.0.h,
        //                         color: Colors.white,
        //                       ),
        //                       SizedBox(
        //                         width: 15.h,
        //                       ),
        //                       Expanded(
        //                         child: Column(
        //                           crossAxisAlignment: CrossAxisAlignment.start,
        //                           children: <Widget>[
        //                             Container(
        //                               width: double.infinity,
        //                               height: 10..h,
        //                               color: Colors.white,
        //                             ),
        //                             Padding(
        //                               padding:
        //                                   EdgeInsets.symmetric(vertical: 2.w),
        //                             ),
        //                             Container(
        //                               width: double.infinity,
        //                               height: 10.h,
        //                               color: Colors.white,
        //                             ),
        //                             SizedBox(
        //                               height: 10.h,
        //                             ),
        //                             Container(
        //                               width: 40.w,
        //                               height: 10.h,
        //                               color: Colors.white,
        //                             ),
        //                           ],
        //                         ),
        //                       )
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //               itemCount: 6,
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        );
  }
}
