import 'package:get/get.dart';
import 'package:project2/Services/Loginservices.dart';
import 'package:project2/model/user.dart';
import 'package:project2/native_services/secure_storage.dart';

import '../main.dart';

class LoginController extends GetxController {
  var checkboxstatus = false.obs;
  //use obs instead of setstate(reactive progrming)
  //we have to say var____.value
  late String email;
  var password;
  var message;
  var loginStatues;
  late LoginServices services;
  @override
  void onInit() {
    email = "";
    password = "";
    loginStatues = false;
    message = "";
    checkboxstatus = false.obs;
    services = LoginServices();
  }

  void changeCheckBox() async {
    checkboxstatus(!(checkboxstatus.value)); //the opposite of the orginal value
    print(checkboxstatus);
     //print(sharedpref?.getString('token'));
    SecureStorage storage = SecureStorage();
    String? test = await storage.read('token');
    print(test);
  }

  Future<void> loginonclick() async {
    print("Yes");
    // ignore: unnecessary_new
    User user = new User(
      email: email,
      password: password,
    );
    loginStatues = await services.login(user, checkboxstatus.value);
    message = services.message;
    if (message is List) {
      String temp = "";
      for (String s in message) {
        temp += s + '\n';
        message = temp;
      }
    }
  }
}
