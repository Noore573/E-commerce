import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/lory/itemdetail_controller.dart';
// import 'package:untitled4/modules/View/productdetails_controller.dart';
// import 'package:untitled4/modules/itemdetail/itemdetail_controller.dart';
// import 'package:untitled4/components/Custom_listitem.dart';
class ItemDetail extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    ItemDetailControllerImp controller=Get.put( ItemDetailControllerImp());
    return Scaffold(
      body: Container(child: ListView(
        children: [
Stack(
  children: [
    Container(height: 200,decoration:BoxDecoration(color:Colors.grey,borderRadius: BorderRadius.vertical
      (bottom: Radius.circular(20) ))),
    //Container(child:Image.asset(imagesItems+"/"+controller.itemss.itemssAssetimage),),)
    Container(child:Image.asset("omages/5.jpg"),),
  ],
)
        ],



      )),

    );
  }
}
