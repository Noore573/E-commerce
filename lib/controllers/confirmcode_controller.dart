import 'dart:math';

import 'package:get/get.dart';
import 'package:project2/Services/confirmcode_services.dart';
import 'package:project2/Services/register_services.dart';
import 'package:project2/model/user.dart';
import 'package:project2/native_services/secure_storage.dart';

class CCode extends GetxController {
  var confirm;
  String email = "";
  var message;
  String? cookies = "";

  bool confirmationstatue = false;

  CCodeServices services = CCodeServices();
  void onInit() async {
    // SecureStorage storage = SecureStorage();
    // cookies = await storage.read('Cookie');
    // print(cookies);
    update();
    super.onInit();
  }

  Future<void> ccode() async {
    SecureStorage storage = SecureStorage();
    cookies = await storage.read('cookies');
    print(cookies);
    update();
    print(confirm);
    print(email);
    print(cookies);
    print("void confirming..");
    User user = new User(
      email: email,
      confirmcode: confirm,
    );
    confirmationstatue = await services.confirm(user, cookies!);

    message = services.message;
  }
}
