import 'dart:convert';

import '../server.dart';

import 'package:http/http.dart' as http;

class OrderServices {
  Future<List<dynamic>> getallorders(
      int id, String cookies, String token) async {
    var urlgwl = Uri.parse(
        ServerConfig.domainNameServer + ServerConfig.gaorder + '/$id');
    print(urlgwl);
    var response = await http.get(urlgwl, headers: {
      "Accept": "application/json",
      'Cookie': '$cookies',
      "Authorization": "Bearer $token",
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      List<dynamic> checkedResponses =
          jsonResponse.where((response) => response["checked"] == 1).toList();
      print(checkedResponses);
      return checkedResponses;
    } else {
      //throw new Exception("no favs!");
      List<dynamic> allorders = [];
      return allorders;
    }
  }

  Future<List<dynamic>> getalluncheckedorders(
      int id, String cookies, String token) async {
    var urlgwl = Uri.parse(
        ServerConfig.domainNameServer + ServerConfig.gaorder + '/$id');
    print(urlgwl);
    var response = await http.get(urlgwl, headers: {
      "Accept": "application/json",
      'Cookie': '$cookies',
      "Authorization": "Bearer $token",
    });
    print(response.statusCode);
    List<dynamic> allorders = [];
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      // if (jsonResponse['checked'] == 1) {
      //   allorders = jsonResponse;

      //   print(allorders);
      // }
      // return allorders;
      List<dynamic> checkedResponses =
          jsonResponse.where((response) => response["checked"] == 0).toList();
      print(checkedResponses);
      return checkedResponses;
    } else {
      //throw new Exception("no favs!");
      List<dynamic> allorders = [];
      return allorders;
    }
  }
  Future<bool> addtocart(String product_id, String color_id, String size,
      String quantity, String token, String cookies) async {
    var urlatv = Uri.parse(ServerConfig.domainNameServer + ServerConfig.cart);
    var response = await http.post(urlatv, headers: {
      "Accept": "application/json",
      'Cookie': '$cookies',
      "Authorization": "Bearer $token",
    }, body: {
      'product_id': '$product_id',
      'color_id': '$color_id',
      'size': '$size',
      'quantity': '$quantity',
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  
}
