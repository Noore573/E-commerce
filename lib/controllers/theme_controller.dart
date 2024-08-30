import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../main.dart';
import '../native_services/secure_storage.dart';
import '../server.dart';

class ThemeController extends GetxController {
  String backgroundimage = "images/Lightback.jpg";
  var isDarkMode = false.obs;
  String? cookies = "";
  String? token = "";
  String? desc = "";
  bool reportstatues = false;

  void changebackground(String back) {
    backgroundimage = back;
    isDarkMode.value = !isDarkMode.value;
    Get.changeTheme(isDarkMode.value
        ? Themeschanger.customLight
        : Themeschanger.customDark);
    // if (back == "images/Darkback.jpg") {
    //   Get.changeTheme(ThemeData.dark());
    // } else {
    //   Get.changeTheme(ThemeData.light());
    // }

    update();
  }

  Future<void> reportcontroller(String description) async {
    print("adding...");
    SecureStorage storage = SecureStorage();
    cookies = (await storage.read('cookies'))!;
    token = await storage.read('token');
    reportstatues = await report("technical", description, token!, cookies!);
    //message = services.message;

    update();
    print(" reported?:$reportstatues");
  }

  Future<bool> report(
      String title, String description, String token, String cookies) async {
    var urlatv = Uri.parse(ServerConfig.domainNameServer + ServerConfig.report);
    var response = await http.post(urlatv, headers: {
      "Accept": "application/json",
      'Cookie': '$cookies',
      "Authorization": "Bearer $token",
    }, body: {
      "description": description,
      "title": title
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
