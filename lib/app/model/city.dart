import 'package:jazzpowertoolsapp/app/model/location.dart';

class City {
  Location location;
  String sId;
  String name;
  String sort;

  City(
      {required this.location,
      required this.sId,
      required this.name,
      required this.sort});

  factory City.fromJson(Map<String, dynamic> json) {
    var loc =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    return City(
        location: loc!,
        sId: json['_id'],
        name: json['name'],
        sort: json['sort']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['sort'] = this.sort;
    return data;
  }
}
