// import 'package:get/get.dart';
// import 'package:project2/model/user.dart';
// import 'package:project2/server.dart';

// import '../Services/SignUpservices.dart';

// class SignUpController extends GetxController {
//   var name = "";
//   var email = "";
//   var password = "";
//   var type = "";
//   var number = "";
//   var address = "";
//   var message;
//   var isset = false.obs;
//   var profilepicpath = "".obs;

//   var signupStatues = false;
//   SignUpServices services = SignUpServices();
//   void SetProfileImagePath(String path) {
//     profilepicpath.value = path;
//     isset.value = true;
//   }

//   Future<void> signuponclick() async {
//     print("Yes");
//     // ignore: unnecessary_new
//     User user = new User(
//         name: name,
//         email: email,
//         password: password,
//        // type: type,
//         //number: number,
//         address: address);
//     signupStatues = await services.register(user);
//     message = services.message;
//     if (message is List) {
//       String temp = "";
//       for (String s in message) {
//         temp += s + '\n';
//         message = temp;
//       }
//     }
//   }
// }
