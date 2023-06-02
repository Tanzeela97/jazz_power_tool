import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/constant/app_color.dart';
import '../../widgets/button_text2.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _totalScore = 0;
  int _currentQuestion = 0;
  List<Map<String, Object>> _questions = [
    {
      'question': 'What is the capital of France?',
      'answers': [
        {'text': 'Paris', 'score': 10},
        {'text': 'Madrid', 'score': 0},
        {'text': 'Rome', 'score': 0},
        {'text': 'London', 'score': 0},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.red,
        foregroundColor: AppColor.fontColorButton,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Quiz Game',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.inter(
            fontSize: 19.sp,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 120.w,
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColor.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ButtonText2(fontWeight: FontWeight.w300,
                    text: 'Score: $_totalScore',
                    fontSize: 20.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                alignment: Alignment.center,
                child: Text(
                  _questions[_currentQuestion]['question'].toString(),
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColor.red,
                  ),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              SizedBox(
                height: 400.h,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 25.h,
                    crossAxisSpacing: 25.w,
                    childAspectRatio:
                        160.w / 160.h, // set aspect ratio to 160.w / 60.h
                    children: [
                      ...(_questions[_currentQuestion]['answers']
                              as List<Map<String, Object>>)
                          .map((answer) {
                        return Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColor.red,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ButtonText2(
                            fontWeight: FontWeight.w300,
                            text: answer['text'].toString(),
                            fontSize: 26.sp,
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ),
              // Align(
              //   alignment: Alignment.center,
              //   child: Container(
              //     width: 160.w,
              //     padding: EdgeInsets.symmetric(vertical: 15.h),
              //     alignment: Alignment.center,
              //     decoration: BoxDecoration(
              //       color: AppColor.green,
              //       borderRadius: BorderRadius.circular(8),
              //     ),
              //     child: ButtonText2(
              //       text: 'Submit',
              //       fontSize: 24.sp,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
