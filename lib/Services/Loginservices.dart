import 'package:http/http.dart' as http;
import 'package:project2/model/user.dart';
import 'package:project2/native_services/secure_storage.dart';
import 'package:project2/server.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../config/userinfo.dart';
import '../main.dart';

class LoginServices {
  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.login);
  var message;
  var token;
  var userid;
  late SharedPreferences sharepref;

  Future<bool> login(User user, bool checkbox) async {
    var response = await http.post(url, headers: {
      "Accept": "application/json",
    }, body: {
      'email': user.email,
      'password': user.password,
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse["message"];
    
      

      print("test");
      print(UserInfo.user_token);
      if (jsonResponse["status"] = true){
          token = jsonResponse['access_token'];
      userid = jsonResponse['access_token'];
      UserInfo.user_token = token;

      if (checkbox) {
        print('yiaiii');
        SecureStorage storage = SecureStorage();
        await storage.save('token', UserInfo.user_token);
      }

      // sharepref = await SharedPreferences.getInstance();
      //token=sharedpref?.getInt("token") ?? 0;
      //  sharedpref?.setInt("token", token);
      //await sharedpref!.setString('token', UserInfo.user_token);
      
      return true;
      } 
      return false;
    } else if (response.statusCode == 404) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse["message"];
      return false;
    } else {
      message = "error";
      return false;
    }
  }
}
