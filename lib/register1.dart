import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';
import 'package:project2/controllers/SignUp_Controller.dart';
import 'package:project2/controllers/confirmcode_controller.dart';
import 'package:project2/controllers/register_controller.dart';
import 'package:project2/register2.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:getwidget/getwidget.dart';
import 'package:project2/color.dart';

class Register1 extends StatelessWidget {
  File? image;
  RegisterController controller = Get.put(RegisterController());
  CCode ccontroller = Get.put(CCode());
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      SafeArea(
          child: Center(
              child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: gardientBackground,
        child: ListView(children: [
          Container(
            height: 40,
          ),
          Container(
            width: 100,
            height: 100,
            child: Center(
              child: CircleAvatar(radius: 50, backgroundColor: Colors.white,
                  backgroundImage: AssetImage('images/defaultavatar.jpg'),
                  ),
            ),
          ),
          Container(
            height: 60,
          ),
          // Container(
          //   padding: EdgeInsets.all(10),
          //   width: 30, //MediaQuery.of(context).size.width*0.9,
          //   height: 60,
          //   decoration: BoxDecoration(
          //       color: Colors.white.withAlpha(20),
          //       borderRadius: BorderRadius.circular(20),
          //       border: Border(
          //         top: BorderSide(width: 2, color: Colors.white),
          //         bottom: BorderSide(width: 2, color: Colors.white),
          //         left: BorderSide(width: 2, color: Colors.white),
          //         right: BorderSide(width: 2, color: Colors.white),
          //       )),
          //   child: Center(
          //     child: TextField(
          //       onChanged: (value) {
          //         controller.name = value;
          //       },
          //       cursorColor: Colors.black,
          //       keyboardType: TextInputType.text,
          //       style: TextStyle(color: Colors.black, fontSize: 20),
          //       decoration: InputDecoration(
          //         border: InputBorder.none,
          //         hintText: "USER NAME",
          //         hintStyle: TextStyle(color: Colors.black, fontSize: 20),
          //         contentPadding: EdgeInsets.all(10),
          //       ),
          //     ),
          //   ),
          // ),
          // Container(
          //   height: 10,
          // ),
          Container(
            padding: EdgeInsets.all(10),
            width: 30, //MediaQuery.of(context).size.width*0.9,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white.withAlpha(20),
                borderRadius: BorderRadius.circular(20),
                border: Border(
                  top: BorderSide(width: 2, color: Colors.white),
                  bottom: BorderSide(width: 2, color: Colors.white),
                  left: BorderSide(width: 2, color: Colors.white),
                  right: BorderSide(width: 2, color: Colors.white),
                )),
            child: Center(
              child: TextField(
              
                onChanged: (value) {
                  controller.email = value;
                  ccontroller.email = value;
                },
                
                cursorColor: Colors.black,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.black, fontSize: 20),
                decoration: InputDecoration(
                  suffixIcon: IconButton(onPressed: (){
                      print("Code has been sent!");
                    sendcofirmcode();
                  }, icon: Icon(Icons.telegram,color: Color.fromARGB(255, 0, 221, 7),)),

                  border: InputBorder.none,
                  hintText: "48".tr,
                  hintStyle: TextStyle(color:  Color.fromARGB(255, 184, 184, 184), fontSize: 20),
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
            ),
          ),
          Container(
            height: 10,
          ),
          // Container(
          //   padding: EdgeInsets.all(10),
          //   width: 30, //MediaQuery.of(context).size.width*0.9,
          //   height: 60,
          //   decoration: BoxDecoration(
          //       color: Colors.white.withAlpha(20),
          //       borderRadius: BorderRadius.circular(20),
          //       border: Border(
          //         top: BorderSide(width: 2, color: Colors.white),
          //         bottom: BorderSide(width: 2, color: Colors.white),
          //         left: BorderSide(width: 2, color: Colors.white),
          //         right: BorderSide(width: 2, color: Colors.white),
          //       )),
          //   child: Center(
          //     child: TextField(
          //       onChanged: (value) {
          //         controller.number = value;
          //       },
          //       cursorColor: Colors.black,
          //       keyboardType: TextInputType.text,
          //       style: TextStyle(color: Colors.black, fontSize: 20),
          //       decoration: InputDecoration(
          //         border: InputBorder.none,
          //         hintText: "Phone number",
          //         hintStyle: TextStyle(color: Colors.black, fontSize: 20),
          //         contentPadding: EdgeInsets.all(10),
          //       ),
          //     ),
          //   ),
          // ),
          // Container(
          //   height: 10,
          // ),
          // Container(
          //   padding: EdgeInsets.all(10),
          //   width: 30, //MediaQuery.of(context).size.width*0.9,
          //   height: 60,
          //   decoration: BoxDecoration(
          //       color: Colors.white.withAlpha(20),
          //       borderRadius: BorderRadius.circular(20),
          //       border: Border(
          //         top: BorderSide(width: 2, color: Colors.white),
          //         bottom: BorderSide(width: 2, color: Colors.white),
          //         left: BorderSide(width: 2, color: Colors.white),
          //         right: BorderSide(width: 2, color: Colors.white),
          //       )),
          //   child: Center(
          //     child: TextField(
          //       onChanged: (value) {
          //         controller.address = value;
          //       },
          //       cursorColor: Colors.black,
          //       keyboardType: TextInputType.text,
          //       style: TextStyle(color: Colors.black, fontSize: 20),
          //       decoration: InputDecoration(
          //         border: InputBorder.none,
          //         hintText: "ADDRESS",
          //         hintStyle: TextStyle(color: Colors.black, fontSize: 20),
          //         contentPadding: EdgeInsets.all(10),
          //       ),
          //     ),
          //   ),
          // ),
          // Container(
          //   height: 10,
          // ),

          Container(
            height: 10,
          ),

          Container(
            height: 10,
          ),
          Container(
            height: 10,
          ),
          // Row(
          //   children: [
          //     SizedBox(
          //       width: 5,
          //     ),
          //     IconButton(
          //         icon: Icon(
          //           Icons.contact_mail_rounded,
          //           color: Colors.green,
          //         ),
          //         color: Colors.black,
          //         iconSize: 40,
          //         onPressed: () {
          //           print("Code has been sent!");
          //           sendcofirmcode();
          //         }),
          //     SizedBox(
          //       width: 5,
          //     ),
          //     Text(
          //       "Send Confirmation code to this Email",
          //       style: TextStyle(fontSize: 20),
          //     )
          //   ],
          // ),
          Container(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: 30, //MediaQuery.of(context).size.width*0.9,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white.withAlpha(20),
                borderRadius: BorderRadius.circular(20),
                border: Border(
                  top: BorderSide(width: 2, color: Colors.white),
                  bottom: BorderSide(width: 2, color: Colors.white),
                  left: BorderSide(width: 2, color: Colors.white),
                  right: BorderSide(width: 2, color: Colors.white),
                )),
            child: Center(
              child: TextField(
                onChanged: (value) {
                  ccontroller.confirm = value;
                  // controller.confirmcode = value;
                },
                cursorColor: Colors.black,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.black, fontSize: 20),
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.numbers_sharp),
                  border: InputBorder.none,
                  hintText: "64".tr,
                  hintStyle: TextStyle(color: Color.fromARGB(255, 184, 184, 184), fontSize: 20),
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
            ),
          ),

             SizedBox(height: 30,),
          Container(
            // color: Colors.white,
            // margin: EdgeInsets.only(top: 10),
            child: IconButton(
                icon: Icon(Icons.arrow_forward),
                color: Colors.black,
                iconSize: 40,
                onPressed: () {
                  print("HII");
                  //Get.to(() => Home());
                  //onclickconfirm();
                  print(ccontroller.email);
                  print(ccontroller.confirm);

                  // onclicksignup();
                  //ccontroller.ccode();
                  cconfirm();
                }),
          ),
          Container(
            height: 10,
          ),
          Container(
            height: 10,
          ),
          Container(
            height: 10,
          ),

          Container(
            height: 10,
          ),


        ]),
      ))),
    ]));
  }

  Future pickimage() async {
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }
    final imagetemp = File(image.path);

    this.image = imagetemp;
  }

  void onclicksignup() async {
    EasyLoading.show(status: "Loading");
    await controller.signuponclick();
    if (controller.signupStatues) {
      EasyLoading.showSuccess(controller.message);
      Get.offAllNamed(
        "/home",
      );
    } else {
      EasyLoading.showError(controller.message);
      print("Error!!!!");
    }
  }

  void cconfirm() async {
    EasyLoading.show(status: "Loading");
    await ccontroller.ccode();
    if (ccontroller.confirmationstatue) {
      EasyLoading.showSuccess('Email is Verified');
      Get.toNamed(
        "/register2",
      );
    } else {
      EasyLoading.showError('Invalid');
      print("Error in verfication code!!!!");
    }
  }

  void sendcofirmcode() async {
    EasyLoading.show(status: "loading...");
    await controller.sendcode();
    if (controller.sendcodestatue) {
      EasyLoading.showSuccess("Code has been Sent!");
    } else {
      EasyLoading.showError(controller.message);
      print("Error!!!!");
    }
  }

  void confirmcode() async {
    EasyLoading.show(status: "loading...");
    await controller.Confirmcode();
    if (controller.confirmcodestatue) {
      EasyLoading.showSuccess("Success");
      // Get.toNamed("/register2",
      //     arguments: ["$controller.email", "$controller.confirmcode"]);
    } else {
      EasyLoading.showError(controller.message);
      print("Error!!!!");
    }
  }

  void onclickconfirm() async {
    EasyLoading.show(status: "Loading");
    await ccontroller.ccode();
    if (ccontroller.confirmationstatue) {
      EasyLoading.showSuccess("yiay2");
      Get.toNamed("/splash2");
    } else {
      EasyLoading.showError(controller.message);
      print("Error!!!!");
    }
  }
}
