import 'dart:convert';
import 'dart:io';
import "package:project2/controllers/Login_Controller.dart";
import "package:project2/controllers/SignUp_Controller.dart";
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:getwidget/getwidget.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:flutter/material.dart';

class User {
  String? name;
  String? email = "";
  String? password;
  String? phone;
  String? address;
  String? cpass;
  File? photo;
  String? bio;
  String? contacts;
  final photo_profile;
  String? confirmcode;
  int? place_id;
  int? city_id;
  int? permission_id;
  User({
    this.name,
    this.email,
    this.password,
    this.phone,
    this.address,
    this.photo,
    this.photo_profile,
    this.confirmcode,
    this.cpass,
    this.bio,
    this.place_id,
    this.city_id,
    this.permission_id,
    this.contacts,
  });
}
