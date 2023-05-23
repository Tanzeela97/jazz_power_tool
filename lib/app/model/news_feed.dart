class NewsFeed {
  String? title;
  bool? success;
  Null? expiry;
  List<Data>? data;
  String? sApiVer;

  NewsFeed(
      {this.title, this.success, this.expiry, this.data, this.sApiVer});

  NewsFeed.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    success = json['success'];
    expiry = json['expiry'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    sApiVer = json['_api_ver'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['success'] = success;
    data['expiry'] = expiry;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['_api_ver'] = sApiVer;
    return data;
  }
}

class Data {
  String? sourceTitle;
  String? source;
  String? category;
  String? type;
  String? subType;
  String? lang;
  String? icon;
  String? title;
  String? description;
  String? link;
  String? image;
  String? pubdate;
  String? uuid;
  int? sno;
  Null? expiry;

  Data(
      {this.sourceTitle,
        this.source,
        this.category,
        this.type,
        this.subType,
        this.lang,
        this.icon,
        this.title,
        this.description,
        this.link,
        this.image,
        this.pubdate,
        this.uuid,
        this.sno,
        this.expiry});

  Data.fromJson(Map<String, dynamic> json) {
    sourceTitle = json['source_title'];
    source = json['source'];
    category = json['category'];
    type = json['type'];
    subType = json['sub_type'];
    lang = json['lang'];
    icon = json['icon'];
    title = json['title'];
    description = json['description'];
    link = json['link'];
    image = json['image'];
    pubdate = json['pubdate'];
    uuid = json['uuid'];
    sno = json['sno'];
    expiry = json['expiry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['source_title'] = this.sourceTitle;
    data['source'] = this.source;
    data['category'] = this.category;
    data['type'] = this.type;
    data['sub_type'] = this.subType;
    data['lang'] = this.lang;
    data['icon'] = this.icon;
    data['title'] = this.title;
    data['description'] = this.description;
    data['link'] = this.link;
    data['image'] = this.image;
    data['pubdate'] = this.pubdate;
    data['uuid'] = this.uuid;
    data['sno'] = this.sno;
    data['expiry'] = this.expiry;
    return data;
  }
}