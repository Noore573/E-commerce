import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:project2/cart1.dart';
import 'package:project2/config/userinfo.dart';
import 'package:project2/model/user.dart';
import 'package:project2/model/wishlist.dart';

import 'package:project2/server.dart';
import 'dart:convert';

import '../native_services/secure_storage.dart';

class FavouriteServices {
  Future<bool> addtofavourite(int index, String cookies, String token) async {
    var urlatv = Uri.parse(
        ServerConfig.domainNameServer + ServerConfig.fav + '/add?id=$index');
    var response = await http.get(urlatv, headers: {
      "Accept": "application/json",
      'Cookie': '$cookies',
      "Authorization": "Bearer $token",
    });
    print(response.statusCode);
    print(urlatv);
    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<dynamic>> getfavs(String cookies, String token) async {
    var urlgwl =
        Uri.parse(ServerConfig.domainNameServer + ServerConfig.favlist);
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
      List<dynamic> fl = jsonResponse['favorite'];

      print(fl);
      return fl;
    } else {
      //throw new Exception("no favs!");
      return [];
    }
  }

  Future<bool> deletefromfavs(int index, String cookies, String token) async {
    var urlatv =
        Uri.parse(ServerConfig.domainNameServer + ServerConfig.fav + '/$index');
    var response = await http.delete(urlatv, headers: {
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
