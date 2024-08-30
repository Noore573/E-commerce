import 'package:http/http.dart' as http;
import 'dart:convert';

Myprofile myprofileFromJson(String str) => Myprofile.fromJson(json.decode(str));

String myprofileToJson(Myprofile data) => json.encode(data.toJson());

class Myprofile {
  Myprofile({
    // required this.id,
    required this.name,
    required this.email,
    required this.encodedPassword,
    // required this.details,
    // required this.number,
    // required this.address,
    // required this.wallet,
  });

  //final int id;
  final String name;
  final String email;
  final String encodedPassword;
  // final String details;
  // final int number;
  // final String address;
  // final int wallet;

  factory Myprofile.fromJson(Map<String, dynamic> json) => Myprofile(
        //id: json["id"],

        name: json['data[name]'],
        email: json["email"],
        encodedPassword: json["encoded password"],
        // details: json["details"],
        // number: json["number"],
        // address: json["address"],
        // wallet: json["wallet"],
      );

  Map<String, dynamic> toJson() => {
        //"id": id,
        "name": name,
        "email": email,
        "encoded password": encodedPassword,
        // "details": details,
        // "number": number,
        // "address": address,
        // "wallet": wallet,
      };
}
