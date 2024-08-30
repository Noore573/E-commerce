import 'dart:convert';
import 'dart:io';

class UpProfile {
  UpProfile({
    required this.id,
    required this.name,
    this.details,
    required this.phone,
    required this.address,
    required this.created_at,
    required this.contact,
  //  this.pimage,
    //required this.photo,
  });

  int id;
  String name;
  String? details;
  String phone;
  String address;
  String created_at;
  String contact;
  //File photo;

  

  factory UpProfile.fromJson(Map<String, dynamic> json) => UpProfile(
        id: json["id"],
        //photo: File(json["photo"]),
        name: json["name"],
        details: json["name"],
        phone: json["phone"],
        address: json["address"],
        contact: json["name"],
        created_at: json["created_at"],
      );

  // Map<String, dynamic> toJson()  {
  //     final Map<String,dynamic>data=new Map<String,dynamic>();
  //     data["id"]=id;
  //     data["name"]= name;
  //     data["email"]= email;
  //     data["details"]= details;
  //     data["phone"]= phone;
  //     data["address"]= address;
  //     return data;
  //}
}
