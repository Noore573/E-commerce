import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:project2/controllers/wishlist_controller.dart';
import 'package:project2/lory/ProductDetail_controller.dart';
import 'package:project2/server.dart';

List<String> imgname = <String>[
  'images/1681321847916.jpg',
  'images/1681321857789.jpg',
  'images/1681321959623.jpg',
  'images/1681321991460.jpg',
  'images/8.jpg',
  'images/9.jpg',
  'images/4.jpg',
  'images/8.jpg',
  'images/9.jpg',
  'images/6.jpg',
  'images/5.jpg',
  'images/3.jpg',
  'images/8.jpg',
  'images/9.jpg',
  'images/4.jpg',
  'images/8.jpg',
  'images/8.jpg',
  'images/9.jpg',
  'images/4.jpg',
  'images/8.jpg',
  'images/6.jpg',
  'images/5.jpg',
  'images/3.jpg',
  'images/8.jpg',
  'images/9.jpg',
  'images/4.jpg',
  'images/8.jpg',
  'images/8.jpg',
  'images/9.jpg',
  'images/4.jpg',
  'images/8.jpg',
  'images/6.jpg',
  'images/5.jpg',
  'images/3.jpg',
  'images/8.jpg',
  'images/9.jpg',
  'images/4.jpg',
  'images/8.jpg',
  'images/8.jpg',
  'images/9.jpg',
  'images/4.jpg',
  'images/8.jpg',
  'images/8.jpg',
  'images/9.jpg',
  'images/6.jpg',
  'images/5.jpg',
  'images/3.jpg',
  'images/8.jpg',
  'images/9.jpg',
  'images/4.jpg',
  'images/8.jpg',
  'images/8.jpg',
  'images/9.jpg',
  'images/4.jpg',
  'images/8.jpg',
  'images/6.jpg',
  'images/5.jpg',
  'images/3.jpg',
  'images/8.jpg',
  'images/9.jpg',
  'images/4.jpg',
  'images/8.jpg',
  'images/8.jpg',
  'images/9.jpg',
  'images/4.jpg',
  'images/8.jpg',
  'images/6.jpg',
];

class Dress extends StatelessWidget {
  ProductDetailController controllerpf = Get.put(ProductDetailController());
//public/product_photos/1684393048.jpg
  final List<Map<String, dynamic>> gridMap = [
    {
      "AssetImage": 'images/4.jpg',
      "title": 'Women Short',
      "subtitle": "a very good quality",
      "price": '\$200'
    },
    {
      "AssetImage": 'images/4.jpg',
      "title": 'Women Short',
      "subtitle": "a very good quality",
      "price": '\$200'
    },
    {
      "AssetImage": 'images/4.jpg',
      "title": 'Women Short',
      "subtitle": "a very good quality",
      "price": '\$200'
    },
    {
      "AssetImage": 'images/4.jpg',
      "title": 'Women Short',
      "subtitle": "a very good quality",
      "price": '\$200'
    },
  ];
  RxString gender = 'women'.obs;
  @override
  Widget build(BuildContext context) {
    controllerpf.profiltercatcontroller('dress', gender.value);
    WishListController wcontroller = Get.put(WishListController());

    return GetBuilder<ProductDetailController>(
      builder: (controllerbs) => controllerbs.pfffstatues == false&&controllerpf.pf[0]["photo"]==""
          ? Center(
              child: SizedBox(
                  width: 20, height: 20, child: CircularProgressIndicator()))
          : Scaffold(
              appBar: new AppBar(
                //backgroundColor: Colors.grey,
                //backgroundColor: Color.fromARGB(255, 255, 230, 0),
                //  leading:IconButton(onPressed: (){Get.off("/shoes");}, icon: Icon(Icons.arrow_back,color: Colors.white,)) ,
                title: Text(
                  "Dress",
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: Colors.white),
                ),
              ),
              body: ListView(children: [
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 25),
                    Container(
                      height: 40,
                      width: 80,
                      child: GFButton(
                        onPressed: () {
                          gender.value = 'women';
                          controllerpf.profiltercatcontroller(
                              'dress', gender.value);
                        },
                        text: "Women",
                        color: Color.fromARGB(255, 255, 17, 0),
                        shape: GFButtonShape.pills,
                        type: GFButtonType.outline,
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 40,
                      width: 80,
                      child: GFButton(
                        onPressed: () {
                          gender.value = 'men';
                          controllerpf.profiltercatcontroller(
                              'dress', gender.value);
                        },
                        text: "Men",
                        color: Color.fromARGB(255, 0, 43, 183),
                        shape: GFButtonShape.pills,
                        type: GFButtonType.outline,
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 40,
                      width: 80,
                      child: GFButton(
                        onPressed: () {
                          gender.value = 'women';
                          controllerpf.profiltercatcontroller(
                              'dress', gender.value);
                        },
                        text: "Boys",
                        color: Color.fromARGB(255, 0, 191, 255),
                        shape: GFButtonShape.pills,
                        type: GFButtonType.outline,
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 40,
                      width: 80,
                      child: GFButton(
                        onPressed: () {
                          gender.value = 'women';
                          controllerpf.profiltercatcontroller(
                              'dress', gender.value);
                        },
                        text: "Girls",
                        color: Colors.pink,
                        shape: GFButtonShape.pills,
                        type: GFButtonType.outline,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0,
                      mainAxisExtent: 300,
                    ),
                    itemCount: controllerpf.pf.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          int pin = controllerpf.pf[index]['id'];
                          print(pin);
                          Get.toNamed('/productdetail', arguments: pin);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                                 ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(16.0),
                                ),
                                //   child: Image.asset("${gridMap.elementAt(1)[ 'AssetImage']}",height: 170,
                                child: Image.network(
                                  '${ServerConfig.domainNameServer}/storage/${controllerpf.pf[index]['photo']}',
                                  height: 170,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //Text("${gridMap.elementAt(index)[ 'title']}",style: Theme.of(context).textTheme.headline5,),
                                    Text(
                                      controllerpf.pf[index]['name'],
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    ),
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          controllerpf.pf[index]['price'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              ?.merge(
                                                const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.red),
                                              ),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              wcontroller
                                                  .addtowishlistcontroller(
                                                      controllerpf.pf[index]
                                                          ['id']);
                                            },
                                            child: Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                            ))
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ]),
            ),
    );
  }
}
