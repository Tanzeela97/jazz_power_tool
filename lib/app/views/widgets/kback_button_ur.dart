import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/constant/image_string.dart';

class KBackBtnUrdu extends StatelessWidget {
  const KBackBtnUrdu({
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
      icon: const Icon(
        Icons.arrow_back,
        size: 20,
      ),
    );
  }
}
