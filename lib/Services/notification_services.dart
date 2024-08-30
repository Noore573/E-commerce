import 'dart:convert';
import 'dart:math';

import '../server.dart';
import 'package:http/http.dart' as http;

class NotificationServices {
  Future<List<dynamic>> getnotifserve(String token, String cookies) async {
    var urlatv = Uri.parse(ServerConfig.domainNameServer + ServerConfig.notif);
    var response = await http.get(
      urlatv,
      headers: {
        "Accept": "application/json",
        'Cookie': '$cookies',
        "Authorization": "Bearer $token",
      },
    );
    print(response.statusCode);
    //print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      //Map<dynamic, dynamic> wl = jsonResponse;
      List<dynamic> wl = jsonResponse;

      print(wl);
      return wl;
    } else {
      List<dynamic> wl = [];
      return wl;
    }
  }
    Future<bool> markasreadserve(String index, String token, String cookies) async {
    //print(product.name);
    var urlgetpro = Uri.parse(
        ServerConfig.domainNameServer + ServerConfig.notif + '/$index/mark-as-read');
    print(urlgetpro);
    var response = await http.post(
      urlgetpro,
      headers: {
        "Authorization": "Bearer $token",
        'Cookie': '$cookies',
        "Content-Type": 'application/json',
        "Accept": "application/json",
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print(response.body);
      return true;
    } else if (response.statusCode == 404) {
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      return false;
    } else {
      print("what??");
      return false;
    }
  }
}
