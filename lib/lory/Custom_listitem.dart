import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/lory/itemdetail_controller.dart';
//  import 'package:untitled4/modules/items/items.dart';
//  import 'package:untitled4/modules/itemdetail/itemdetail_controller.dart';
//  import 'package:untitled4/modules/itemdetail/ItemDetail.dart';
// import 'package:untitled4/modules/items/items_controller.dart';

class CustomListItem extends StatelessWidget {
  List<ProductItem> itemss = [
    ProductItem(
      AssetImage: 'assets/images/shoes(1).jpg',
      title: 'Nike Shoes',
      subtitle: 'a very good quality',
      price: '\$200',
    ),
    ProductItem(
      AssetImage: 'assets/images/shirt(4).jpg',
      title: 'Zara',
      subtitle: 'a very good quality leather',
      price: '\$100',
    ),
  ];
  CustomListItem({Key? key,required this.itemss}):super(key: key);
  ItemDetailController controller = Get.put(ItemDetailControllerImp());

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 2,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.7),
        itemBuilder: (context, index) =>
            ProductCard(item: itemss[index], active: false));
  }
}

Widget ProductCard({required ProductItem item, required final bool active}) =>
    InkWell(
      onTap: () {},
      child: Container(
          width: 200,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        Get.toNamed("/itemdetial");
                      },
                      child: Image(image: AssetImage(item.AssetImage))),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    item.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    item.subtitle,
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$200",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Sans",
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Get.toNamed("/wishlist");
                            },
                            icon: Icon(
                              active
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: Colors.red,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
Widget buildCard({
  required CardItem item,
}) =>
    InkWell(
      onTap: () {},
      child: Container(
          width: 200,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        Get.toNamed("/itemdetial");
                      },
                      child: Image(image: AssetImage(item.AssetImage))),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    item.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    item.subtitle,
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$200",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Sans",
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );

class ProductItem {
  final String AssetImage;
  final String title;
  final String subtitle;
  final String price;

  const ProductItem({
    required this.AssetImage,
    required this.title,
    required this.subtitle,
    required this.price,
  });
}

class CardItem {
  final String AssetImage;
  final String title;
  final String subtitle;

  const CardItem({
    required this.AssetImage,
    required this.title,
    required this.subtitle,
  });

//   CustomListItem(
//   {Key? key, required this.itemsModel, required this.Price})
//    : super(key: key);
//  final ItemsModel itemsModel;
//  final Price;

//  InkWell(child: Card(
//  child: Padding(
//  padding: const EdgeInsets.all(10),
//  child: Column(
//  mainAxisAlignment: MainAxisAlignment.center,
//  children: [
//  Image.asset('assets/images/offer(1).png'),
//  SizedBox(height: 8,),
//  Text("shoes nike",
//  style: TextStyle(color: Colors.black, fontSize: 18,
//  fontWeight: FontWeight.bold,
//  ),),
//  Text(
//  "jjhhgg", textAlign: TextAlign.center,),
//  Container(
//  height: 20,
//  child: Row(
//  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//  children: [
//  Text("\$200",
//  style: TextStyle(color: Colors.red, fontSize: 18,
//  fontWeight: FontWeight.bold, fontFamily: "Sans",),
//  ),
//  IconButton(onPressed: () {},
//  icon: Icon(Icons.favorite, color: Colors.red,))
//  ],
//  ),
//  ),

//  ],
//  ),
//  ),
//  ),);}
}
