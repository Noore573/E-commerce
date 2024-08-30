import 'dart:convert';

import '../server.dart';
import 'package:http/http.dart' as http;
class ForgotPasswordServices{
  Future<bool> fp(String email,String cookies) async {
    var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.forgetpassword);
    var response = await http.post(url, headers: {
      "Accept": "application/json",
      'Cookie':'$cookies',
    }, body: {
      'email': email,
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return true;
    } else if (response.statusCode == 404) {
      var jsonResponse = jsonDecode(response.body);
      return false;
    } else {
      return false;
    }
  }
    Future<bool> cfp(String email,String cookies,String newpassword,String passconfirm,String code) async {
    var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.confirmfp);
    var response = await http.post(url, headers: {
      "Accept": "application/json",
      'Cookie':'$cookies',
    }, body: {
      'email': email,
      'code': code,
      'password': newpassword,
      'password_confirmation': passconfirm,
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return true;
    } else if (response.statusCode == 404) {
      var jsonResponse = jsonDecode(response.body);
      return false;
    } else {
      return false;
    }
  }
}