// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:line_icons/line_icons.dart';
// import 'package:project2/Home.dart';
// import 'package:project2/controllers/SignUp_Controller.dart';
// import 'package:project2/controllers/confirmcode_controller.dart';
// import 'package:project2/controllers/proController.dart';
// import 'package:project2/controllers/register_controller.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:getwidget/getwidget.dart';
// import 'package:project2/color.dart';

// var data = Get.arguments;
// String em = data[0];
// String cc = data[1];

// class pro extends StatefulWidget {
//   const pro({super.key});

//   @override
//   State<pro> createState() => _proState();
// }

// class _proState extends State<pro> {
//   File? image;
//   File? imagepath;
//   var imgholder = false.obs;
//   ProController controller = Get.find();
//   CCode ccontroller = Get.find();
//   final ImagePicker picker = ImagePicker();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: ListView(children: [
//       SafeArea(
//           child: Center(
//               child: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         decoration: gardientBackground,
//         child: ListView(children: [
//           Container(
//             height: 40,
//           ),
//           InkWell(
//             onTap: () {
//               Get.bottomSheet(Container(
//                 height: 120,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(20),
//                         topRight: Radius.circular(20)),
//                     color: Color.fromARGB(203, 238, 255, 0)),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     IconButton(
//                       onPressed: () {
//                         pickimage();
//                         controller.photo =
//                             File(controller.propath.value);
//                       },
//                       icon: Icon(Icons.camera),
//                       color: Colors.white,
//                       iconSize: 70,
//                       splashColor: Color.fromARGB(255, 255, 153, 0),
//                     ),
//                     SizedBox(width: 50),
//                     IconButton(
//                       onPressed: () {
//                         captureimage();
//                       },
//                       icon: Icon(Icons.camera_alt),
//                       color: Colors.white,
//                       iconSize: 70,
//                     )
//                   ],
//                 ),
//               ));
//               // pickimage();
//             },
//             child: Obx(() {
//               return SizedBox(
//                 height: 170,
//                 width: 170,
//                 child: CircleAvatar(
//                   // ignore: unnecessary_null_comparison
//                   backgroundImage: controller.isset.value == false
//                       ? AssetImage("images/iconred.jpg")
//                       : FileImage(File(controller.profilepicpath.value),
//                           scale: 4) as ImageProvider,
//                 ),
//               );
//             }),

//             //         // image!=null?
//             //         // backgroundImage: AssetImage("$image"):backgroun

//             //           // child: image != null
//             //           //     ? Image.file( image!, fit: BoxFit.cover,)
//             //           //     : Image.asset("images/111.jpg")
//             //             // child:
//             //             //    Image.asset("images/111.jpg")

//             // image != null
//             //     ? Image.file(
//             //         image!,
//             //         fit: BoxFit.cover,
//             //       )
//             //     : Image.asset("images/2.png",fit: BoxFit.cover,)),
//           ),
//           Container(
//             height: 40,
//           ),
//           Container(
//             padding: EdgeInsets.all(10),
//             width: 30, //MediaQuery.of(context).size.width*0.9
//             height: 60,
//             decoration: BoxDecoration(
//                 color: Colors.white.withAlpha(20),
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border(
//                   top: BorderSide(width: 2, color: Colors.white),
//                   bottom: BorderSide(width: 2, color: Colors.white),
//                   left: BorderSide(width: 2, color: Colors.white),
//                   right: BorderSide(width: 2, color: Colors.white),
//                 )),
//             child: Center(
//               child: TextField(
//                 onChanged: (value) {
//                   controller.name = value;
//                 },
//                 cursorColor: Colors.black,
//                 keyboardType: TextInputType.text,
//                 style: TextStyle(color: Colors.black, fontSize: 20),
//                 decoration: InputDecoration(
//                   border: InputBorder.none,
//                   hintText: "Username",
//                   hintStyle: TextStyle(color: Colors.black, fontSize: 20),
//                   contentPadding: EdgeInsets.all(10),
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             height: 10,
//           ),
//           Container(
//             padding: EdgeInsets.all(10),
//             width: 30, //MediaQuery.of(context).size.width*0.9,
//             height: 60,
//             decoration: BoxDecoration(
//                 color: Colors.white.withAlpha(20),
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border(
//                   top: BorderSide(width: 2, color: Colors.white),
//                   bottom: BorderSide(width: 2, color: Colors.white),
//                   left: BorderSide(width: 2, color: Colors.white),
//                   right: BorderSide(width: 2, color: Colors.white),
//                 )),
//             child: Center(
//               child: TextField(
//                 onChanged: (value) {
//                   controller.password = value;
//                 },
//                 cursorColor: Colors.black,
//                 keyboardType: TextInputType.text,
//                 style: TextStyle(color: Colors.black, fontSize: 20),
//                 decoration: InputDecoration(
//                   border: InputBorder.none,
//                   hintText: "Password",
//                   hintStyle: TextStyle(color: Colors.black, fontSize: 20),
//                   contentPadding: EdgeInsets.all(10),
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             height: 20,
//           ),
//           Container(
//             padding: EdgeInsets.all(10),
//             width: 30, //MediaQuery.of(context).size.width*0.9
//             height: 60,
//             decoration: BoxDecoration(
//                 color: Colors.white.withAlpha(20),
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border(
//                   top: BorderSide(width: 2, color: Colors.white),
//                   bottom: BorderSide(width: 2, color: Colors.white),
//                   left: BorderSide(width: 2, color: Colors.white),
//                   right: BorderSide(width: 2, color: Colors.white),
//                 )),
//             child: Center(
//               child: TextField(
//                 onChanged: (value) {
//                   controller.password_confirmation = value;
//                 },
//                 cursorColor: Colors.black,
//                 keyboardType: TextInputType.text,
//                 style: TextStyle(color: Colors.black, fontSize: 20),
//                 decoration: InputDecoration(
//                   border: InputBorder.none,
//                   hintText: "Confrim password",
//                   hintStyle: TextStyle(color: Colors.black, fontSize: 20),
//                   contentPadding: EdgeInsets.all(10),
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             height: 10,
//           ),
//           Container(
//             padding: EdgeInsets.all(10),
//             width: 30, //MediaQuery.of(context).size.width*0.9,
//             height: 60,
//             decoration: BoxDecoration(
//                 color: Colors.white.withAlpha(20),
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border(
//                   top: BorderSide(width: 2, color: Colors.white),
//                   bottom: BorderSide(width: 2, color: Colors.white),
//                   left: BorderSide(width: 2, color: Colors.white),
//                   right: BorderSide(width: 2, color: Colors.white),
//                 )),
//             child: Center(
//               child: TextField(
//                 onChanged: (value) {
//                   controller.bio = value;
//                 },
//                 cursorColor: Colors.black,
//                 keyboardType: TextInputType.text,
//                 style: TextStyle(color: Colors.black, fontSize: 20),
//                 decoration: InputDecoration(
//                   border: InputBorder.none,
//                   hintText: "Bio",
//                   hintStyle: TextStyle(color: Colors.black, fontSize: 20),
//                   contentPadding: EdgeInsets.all(10),
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             height: 10,
//           ),
//           Container(
//             height: 10,
//           ),
//           Container(
//             padding: EdgeInsets.all(10),
//             width: 30, //MediaQuery.of(context).size.width*0.9,
//             height: 60,
//             decoration: BoxDecoration(
//                 color: Colors.white.withAlpha(20),
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border(
//                   top: BorderSide(width: 2, color: Colors.white),
//                   bottom: BorderSide(width: 2, color: Colors.white),
//                   left: BorderSide(width: 2, color: Colors.white),
//                   right: BorderSide(width: 2, color: Colors.white),
//                 )),
//             child: Center(
//               child: TextField(
//                 onChanged: (value) {
//                   controller.phone = value;
//                 },
//                 cursorColor: Colors.black,
//                 keyboardType: TextInputType.text,
//                 style: TextStyle(color: Colors.black, fontSize: 20),
//                 decoration: InputDecoration(
//                   border: InputBorder.none,
//                   hintText: "Phone number",
//                   hintStyle: TextStyle(color: Colors.black, fontSize: 20),
//                   contentPadding: EdgeInsets.all(10),
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             height: 10,
//           ),
//           Container(
//             padding: EdgeInsets.all(10),
//             width: 30, //MediaQuery.of(context).size.width*0.9,
//             height: 60,
//             decoration: BoxDecoration(
//                 color: Colors.white.withAlpha(20),
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border(
//                   top: BorderSide(width: 2, color: Colors.white),
//                   bottom: BorderSide(width: 2, color: Colors.white),
//                   left: BorderSide(width: 2, color: Colors.white),
//                   right: BorderSide(width: 2, color: Colors.white),
//                 )),
//             child: Center(
//               child: TextField(
//                 onChanged: (value) {
//                   controller.address = value;
//                 },
//                 cursorColor: Colors.black,
//                 keyboardType: TextInputType.text,
//                 style: TextStyle(color: Colors.black, fontSize: 20),
//                 decoration: InputDecoration(
//                   border: InputBorder.none,
//                   hintText: "Address",
//                   hintStyle: TextStyle(color: Colors.black, fontSize: 20),
//                   contentPadding: EdgeInsets.all(10),
//                 ),
//               ),
//             ),
//           ),
//             Container(
//             height: 10,
//           ),
//           Container(
//             padding: EdgeInsets.all(10),
//             width: 30, //MediaQuery.of(context).size.width*0.9,
//             height: 60,
//             decoration: BoxDecoration(
//                 color: Colors.white.withAlpha(20),
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border(
//                   top: BorderSide(width: 2, color: Colors.white),
//                   bottom: BorderSide(width: 2, color: Colors.white),
//                   left: BorderSide(width: 2, color: Colors.white),
//                   right: BorderSide(width: 2, color: Colors.white),
//                 )),
//             child: Center(
//               child: TextField(
//                 onChanged: (value) {
//                   controller.email = value;
//                 },
//                 cursorColor: Colors.black,
//                 keyboardType: TextInputType.text,
//                 style: TextStyle(color: Colors.black, fontSize: 20),
//                 decoration: InputDecoration(
//                   border: InputBorder.none,
//                   hintText: "ee",
//                   hintStyle: TextStyle(color: Colors.black, fontSize: 20),
//                   contentPadding: EdgeInsets.all(10),
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             height: 10,
//           ),
//           Container(
//             // color: Colors.white,
//             // margin: EdgeInsets.only(top: 10),
//             child: IconButton(
//                 icon: Icon(Icons.arrow_forward),
//                 color: Colors.black,
//                 iconSize: 40,
//                 onPressed: () {
//                   print("HII");
//                   //Get.to(() => Home());
//                   //onclickconfirm();
//                   print(controller.email);
//                   print(controller.confirmcode);
                  
//                   onclicksignup();
//                   //ccontroller.ccode();
//                 }),
//           ),
//           Container(
//             height: 10,
//           ),
//           SizedBox(
//               height: 20,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   IconButton(
//                       onPressed: () {
//                         print("tap");
//                       },
//                       icon: Icon(Icons.shop)),
//                   IconButton(
//                       onPressed: () {
//                         print("tap");
//                       },
//                       icon: Icon(Icons.account_balance_wallet_sharp)),
//                   IconButton(
//                       onPressed: () {
//                         print("tap");
//                       },
//                       icon: Icon(Icons.add_call)),
//                   IconButton(
//                       onPressed: () {
//                         print("tap");
//                       },
//                       icon: Icon(Icons.account_box_rounded)),
//                 ],
//               )),
//         ]),
//       ))),
//     ]));
//   }

//   Future pickimage() async {
//     final image = await picker.pickImage(source: ImageSource.gallery);
//     if (image == null) {
//       return print("fddddddd");
//     }
//     imgholder.value = true;
//     imagepath = File(image.path);
//     controller.SetProfileImagePath(imagepath!.path);
//   }

//   Future captureimage() async {
//     final image = await picker.pickImage(source: ImageSource.camera);
//     if (image == null) {
//       return print("fddddddd");
//     }
//     imgholder.value = true;
//     imagepath = File(image.path);
//     controller.SetProfileImagePath(imagepath!.path);
//   }

//   Future<void> openImagePicker() async {
//     final XFile? pickedImage =
//         await picker.pickImage(source: ImageSource.gallery);
//     if (pickedImage != null) {
//       setState(() {
//         image = File(pickedImage.path);
//       });
//     }
//   }

//   void onclicksignup() async {
//     EasyLoading.show(status: "Loading");
//     await controller.signuponclick();
//     if (controller.signupStatues) {
//       EasyLoading.showSuccess("yiay");
//     } else {
//       EasyLoading.showError("Error");
//       print("Error!!!!");
//     }
//   }

//   void onclickconfirm() async {
//     EasyLoading.show(status: "Loading");
//     await ccontroller.ccode();
//     if (ccontroller.confirmationstatue) {
//       EasyLoading.showSuccess("yiay2");
//       Get.toNamed("/splash2");
//     } else {
//       EasyLoading.showError(controller.message);
//       print("Error!!!!");
//     }
//   }
// }
