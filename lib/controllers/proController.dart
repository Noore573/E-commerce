// import 'dart:io';

// import 'package:get/get.dart';
// import 'package:project2/Services/pros_services.dart';
// import 'package:project2/Services/register_services.dart';
// import 'package:project2/model/product.dart';
// import 'package:project2/model/user.dart';
// import 'package:project2/native_services/secure_storage.dart';
// import 'package:project2/register2.dart';
// import 'package:project2/server.dart';

// import '../Services/SignUpservices.dart';

// class ProController extends GetxController {
//   var message;
//   String name = '';
//   String description = "";
//   double price = 0.0;
//   String quantity = "";
//   String category = "";
//   String gender = "";
//   String? brand_name = "";
//   String? material = "";
//   File? photo ;
//   late List<String> sizes;
//   late Map<String, dynamic> colors;
//   late var propath;
//   RxBool isset = false.obs;
//   bool procreatestatue = false;

//   ProServices services = ProServices();
//   void SetProfileImagePath(String path) {
//     propath.value = path;
//     print(propath.value);
//     isset.value = true;
//   }

//   Future<void> pro() async {
//     print("Yes");
//     // ignore: unnecessary_new
//     Product pro = new Product(
//       name: name,
//       description: description,
//       price: price,
//       quantity: quantity,
//       category: category,
//       photo: photo,
//       gender: gender,
//       material: material,
//       sizes: sizes,
//       brand_name: brand_name,
//       colors: colors,
//     );
//     print(pro.name);
//     SecureStorage storage = SecureStorage();
//     String? token = await storage.read('token');
//     procreatestatue = await services.proservice(pro, token!);
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
