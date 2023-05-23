import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jazzpowertoolsapp/app/views/widgets/timer_class.dart';

import 'button_text2.dart';

class CountdownWidget extends StatelessWidget {
  final Duration duration;
  final Duration elapsed;
  final String next;
  final String time;

  const CountdownWidget({
  //  super.key,
    required this.duration,
    required this.elapsed,
    required this.next,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CountdownPainter(duration: duration, elapsed: elapsed),
      // size: Size.square(180.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonText2(
            text: "Next($next)",
            fontSize: 10.w,
          ),
          SizedBox(
            height: 5.h,
          ),
          ButtonText2(
            text: "$time",
            fontSize: 10.w,
          ),
          SizedBox(
            height: 5.h,
          ),
          ButtonText2(
            text:
                "${duration.toString().split(':')[0]}:${duration.toString().split(':')[1]}",
            fontSize: 10.w,
          ),
        ],
      ),
    );
  }
}
