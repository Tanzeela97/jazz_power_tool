class Forex {
  String? title;
  String? country;
  String? currency;
  String? type;
  List<Data>? data;
  bool? success;
  String? version;

  Forex(
      {this.title,
        this.country,
        this.currency,
        this.type,
        this.data,
        this.success,
        this.version});

  Forex.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    country = json['country'];
    currency = json['currency'];
    type = json['type'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    success = json['success'];
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = title;
    data['country'] = country;
    data['currency'] = currency;
    data['type'] = type;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = success;
    data['version'] = version;
    return data;
  }
}

class  Data {
  String? name;
  String? symbol;
  String? buying;
  String? selling;
  String? pubdate;

  Data({this.name, this.symbol, this.buying, this.selling, this.pubdate});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    symbol = json['symbol'];
    buying = json['buying'];
    selling = json['selling'];
    pubdate = json['pubdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['symbol'] = this.symbol;
    data['buying'] = this.buying;
    data['selling'] = this.selling;
    data['pubdate'] = this.pubdate;
    return data;
  }
}