import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:project2/lory/Custom_listitem.dart';
//import 'package:untitled4/components/Custom_listitem.dart';

abstract class ItemDetailController extends GetxController{



}
class ItemDetailControllerImp extends ItemDetailController{
  late ProductItem itemss;

  initialData(){
    ProductItem itemss =Get.arguments['itemss'];
  }

  @override
  void onInit(){
    initialData();
    super.onInit();
  }



}

