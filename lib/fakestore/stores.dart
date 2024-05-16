class stores {
  // String? status;
  // String? data;
  String? message;
  // this.status, this.data,

  stores({ this.message});

  stores.fromJson(Map<String, dynamic> json) {
    // status = json['status'];
    // data = (json['data'] != null ? new Data.fromJson(json['data']) : null) as String?;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['status'] = this.status;
    // if (this.data != null) {
    //   data['data'] = this.data!.toJson();
    // }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? sId;
  String? title;
  // int? price;
  // Category? category;
  // Null? description;
  // CreatedBy? createdBy;
  String? createdAt;
  String? updatedAt;
  String? slug;

  Data(
      {this.sId,
        this.title,
        // this.price,
        // this.category,
        // this.description,
        // this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.slug});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    // price = json['price'];
    // category = json['category'];
    // description = json['description'];
    // createdBy = json['createdBy'] ;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    // data['price'] = this.price;
    // data['category'] = this.category;
    //  if (this.category != null) {
    //   data['category'] = this.category!.toJson();
    //  }
    // data['description'] = this.description;
    // data['createdBy'] = this.createdBy;
    // if (this.createdBy != null) {
    //   data['createdBy'] = this.createdBy!.toJson();
    // }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['slug'] = this.slug;
    return data;
  }
}

class Category {
  String? sId;
  String? name;
  String? slug;

  Category({this.sId, this.name, this.slug});

  Category.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}

class CreatedBy {
  String? role;
  String? sId;
  String? name;

  CreatedBy({this.role, this.sId, this.name});

  CreatedBy.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role'] = this.role;
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}
