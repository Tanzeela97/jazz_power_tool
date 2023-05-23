import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/constant/image_string.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 60.h),
      child: Center(
        // child: Image(
        //   image: ImageString.appBarLogo,
        //   width: 210.w,
        //   height: 23.h,
        // ),
        child: Text('Jazz Power Tool',),
      ),
    );
  }
}
