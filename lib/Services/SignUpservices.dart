// import 'package:http/http.dart' as http;
// import 'package:project2/model/user.dart';
// import 'package:project2/server.dart';
// import 'dart:convert';
// import "package:project2/controllers/SignUp_Controller.dart";

// class SignUpServices {
//   var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.register);
//   var message;
//   Future<bool> register(User user) async {
//     var response = await http.post(url, headers: {
//       "Accept": "application/json",
//     }, body: {
//       'name': user.name,
//       'email': user.email,
//       'password': user.password,
//       'type': user.type,
//       'number': user.number,
//       'address': user.address,
//     });
//     print(response.statusCode);
//     print(response.body);
//     if (response.statusCode == 200) {
//       var jsonResponse = jsonDecode(response.body);
//       message = jsonResponse["success"];
//       return true;
//     } else if (response.statusCode == 404) {
//       var jsonResponse = jsonDecode(response.body);
//       message = jsonResponse["faild"];
//       return false;
//     } else {
//       message = "??";
//       return false;
//     }
//   }
// }
