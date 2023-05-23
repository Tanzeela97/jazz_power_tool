class NamazTimeDay {
  String imsak;
  String fajr;
  String sunrise;
  String dhuhr;
  String asr;
  String sunset;
  String maghrib;
  String isha;
  String midnight;
  // String lat;
  // String long;
  // String calcMethod;
  String asrMethod;
  String timeFormat;
  String dateStr;

  String hijriStr;

  // int hijriOffset;

  NamazTimeDay({
    required this.imsak,
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.sunset,
    required this.maghrib,
    required this.isha,
    required this.midnight,
    // required this.lat,
    // required this.long,
    // required this.calcMethod,
    required this.asrMethod,
    required this.timeFormat,
    required this.dateStr,
    // required this.date,
    required this.hijriStr,
    // required this.hijriDate,
    // required this.hijriOffset,
  });

  factory NamazTimeDay.fromJson(Map<String, dynamic> json) {
    return NamazTimeDay(
      imsak: json['imsak'],
      fajr: json['fajr'],
      sunrise: json['sunrise'],
      dhuhr: json['dhuhr'],
      asr: json['asr'],
      sunset: json['sunset'],
      maghrib: json['maghrib'],
      isha: json['isha'],
      midnight: json['midnight'],
      // lat: json['lat'],
      // long: json['long'],
      // calcMethod: json['calc_method'],
      asrMethod: json['asr_method'],
      timeFormat: json['time_format'],
      dateStr: json['date_str'],
      hijriStr: json['hijri_str'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imsak'] = imsak;
    data['fajr'] = fajr;
    data['sunrise'] = sunrise;
    data['dhuhr'] = dhuhr;
    data['asr'] = asr;
    data['sunset'] = sunset;
    data['maghrib'] = maghrib;
    data['isha'] = isha;
    data['midnight'] = midnight;
    // data['lat'] = this.lat;
    // data['long'] = this.long;
    // data['calc_method'] = this.calcMethod;
    data['asr_method'] = asrMethod;
    data['time_format'] = timeFormat;
    data['date_str'] = dateStr;
    data['hijri_str'] = hijriStr;
    return data;
  }
}
