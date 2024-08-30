import 'package:http/http.dart' as http;
import 'package:project2/model/user.dart';
import 'package:project2/native_services/secure_storage.dart';
import 'package:project2/server.dart';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CCodeServices {
  //var ccode;
  var message;
  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.register2);
  // final String? ses=
  // FlutterSecureStorage().read(key: 'laravel_session');
  @override
 
 
  Future<bool> confirm(User user,String cookies) async {
    print("Confirming...");
    print(user.confirmcode);
    print("${user.email} ff");
    var response = await http.post(
      url,
      headers: {
        'Cookie':'$cookies',
        "Accept": "application/json",
      },
      body: {
        
        'verification_code': user.confirmcode,
        "email": user.email,
        
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var jsonrespone = jsonDecode(response.body);
      message = jsonrespone['succcc'];
      return true;
    } else if (response.statusCode == 404) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse["message"];
      return false;
    } else {
      message = "??";
      return false;
    }
  }
}
