import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:project2/Login.dart';
import 'package:project2/color.dart';
import 'package:project2/controllers/profile_controller.dart';
import 'package:project2/introscreen.dart';

class Splash2 extends StatefulWidget {
  const Splash2({super.key});

  @override
  State<Splash2> createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  double oblevel = 1.0;
  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      body: InkWell(
        onTap: (){
        setState(() =>oblevel=oblevel==0?1.0:0.0 ,);
        },
        child: SafeArea(
            child: AnimatedOpacity(
          opacity: oblevel,
          duration: Duration(seconds: 2),
          curve: Curves.bounceOut,
          onEnd: () {
            Get.to(() => Login());
          },
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "images/1cbdad89c341de51fa7e679b1545ce36.jpg",
              fit: BoxFit.fill,
            ),
          ),
        )),
      ),
    );
  }
}

