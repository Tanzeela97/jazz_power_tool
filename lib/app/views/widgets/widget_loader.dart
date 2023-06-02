import 'package:flutter/material.dart';
import 'package:jazzpowertoolsapp/app/data/constant/app_color.dart';

class WidgetLoading extends StatelessWidget {
  const WidgetLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(

      child: CircularProgressIndicator(color: AppColor.red),
    );
  }
}
