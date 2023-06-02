import 'package:flutter/material.dart';

import '../data/constant/route_string.dart';
import '../views/screens/main_view/forex/forex.dart';
import '../views/screens/main_view/login/login.dart';
import '../views/screens/main_view/login/otp_verification.dart';
import '../views/screens/main_view/main_view.dart';
import '../views/screens/main_view/onboarding/onboarding_one.dart';
import '../views/screens/main_view/onboarding/onboarding_three.dart';
import '../views/screens/main_view/onboarding/onboarding_two.dart';
import '../views/screens/quiz/quiz_screen.dart';
import '../views/screens/quran/quran_screen.dart';
import '../views/screens/quran/surah_list_screen.dart';
import '../views/screens/video_page/video_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {


    switch (settings.name) {
      case RouteString.onboardingOne:
        return MaterialPageRoute(builder: (_) => OnboardingScreenOne());
      case RouteString.onboardingTwo:
        return MaterialPageRoute(builder: (_) => const OnboardingScreenTwo());
      case RouteString.onboardingThree:
        return MaterialPageRoute(builder: (_) => OnboardingScreenThree());


      case RouteString.home:
        return MaterialPageRoute(builder: (_) => const MainView());
      case RouteString.otpVerification:
        return MaterialPageRoute(builder: (_) =>  OtpVerification());
      case RouteString.login:
        return MaterialPageRoute(builder: (_) =>  Login());

      case RouteString.quiz:
        return MaterialPageRoute(builder: (_) => QuizPage());
      case RouteString.videoPage:
        return MaterialPageRoute(builder: (_) => const VideoPage());
      case RouteString.surahListScreen:
        return MaterialPageRoute(builder: (_) => const SurahListScreen());
      case RouteString.quranScreen:
        return MaterialPageRoute(builder: (_) => const QuranScreen());
      case RouteString.forexScreen:
        return MaterialPageRoute(builder: (_) =>  ForExchange());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

class RouteObservers {
  static RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
}
