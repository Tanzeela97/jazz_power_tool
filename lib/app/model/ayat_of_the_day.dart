class AyatOfTheDay {
  String? english;
  String? urdu;

  AyatOfTheDay({required this.english, required this.urdu});

  AyatOfTheDay.fromJson(Map<String, dynamic> json) {
    english = json['english'] ?? "";
    urdu = json['urdu'] ?? "";
  }
}
