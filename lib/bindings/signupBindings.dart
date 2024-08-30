import 'package:get/get.dart';
import 'package:project2/controllers/SignUp_Controller.dart';
import 'package:project2/controllers/confirmcode_controller.dart';
import 'package:project2/controllers/register_controller.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    //Get.put(SignUpController());
    Get.put(CCode());
    Get.put(RegisterController());
    
  }
}
