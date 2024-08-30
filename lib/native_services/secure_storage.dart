import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
import 'package:project2/color.dart';
import 'package:project2/bindings/loginBindings.dart';

class SecureStorage {
  //create a stroage
  final storage = new FlutterSecureStorage();

  Future<void> save(String key, String value) async {
    //Write value
    await storage.write(key: key, value: value);
  }

  Future<void> delete(String key) async {
    //delete value
    await storage.delete(key: key,);
  }

  Future<String?> read(String key) async {
    //read value
    return await storage.read(key: key);
  }
}
