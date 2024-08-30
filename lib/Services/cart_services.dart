import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:project2/model/product.dart';
import 'package:project2/model/user.dart';
import 'package:project2/server.dart';
import 'dart:convert';
import 'dart:io';
import "package:project2/controllers/SignUp_Controller.dart";

class CartServices {
  Future<List<dynamic>> getcartlist(String cookies, String token) async {
    print('ff ${token} ');
    print('ff $cookies');
    var urlgwl = Uri.parse(ServerConfig.domainNameServer + ServerConfig.cart);
    var response = await http.get(urlgwl, headers: {
      "Accept": "application/json",
      'Cookie': '$cookies',
      "Authorization": "Bearer $token",
    });
    print(response.statusCode);

    //print(response.body);
    //debugPrint(response.body);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      List<dynamic> cl = jsonResponse['cart_items'];
      return cl;
      
    } else {
      print(response.statusCode);
      throw new Exception("empty");
    }
  }
    Future<String> getcartp(String cookies, String token) async {
    print('ff ${token} ');
    print('ff $cookies');
    var urlgwl = Uri.parse(ServerConfig.domainNameServer + ServerConfig.cart);
    var response = await http.get(urlgwl, headers: {
      "Accept": "application/json",
      'Cookie': '$cookies',
      "Authorization": "Bearer $token",
    });
    print(response.statusCode);

    //print(response.body);
    //debugPrint(response.body);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      dynamic tp = jsonResponse['total_price'];

      print(tp);
      return tp.toString();
      
    } else {
      print(response.statusCode);
      //throw new Exception("empty");
      return "";

    }
  }

  Future<bool> deletecart(int index, String token, String cookies) async {
    //print(product.name);
    var urlgetpro = Uri.parse(
        ServerConfig.domainNameServer + ServerConfig.cart + '/$index');
    print(urlgetpro);
    var response = await http.delete(
      urlgetpro,
      headers: {
        "Authorization": "Bearer $token",
        'Cookie': '$cookies',
        "Content-Type": 'application/json',
        "Accept": "application/json",
      },
    );
    print(response.statusCode);
    // print(response.body);
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

  Future<bool> placeorder(String shipping_address, int place_id,
      int city_id, String token, String cookies) async {
    var urlatv =
        Uri.parse(ServerConfig.domainNameServer + ServerConfig.placeorder);
    var response = await http.post(urlatv, headers: {
      "Accept": "application/json",
      'Cookie': '$cookies',
      "Authorization": "Bearer $token",
    }, body: {
      'shipping_address': '$shipping_address',
      'place_id': '$place_id',
      'city_id': '$city_id',
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
