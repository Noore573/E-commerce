import 'package:http/http.dart' as http;
import 'package:project2/model/user.dart';
import 'package:project2/native_services/secure_storage.dart';
import 'package:project2/server.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
class LogoutServices{
  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.logout);
  Future<bool> logout(String token) async {

    var response = await http.get(url, headers: {
      "Accept": "application/json",
      'Authorization': 'Bearer $token'
    }, 
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}