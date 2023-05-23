class Location {
  List<String> coordinates;

  Location({required this.coordinates});

  factory Location.fromJson(Map<String, dynamic> json) {
    List<String> co = json['coordinates'].cast<String>();
    return Location(coordinates: co);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coordinates'] = this.coordinates;
    return data;
  }
}
