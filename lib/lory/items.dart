import 'package:flutter/material.dart';
import 'package:project2/lory/Custom_listitem.dart';
import 'package:project2/lory/items_controller.dart';
//import 'package:untitled4/components/custom_text.dart';
import 'package:get/get.dart';
// import 'package:untitled4/modules/Kids/kids.dart';
// import 'package:untitled4/modules/View/productdetails_controller.dart';
// import 'package:untitled4/modules/items/items_controller.dart';
// import 'package:untitled4/components/Custom_listitem.dart';

class Items2 extends StatelessWidget {
  get itemsImage => 'images/6.jpg';

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    Object i;
    return Scaffold(
      body: new ListView(children: <Widget>[
        Container(
          height: 200,
          color: Colors.red,
        ),
        const SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          child: InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {},
                    child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(width: 3, color: Colors.black))),
                        child: const Text("dress"))),
                InkWell(onTap: () {}, child: const Text("pants")),
                InkWell(onTap: () {}, child: const Text("shorts")),
                InkWell(onTap: () {}, child: const Text("watch")),
                const InkWell(child: Text("tshirt")),
                const InkWell(child: Text("dress")),
              ],
            ),
          ),
        ),
        CustomListItem(
          itemss: [],
        ),
      ]),
    );
  }
}

Widget _ListViewCategory() {
  return Container(
    height: 100,
    child: ListView.separated(
      itemCount: 6,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        var names;
        return Column(
          children: [
            InkWell(
                onTap: () {
                  Get.toNamed("/dress");
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black54),
                  height: 60,
                  width: 60,
                )),

            const SizedBox(
              height: 20,
            ),
            // CustomText(text: names[index],)
            Text("${names[index]}"),
          ],
        );
      },
      separatorBuilder: (context, int index) => const SizedBox(
        width: 20,
      ),
    ),
  );
}

class ProductItem {
  final String AssetImage;
  final String title;
  final String subtitle;

  const ProductItem({
    required this.AssetImage,
    required this.title,
    required this.subtitle,
  });
}
