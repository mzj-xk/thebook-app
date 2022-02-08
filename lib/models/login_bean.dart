class LoginBean {
  String? code;
  String? msg;
  Data? data;

  LoginBean({this.code, this.msg, this.data});

  LoginBean.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? sex;
  String? password;
  String? email;
  int? block;

  Data({this.id, this.name, this.sex, this.password, this.email, this.block});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sex = json['sex'];
    password = json['password'];
    email = json['email'];
    block = json['block'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['sex'] = sex;
    data['password'] = password;
    data['email'] = email;
    data['block'] = block;
    return data;
  }
}
