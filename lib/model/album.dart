import 'package:http/http.dart' as http;
import 'dart:convert';
class Album {
  final int name;
  final String address;

  const Album({required this.name, required this.address});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      name: json['name'],
      address: json['address'],
    );
  }
}