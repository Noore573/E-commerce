import 'dart:convert';
import "package:project2/controllers/Login_Controller.dart";
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:getwidget/getwidget.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SignIn2 extends StatefulWidget {
  State<StatefulWidget> createState() {
    return TestState();
  }
}

class TestState extends State<SignIn2> {
  LoginController controller = Get.put(LoginController());
  final adminEmailController = TextEditingController();
  final adminPasswordController = TextEditingController();
  Future login(String email, String pass) async {
    var response = await http.post(Uri.parse("http://10.0.2.2:8000/api/login"),
        body: <String, String>{'email': email, 'password': pass});
    if (response.statusCode == 200) {
      var js = jsonDecode(response.body);
      String token = js['token'];
      print("THe token is $token");
    } else {
      print("Error!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),

//
        body: Column(children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                Container(
                  // height: 150,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Icon(
                    Icons.account_circle,
                    size: 60,
                    color: Colors.blueAccent,
                  ),
                ),
                Container(
                  child: TextFormField(
                    controller: adminEmailController,
                    enabled: true,
                    onChanged: (value) {
                      controller.email = value;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter Email",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 3)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide: BorderSide(color: Colors.red, width: 3)),
                    ),
                  ),
                ),
                Container(
                  child: TextFormField(
                    controller: adminPasswordController,
                    enabled: true,
                    onChanged: (value) {
                      controller.password = value;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 3)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.red, width: 3)),
                    ),
                  ),
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
                    Text("Remmeber me")
                  ],
                ),
                Container(
                  // color: Colors.white,
                  // margin: EdgeInsets.only(top: 10),
                  child: IconButton(
                      icon: Icon(Icons.arrow_forward),
                      color: Colors.blueAccent,
                      iconSize: 40,
                      onPressed: () {
                        print("HII");
                        //   login(adminEmailController.text,
                        //       adminPasswordController.text);
                        onClickLogin();
                      }),
                ),
              ]))
        ]));
  }

  void onClickLogin() async {
    EasyLoading.show(status: "Loading");
    await controller.loginonclick();
    if (controller.loginStatues) {
      EasyLoading.showSuccess(controller.message);
      Get.offAllNamed(
        "/home",
      );
    } else {
      EasyLoading.showError(controller.message);
      print("Error!!!!");
    }
  }
}
