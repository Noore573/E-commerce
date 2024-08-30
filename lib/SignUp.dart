// import 'dart:convert';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
// import "package:project2/controllers/Login_Controller.dart";
// import "package:project2/controllers/SignUp_Controller.dart";
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:line_icons/line_icons.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:getwidget/getwidget.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_easyloading/flutter_easyloading.dart';

// import 'package:flutter/material.dart';

// class SignUp extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return Signup();
//   }
// }

// class Signup extends State<SignUp> {
//   File? image;
//   final ImagePicker picker = ImagePicker();
//   SignUpController controller = Get.find();
//   var message="";
//   var Selectedbirthday;
//   //SignUpController controller = Get.find();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           Center(
//             child: Text(
//               "Sign Up",
//               style: TextStyle(fontSize: 25, color: Colors.black),
//             ),
//           ),
//           // SizedBox(height: 5,),
//           // Text("                             Add your details to sign up",),
//           // SizedBox(height: 10,),
//           Container(
//             margin: EdgeInsets.symmetric(vertical: 5),
//             child: Form(
//               child: TextFormField(
//                 onChanged: (value) {
//                   controller.name = value;
//                 },
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.person),
//                   hintText: "fullname",
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       width: 2,
//                       color: Colors.blue,
//                     ),
//                     borderRadius: BorderRadius.circular(35),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       width: 2,
//                       color: Colors.blueAccent,
//                     ),
//                     borderRadius: BorderRadius.circular(35),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.symmetric(vertical: 5),
//             child: Form(
//               child: TextFormField(
//                 onChanged: (value) {
//                   controller.type = value;
//                 },
//                 // keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.person),
//                   hintText: "Bio",
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       width: 2,
//                       color: Colors.blue,
//                     ),
//                     borderRadius: BorderRadius.circular(35),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       width: 2,
//                       color: Colors.blueAccent,
//                     ),
//                     borderRadius: BorderRadius.circular(35),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.symmetric(vertical: 5),
//             child: Form(
//               child: TextFormField(
// //keyboardType: TextInputType.emailAddress,
//                 onChanged: (value) {
//                   controller.email = value;
//                 },
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.email),
//                   hintText: "Email",
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       width: 2,
//                       color: Colors.blueAccent,
//                     ),
//                     borderRadius: BorderRadius.circular(35),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       width: 2,
//                       color: Colors.blueAccent,
//                     ),
//                     borderRadius: BorderRadius.circular(35),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           //  SizedBox(height: 10,),
//           Container(
//             margin: EdgeInsets.symmetric(vertical: 5),
//             child: Form(
//               child: TextFormField(
//                 onChanged: (value) {
//                   controller.number = value;
//                 },
//                 keyboardType: TextInputType.phone,
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.mobile_screen_share),
//                   hintText: "Mobile",
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       width: 2,
//                       color: Colors.blueAccent,
//                     ),
//                     borderRadius: BorderRadius.circular(35),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       width: 2,
//                       color: Colors.blueAccent,
//                     ),
//                     borderRadius: BorderRadius.circular(35),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Container(
//             margin: EdgeInsets.symmetric(vertical: 5),
//             child: Form(
//               child: TextFormField(
//                 onChanged: (value) {
//                   controller.address = value;
//                 },
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.home),
//                   hintText: "Address",
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       width: 2,
//                       color: Colors.blueAccent,
//                     ),
//                     borderRadius: BorderRadius.circular(35),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       width: 2,
//                       color: Colors.blueAccent,
//                     ),
//                     borderRadius: BorderRadius.circular(35),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Container(
//             margin: EdgeInsets.symmetric(vertical: 5),
//             child: Form(
//               child: TextFormField(
//                 onChanged: (value) {
//                   controller.password = value;
//                 },
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.label),
//                   hintText: "Password",
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       width: 2,
//                       color: Colors.blueAccent,
//                     ),
//                     borderRadius: BorderRadius.circular(35),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       width: 2,
//                       color: Colors.blueAccent,
//                     ),
//                     borderRadius: BorderRadius.circular(35),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//             SizedBox(
//             height: 10,
//           ),
//             Container(
//             // color: Colors.white,
//             // margin: EdgeInsets.only(top: 10),
//             child: IconButton(
//                 icon: Icon(Icons.camera),
//                 color: Colors.black,
//                 iconSize: 40,
//                 onPressed: () {
//                   print("HII");
//                   pickimage();
//                 }),
//           ),
//           SizedBox(
//             height: 10,
//           ),

//           Center(
//             child: ElevatedButton(
//                 // shape: RoundedRectangleBorder(
//                 //     borderRadius: BorderRadius.circular(20)),
//                 onPressed: () {
//                   onclicksignup();
//                   print("pressed");
//                 },
//                 child: Text(
//                   "Sign Up",
//                   style: TextStyle(fontSize: 20, color: Colors.blueAccent),
//                 )),
//           )
//         ],
//       ),
//     );
//   }
//   Future pickimage() async {
//     final image = await picker.pickImage(source: ImageSource.gallery);
//     if (image == null) {
//       return;
//     }
//     final imagetemp = File(image.path);
    
//     this.image = imagetemp;
//   }
//   void onclicksignup() async {
//     EasyLoading.show(status: "Loading");
//     await controller.signuponclick();
//     if (controller.signupStatues) {
//       EasyLoading.showSuccess(controller.message);
//       Get.offAllNamed(
//         "/myprofile2",
//       );
//     } else {
//       EasyLoading.showError("Error");
//       print("Error!!!!");
//     }
//   }
// }
