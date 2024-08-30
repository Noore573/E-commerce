import 'dart:math';

import 'package:get/get.dart';
import 'package:project2/Services/Loginservices.dart';
import 'package:project2/Services/logout_service.dart';
import 'package:project2/model/user.dart';
import 'package:project2/native_services/secure_storage.dart';

import '../main.dart';

class Logoutcontroller extends GetxController {
  var logoutstatue = false;
  LogoutServices services = LogoutServices();

  Future<void> logoutc() async {
    SecureStorage storage = SecureStorage();
    String? token = await storage.read('token');
    logoutstatue = await services.logout(token!);
    update();
    print(logoutstatue);
  }
}
