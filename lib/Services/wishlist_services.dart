import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:project2/cart1.dart';
import 'package:project2/config/userinfo.dart';
import 'package:project2/model/user.dart';
import 'package:project2/model/wishlist.dart';

import 'package:project2/server.dart';
import 'dart:convert';

class WishListServices {
  var message;
  int? index = 0;
  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.addtowish);

  Future<List<Wishlist>> getwish(String token) async {
    // token = UserInfo.user_token;
    var response = await http.get(url, headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    });
    print(response.statusCode);
    print(token);
    print(response.body);
    if (response.statusCode == 200) {
      //var jsonResponse = jsonDecode(response.body);
      var wishlist = wishlistFromJson(response.body);
      //return wishlist.wishlist;
      return wishlist;
    } else {
      return [];
    }
  }

  Future<bool> addtowishlist(int index, String cookies, String token) async {
    var urlatw = Uri.parse(
        ServerConfig.domainNameServer + ServerConfig.addtowish + "/${index}");
    var response = await http.post(urlatw, headers: {
      "Accept": "application/json",
      'Cookie': '$cookies',
      "Authorization": "Bearer $token",
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<dynamic>> getwishlist(String cookies, String token) async {
    var urlgwl =
        Uri.parse(ServerConfig.domainNameServer + ServerConfig.addtowish);
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
      List<dynamic> wl = jsonResponse['wishlist'];

      print(wl);
      return wl;
    } else {
      //throw [];
      return [];
    }
  }

  Future<bool> removefromowishlist(
      int index, String cookies, String token) async {
    var urlatw = Uri.parse(
        ServerConfig.domainNameServer + ServerConfig.addtowish + "/${index}");
    var response = await http.delete(urlatw, headers: {
      "Accept": "application/json",
      'Cookie': '$cookies',
      "Authorization": "Bearer $token",
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
