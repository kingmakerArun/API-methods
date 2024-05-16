class Categories {
  List<Data>? data;
  // int? status;
  String? message;


  // this.status
  Categories({this.data,  this.message});

  Categories.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    // status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    // data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  List<String>? products;
  String? sId;
  String? name;
  String? slug;

  Data({this.products, this.sId, this.name, this.slug});

  Data.fromJson(Map<String, dynamic> json) {
    products = json['products'].cast<String>();
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['products'] = this.products;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}
