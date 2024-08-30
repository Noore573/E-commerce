// class WishList {
//   List<Wishlist> wishlist;

//   WishList({this.wishlist});

//   WishList.fromJson(Map<String, dynamic> json) {
//     if (json['wishlist'] != null) {
//       wishlist = new List<Wishlist>();
//       json['wishlist'].forEach((v) {
//         wishlist.add(new Wishlist.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.wishlist != null) {
//       data['wishlist'] = this.wishlist.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Wishlist {
//   int id=1;
//   String name="";
//   String description="";
//   String price="";
//   String category="";
//   String gender="";
//   String brandName="";
//   int userId;
//   String material;
//   String photo;
//   String sizes;
//   int quantity;
//   int inStock;
//   String createdAt;
//   String updatedAt;
//   Pivot pivot;

//   Wishlist(
//       {this.id,
//       this.name,
//       this.description,
//       this.price,
//       this.category,
//       this.gender,
//       this.brandName,
//       this.userId,
//       this.material,
//       this.photo,
//       this.sizes,
//       this.quantity,
//       this.inStock,
//       this.createdAt,
//       this.updatedAt,
//       this.pivot});

//   Wishlist.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     description = json['description'];
//     price = json['price'];
//     category = json['category'];
//     gender = json['gender'];
//     brandName = json['brand_name'];
//     userId = json['user_id'];
//     material = json['material'];
//     photo = json['photo'];
//     sizes = json['sizes'];
//     quantity = json['quantity'];
//     inStock = json['in_stock'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['description'] = this.description;
//     data['price'] = this.price;
//     data['category'] = this.category;
//     data['gender'] = this.gender;
//     data['brand_name'] = this.brandName;
//     data['user_id'] = this.userId;
//     data['material'] = this.material;
//     data['photo'] = this.photo;
//     data['sizes'] = this.sizes;
//     data['quantity'] = this.quantity;
//     data['in_stock'] = this.inStock;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.pivot != null) {
//       data['pivot'] = this.pivot.toJson();
//     }
//     return data;
//   }
// }
// list<wishlist<list<products>
// class Pivot {
//   int userId;
//   int productId;

//   Pivot({this.userId, this.productId});

//   Pivot.fromJson(Map<String, dynamic> json) {
//     userId = json['user_id'];
//     productId = json['product_id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['user_id'] = this.userId;
//     data['product_id'] = this.productId;
//     return data;
//   }
// }
