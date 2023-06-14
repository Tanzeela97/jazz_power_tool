class JokeOfTheDay {
  String? english;
  String? urdu;

  JokeOfTheDay({required this.english, required this.urdu});

  JokeOfTheDay.fromJson(Map<String, dynamic> json) {
    english = json['english'] ?? "";
    urdu = json['urdu'] ?? "";
  }
}
