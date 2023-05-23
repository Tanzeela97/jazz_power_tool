import 'package:flutter/material.dart';

import '../data/constant/route_string.dart';
import '../views/screens/main_view/main_view.dart';
import '../views/screens/quiz/quiz_screen.dart';
import '../views/screens/quran/quran_screen.dart';
import '../views/screens/quran/surah_list_screen.dart';
import '../views/screens/video_page/video_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    // final args = settings.arguments;
    // print(settings.name);

    switch (settings.name) {
      case RouteString.home:
        return MaterialPageRoute(builder: (_) => const MainView());
      case RouteString.quiz:
        return MaterialPageRoute(builder: (_) => QuizPage());
      case RouteString.videoPage:
        return MaterialPageRoute(builder: (_) => const VideoPage());
      case RouteString.surahListScreen:
        return MaterialPageRoute(builder: (_) => const SurahListScreen());
      case RouteString.quranScreen:
        return MaterialPageRoute(builder: (_) => const QuranScreen());

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
