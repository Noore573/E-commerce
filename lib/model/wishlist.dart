
import 'dart:convert';
import 'package:project2/Services/wishlist_services.dart';
List<Wishlist> wishlistFromJson(String str) => List<Wishlist>.from(json.decode(str).map((x) => Wishlist.fromJson(x)));

String wishlistToJson(List<Wishlist> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Wishlist {
    Wishlist({
        required this.id,
        required this.name,
        required this.email,
        this.details,
        required this.number,
        required this.address,
    });

    int id;
    String name;
    String email;
    String? details;
    int number;
    String address;

    factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        details: json["details"],
        number: json["number"],
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "details": details,
        "number": number,
        "address": address,
    };
}
