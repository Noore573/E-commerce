import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/controllers/favourite_controller.dart';

class Favs1 extends StatefulWidget {
  @override
  State<Favs1> createState() => _Favs1State();
}

class _Favs1State extends State<Favs1> {
  FavouriteController controller = Get.put(FavouriteController());
  @override
  Widget build(BuildContext context) {
    controller.getfavcontroller();
    return GetBuilder<FavouriteController>(
      builder: (controller) => controller.getfavsstatues == false
          ? Center(
              child: SizedBox(
                  width: 100, height: 100, child: CircularProgressIndicator()))
          : Scaffold(
              body: ListView.builder(
                  itemCount: controller.favs.length,
                  itemBuilder: (context, index) => Container(
                        child: ListTile(
                          onTap: () {
                            controller.deletefromfavscontroller(controller.favs[index]['id']);
                          },
                          title: Text(controller.favs[index]['name']),
                        ),
                      )),
            ),
    );
  }
}
