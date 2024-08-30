import 'dart:convert';
import "package:project2/controllers/Login_Controller.dart";
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:project2/controllers/profile_controller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:getwidget/getwidget.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';

class HomePage extends StatelessWidget {
  ProfileController controller2 = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: ElevatedButton.icon(
        onPressed: () {
          Get.toNamed("/myprofile3",
              );
          print(controller2.name);
          print("homepage");
        },
        icon: Icon(Icons.arrow_back),
        label: Text("GO!"),
      )),
    );
  }

  
}
