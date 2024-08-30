import 'package:get/get.dart';
import 'package:project2/Services/forgotpassword_services.dart';

import '../native_services/secure_storage.dart';

class ForgotPasswordController extends GetxController {
  ForgotPasswordServices services = new ForgotPasswordServices();
  bool sendcode = false;
  bool resetpassoword = false;
  String email = "";
  String newpassword = "";
  String cnp = "";
  String code = "";
  Future<void> sfpc(String myemail) async {
    SecureStorage storage = SecureStorage();
    String? cookies = await storage.read('cookies');
    String email = myemail;
    sendcode = await services.fp(email, cookies!);
    update();
    print('send code? $sendcode');
  }

  Future<void> rp() async {
    SecureStorage storage = SecureStorage();
    String? cookies = await storage.read('cookies');
    //String email = email;
    print(email);
    print(code);
    print(newpassword);
    print(cnp);
    print(cookies);
    resetpassoword =
        await services.cfp(email,cookies!,newpassword, cnp,code);
    update();
    print('pasword reset? $resetpassoword');
  }
}
