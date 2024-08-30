class ProductDet {
  int? id;
  String? name;
  String? description;
  String? price;
  String? category;
  String? gender;
  String? brandName;
  int? userId;
  String? material;
  String? photo;
  late List<dynamic> sizes;
  int? quantity;
  int? inStock;
  String? createdAt;
  String? updatedAt;
  String? userName;
  //late List<Map<String,dynamic>> colors;
  late List<dynamic> colors;

  ProductDet(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.category,
      this.gender,
      this.brandName,
      this.userId,
      this.material,
      this.photo,
      required this.sizes,
      this.quantity,
      this.inStock,
      this.createdAt,
      this.updatedAt,
      this.userName,
      required this.colors});

  ProductDet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    category = json['category'];
    gender = json['gender'];
    brandName = json['brand_name'];
    userId = json['user_id'];
    material = json['material'];
    photo = json['photo'];
    sizes = json['sizes'] as List<dynamic>;
    quantity = json['quantity'];
    inStock = json['in_stock'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userName = json['user_name'];
    
    // if (json['colors'] != null) {
    //   // ignore: deprecated_member_use
    //   colors = <Colors>[];
    //   json['colors'].forEach((v) {
    //     colors.add(new Colors.fromJson(v));
    //   });
    // }
    colors = json['colors'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['category'] = this.category;
    data['gender'] = this.gender;
    data['brand_name'] = this.brandName;
    data['user_id'] = this.userId;
    data['material'] = this.material;
    data['photo'] = this.photo;
    data['sizes'] = this.sizes;
    data['quantity'] = this.quantity;
    data['in_stock'] = this.inStock;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['user_name'] = this.userName;

    data['color_names'] =
        this.colors.map((item) => Map<String, dynamic>.from(item)).toList();

    //List<Map<String, dynamic>> data = responseData

    // data['colors'] = this.colors;
    return data;
  }
}

class Colors {
  int? id;
  String? color;

  Colors({required this.id, required this.color});

  Colors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['color'] = this.color;
    return data;
  }
}
