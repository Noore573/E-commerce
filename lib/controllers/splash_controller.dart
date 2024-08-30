import 'package:get/get.dart';
import 'package:project2/controllers/profile_controller.dart';
import 'package:project2/native_services/secure_storage.dart';
import 'package:project2/Login.dart';
import 'package:project2/color.dart';
import 'package:project2/register2.dart';
import "package:project2/controllers/Login_Controller.dart";
import 'package:project2/bindings/loginBindings.dart';

class SplashController extends GetxController {
  late SecureStorage _storage;
  var name2;
  late SecureStorage userdatastorage;
  ProfileController controller2 = Get.find();
  @override
  //initialize the variables
  void onInit() async {
    _storage = SecureStorage();
    userdatastorage = SecureStorage();
    // SecureStorage storage = SecureStorage();
    // String? token = await storage.read('token');
    await checktoken();
    //await saveuserdata();

    super.onInit();
  }

//in the page
  @override
  void onReady() {
    super.onReady();
  }

  

  Future<void> checktoken() async {
    String? token = await _storage.read('token');
    print(token);
    if (token != null) {
      Get.offAllNamed("/myprofile3");
    } else {
      Get.offNamed("/login");
    }
  }
}
