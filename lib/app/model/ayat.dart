class Ayat {
  int surah;
  int ayat;
  String text;
  String lang;

  Ayat({
    required this.surah,
    required this.ayat,
    required this.lang,
    required this.text,
  });

  factory Ayat.fromJson(json) {
    return Ayat(
      surah: json["surah"],
      ayat: json["ayat"],
      text: json["qtext"],
      lang: json["lang"],
    );
  }
}
