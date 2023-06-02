import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:jazzpowertoolsapp/app/controller/forex/forex_controller.dart';
import 'package:jazzpowertoolsapp/app/data/constant/route_string.dart';
import '../../../../data/constant/app_color.dart';
import '../../../../model/forex.dart';
import '../../../../services/remote_services.dart';
import '../../../../model/forex.dart' as for_ex;

class ForExchange extends StatefulWidget {
  const ForExchange({Key? key}) : super(key: key);

  @override
  State<ForExchange> createState() => _ForExchangeState();
}

class _ForExchangeState extends State<ForExchange> {
  List< for_ex.Data>? forex;
  bool isLoading = false;
  final forexController = Get.put(ForexScreenController());


  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ForexScreenController>(
        builder: (_) => Column(
          children: [
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  height: 150.h,
                  width: 390.w,
                  alignment: Alignment.center,
                  child: Text(
                    'Forex',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Jameel Noori Nastaleeq',
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.fontColorButton,
                    ),
                  ),
                  decoration: const BoxDecoration(
                    color: AppColor.red,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                ),

                SizedBox(
                  height: 30.h,
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: IconButton(

                    icon: const Icon(

                      Icons.arrow_back,
                     size: 20,
                       color: Colors.white,
                    ),
                    onPressed: () => Navigator.popAndPushNamed(context, RouteString.home),

                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Container(
                color: AppColor.white,
                height: 400.h,
                child: Align(
                  alignment: Alignment.center,
                  child:ListView.builder(
                    itemCount: forexController.forex.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        // Display name once at the top
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(

                            children: [
                               SizedBox(width: 20.0.w),
                              const Text(
                                'Name',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                               SizedBox(width: 60.0.w),
                              const Text(
                                'Buying',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                               SizedBox(width: 60.0.w),
                              const Text(
                                'Selling',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        final forexItem = forexController.forex[index - 1];
                        return ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(height: 10),
                              const SizedBox(width: 20.0),
                              Expanded(
                                child: Text(
                                  forexItem.name??"",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              Expanded(
                                child: Text(
                                  forexItem.buying??"",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20.0),
                              Expanded(
                                child: Text(
                                  forexItem.selling??"",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            // Handle item tap
                          },
                          // subtitle: Padding(
                          //   padding: const EdgeInsets.only(top: 20.0),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.end,
                          //     children: [
                          //       const SizedBox(width: 10.0),
                          //       Text(
                          //         forexController.forex.first.pubdate!,
                          //         style: const TextStyle(fontSize: 18),
                          //         overflow: TextOverflow.ellipsis,
                          //         maxLines: 1,
                          //       ),
                          //       const SizedBox(width: 8.0),
                          //     ],
                          //   ),
                          // ),
                        );
                      }
                    },
                  )
                      // Fallback widget while loading
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
