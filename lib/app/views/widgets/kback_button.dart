import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/constant/image_string.dart';

class KBackButton extends StatelessWidget {
  const KBackButton({

    this.function,
  });
  final function;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (function == null) {
          Navigator.pop(context);
          return;
        }
        function();
      },
      icon: Image(
        image: ImageString.leftArrow,
        height: 50.h,
        width: 50.w,
      ),
    );
  }
}
