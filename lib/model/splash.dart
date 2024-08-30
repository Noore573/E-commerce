import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:project2/color.dart';
import 'package:project2/controllers/profile_controller.dart';

class Splash extends StatelessWidget {
  
ProfileController controller2 = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: gardientBackground,
          child: Image.asset("images/1.png"),

          
        ) 
      ),
    );
  }
}
