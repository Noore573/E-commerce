import 'dart:convert';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:project2/Home.dart';
import "package:project2/controllers/Login_Controller.dart";
import 'package:project2/Services/googlesignin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:project2/register1.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:getwidget/getwidget.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:project2/color.dart';
import 'package:project2/bindings/loginBindings.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'controllers/forgotpassword_controller.dart';

class Login extends StatelessWidget {
  LoginController controller = Get.put(LoginController());
  double oblevel = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      //decoration: gardientBackground,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("images/b1.jpg"),
        fit: BoxFit.fill,
      )),
      child: ListView(
        children: [
          // SizedBox(height: 150,
          // child: Image.asset('assets/images/images (2).jpg'),
          // ),
          Container(
            height: 140,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Divider(
                    color: Colors.white,
                    thickness: 3,
                  )),
              Text(
                "54".tr,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Divider(
                    color: Colors.white,
                    thickness: 3,
                  )),
            ],
          ),
          SizedBox(
            height: 50,
          ),

          // Container(
          //   height: 50,
          // ),
          // Container(

          //  child: SignInButton(
          //     Buttons.Google,
          //     onPressed: () {
          //     },
          //   ),
          //   ),
          SizedBox(
            height: 20,
          ),
          Container(
              padding: EdgeInsets.all(10),
              width: 30, //MediaQuery.of(context).size.width*0.9,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white.withAlpha(20),
                  borderRadius: BorderRadius.circular(10),
                  border: Border(
                    top: BorderSide(
                      width: 2,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    bottom: BorderSide(
                      width: 2,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    left: BorderSide(
                      width: 2,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    right: BorderSide(
                      width: 2,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  )),
              child: Center(
                child: TextField(
                  onChanged: (value) {
                    controller.email = value;
                  },
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "55".tr,
                    hintStyle: TextStyle(color: Colors.white, fontSize: 20),
                    contentPadding: EdgeInsets.all(10),
                  ),
                  //  ))) ],))));}}
                ),
              )),
          Container(
            height: 20,
          ),
          Container(
              padding: EdgeInsets.all(10),
              width: 30, //MediaQuery.of(context).size.width*0.9,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white.withAlpha(20),
                  borderRadius: BorderRadius.circular(10),
                  border: Border(
                    top: BorderSide(width: 2, color: Colors.black),
                    bottom: BorderSide(width: 2, color: Colors.black),
                    left: BorderSide(width: 2, color: Colors.black),
                    right: BorderSide(width: 2, color: Colors.black),
                  )),
              child: Center(
                child: TextField(
                  onChanged: (value) {
                    controller.password = value;
                  },
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "56".tr,
                    hintStyle: TextStyle(color: Colors.white, fontSize: 20),
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              )),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Obx(() {
                return Checkbox(
                    value: controller.checkboxstatus.value,
                    onChanged: (val) {
                      controller.changeCheckBox();
                    });
              }),
              Text("57".tr)
            ],
          ),
          Container(
            child: InkWell(
              onTap: () {
                ForgotPasswordController controllerfp =
                    new ForgotPasswordController();

                controllerfp.sfpc(controller.email);
                controllerfp.email = controller.email;
                Get.bottomSheet(
                    backgroundColor: Colors.white,
                    Column(
                      children: [
                        SizedBox(height: 20),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: TextFormField(
                              onChanged: (value) {
                                controllerfp.code = value;
                              },
                              decoration: InputDecoration(hintText: "Code:"),
                            )),
                        SizedBox(height: 20),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: TextFormField(
                              onChanged: (value) {
                                controllerfp.newpassword = value;
                              },
                              decoration:
                                  InputDecoration(hintText: "New password:"),
                            )),
                        SizedBox(height: 20),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: TextFormField(
                              onChanged: (value) {
                                controllerfp.cnp = value;
                              },
                              decoration: InputDecoration(
                                  hintText: "Confirm new Password:"),
                            )),
                        SizedBox(height: 20),
                        Container(
                          child: IconButton(
                              icon: Icon(Icons.arrow_forward),
                              color: Colors.black,
                              iconSize: 40,
                              onPressed: () {
                                controllerfp.rp();
                                print("HII");
                              }),
                        ),
                      ],
                    ));
                //oblevel.value=oblevel.value==0?1.0:0.0 ;
              },
              // setState(() =>oblevel=oblevel==0?1.0:0.0 ,)
              child: AnimatedOpacity(
                opacity: oblevel,
                duration: Duration(seconds: 2),
                curve: Curves.bounceOut,
                onEnd: () {
                  //Get.to(() => ());
                  Get.bottomSheet(Column(
                    children: [
                      TextFormField(),
                      TextFormField(),
                      TextFormField()
                    ],
                  ));
                },
                child: Row(
                  children: [
                    SizedBox(width: 5),
                    Text(
                      "58".tr,
                      style: TextStyle(
                          color: Color.fromARGB(255, 57, 166, 255),
                          fontSize: 17),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: IconButton(
                icon: Icon(Icons.arrow_forward),
                color: Colors.black,
                iconSize: 40,
                onPressed: () {
                  print("HII");
                  //   login(adminEmailController.text,
                  //       adminPasswordController.text);
                  onClickLogin();
                }),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Divider(
                    color: Colors.white,
                    thickness: 3,
                  )),
              Text(
                "59".tr,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Divider(
                    color: Colors.white,
                    thickness: 3,
                  )),
            ],
          ),
          Container(
            width: double.infinity - 20,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromARGB(255, 255, 255, 255), width: 3)),
            child: SignInButton(
              Buttons.Google,
              onPressed: () {
                googlesign();
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(width: 3),
              Text(
                "60".tr,
                style: TextStyle(fontSize: 17),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => Register1());
                },
                child: Text(
                  "61".tr,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 139, 252), fontSize: 17),
                ),
              ),
              Text(
                "62".tr,
                style: TextStyle(fontSize: 17),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed("/guesthome");
                  //  oblevel.value=oblevel.value==0?1.0:0.0 ;
                },
                // setState(() =>oblevel=oblevel==0?1.0:0.0 ,)
                child: AnimatedOpacity(
                  opacity: oblevel,
                  duration: Duration(seconds: 2),
                  curve: Curves.bounceOut,
                  // onEnd: () {
                  //   Get.to(() => Home());
                  // },
                  child: Text(
                    "63".tr,
                    style: TextStyle(
                        color: Color.fromARGB(255, 57, 166, 255), fontSize: 17),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    )));
  }

  void onClickLogin() async {
    EasyLoading.show(status: "Loading");
    await controller.loginonclick();
    if (controller.loginStatues) {
      EasyLoading.showSuccess(controller.message);
      Get.offAllNamed(
        "/homeL",
      );
    } else {
      EasyLoading.showError(controller.message);
      print("Error!!");
    }
  }

  Future googlesign() async {
    await GoogleSignServices.login();
  }
}
