class AuthStatusModel {
  String? desc;
  String? status;
  String? token;
  String? flag;

  AuthStatusModel({this.desc, this.status, this.token, this.flag});

  AuthStatusModel.fromJson(Map<String, dynamic> json) {
    desc = json['desc'];
    status = json['status'];
    token = json['token'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['desc'] = desc;
    data['status'] = status;
    data['token'] = token;
    data['flag'] = flag;
    return data;
  }
}
