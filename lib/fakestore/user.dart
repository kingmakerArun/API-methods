class user {
  int? status;
  String? message;
  List<Data>? data;

  user({this.status, this.message, this.data});

  user.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? role;
  String? sId;
  String? name;
  String? email;
  // int? number;
  String? password;
  String? createdAt;
  String? updatedAt;
  String? lastLoginAt;

  Data(
      {this.role,
        this.sId,
        this.name,
        this.email,
        // this.number,
        this.password,
        this.createdAt,
        this.updatedAt,
        this.lastLoginAt});

  Data.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    // number = json['number'];
    password = json['password'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    lastLoginAt = json['lastLoginAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role'] = this.role;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    // data['number'] = this.number;
    data['password'] = this.password;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['lastLoginAt'] = this.lastLoginAt;
    return data;
  }
}
