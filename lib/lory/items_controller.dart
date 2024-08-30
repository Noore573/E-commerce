import 'package:get/get.dart';
import 'package:project2/lory/Custom_listitem.dart';
//import 'package:untitled4/components/Custom_listitem.dart';

abstract class ItemsController extends GetxController {
  intialData();
  changeCat(int val);
   goToPageItemDetail(ProductItem itemss);
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  int? selectedCat;

  @override
  intialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  changeCat(val) {
    selectedCat = val;

    update();
  }

  @override
  goToPageItemDetail(itemss) {
    Get.toNamed("itemdetial", arguments: {"productitem": itemss});
  }
}
