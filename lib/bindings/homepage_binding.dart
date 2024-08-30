import 'package:get/get.dart';
import 'package:project2/controllers/homepage_controller.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController());
  }
}
