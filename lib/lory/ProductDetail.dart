import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/rating/gf_rating.dart';
import 'package:getwidget/getwidget.dart';
import 'package:project2/Home.dart';
import 'package:project2/controllers/wishlist_controller.dart';
import 'package:project2/server.dart';
import 'package:quds_ui_kit/quds_ui_kit.dart';
//import 'package:untitled4/modules/Pants/Pants.dart';
//import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../color.dart';
import '../config/gobals.dart';
import 'ProductDetail_controller.dart';

class ProductDetail extends StatefulWidget {
  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  RxString description = "".obs;

  RxString review = "".obs;

  double _rating = 3;

  ProductDetailController controller = Get.put(ProductDetailController());

  //var data= Get.arguments[0];
  RxDouble setrating = 2.0.obs;

  //List<Map<String, dynamic>> gm = Get.arguments;
  int? index = Get.arguments;

  //int? index = 2;
  get i => null;

  @override
  Widget build(BuildContext context) {
    WishListController wcontroller = Get.put(WishListController());
    print(index);
    controller.getprobyid(index!);
    controller.getreviewcontroller(index!);
    //controller.ind = 1;
    return GetBuilder<ProductDetailController>(
      builder: (controller2) => controller.name == "" && controller.photo == ""
          ? Center(
              child: SizedBox(
                  width: 100, height: 100, child: CircularProgressIndicator()))
          : Scaffold(
              appBar: new AppBar(
                elevation: 0.1,
                //backgroundColor: Color.fromARGB(255, 255, 230, 0),
                //title: Text('fashapp'),
                actions: [
                  IconButton(
                      onPressed: () {
                        //controller.reportproductcontroller(description.value);
                        Get.bottomSheet(
                            backgroundColor: Colors.white,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 20),
                                Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: TextFormField(
                                      onChanged: (value) {
                                        description.value = value;
                                      },
                                      decoration: InputDecoration(
                                          hintText: "70".tr),
                                    )),
                                //SizedBox(height: 20),
                                SizedBox(height: 20),
                                Container(
                                  child: IconButton(
                                      icon: Icon(Icons.arrow_forward),
                                      color: Colors.black,
                                      iconSize: 40,
                                      onPressed: () {
                                        controller.reportproductcontroller(
                                            description.value);
                                        Get.snackbar('71'.tr,
                                            '${description.value}');
                                        print("HII");
                                      }),
                                ),
                              ],
                            ));
                      },
                      icon: Icon(
                        Icons.flag,
                        color: Colors.white,
                      )),
                  new IconButton(
                      onPressed: () {
                        //controller.deleteproductbyid(index!);
                        // controller.addtocartcontroller('${controller.proid}', '1',
                        //     'large', '${controller.quantity}');
                        String pid = controller.proid.toString();
                        print("------------");
                        print(pid);
                        print("------------");
                        Get.toNamed('/buyproduct',
                            arguments: controller.proid);
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {
                        wcontroller.addtowishlistcontroller(index!);
                      },
                      icon: Icon(
                        Icons.favorite_border,
                        size: 30,
                        color: Colors.white,
                      )),
                ],
              ),
              body: SafeArea(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  // decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //         fit: BoxFit.fill,
                  //         image: AssetImage(
                  //           'images/back1.jpg',
                  //         ))),
                  decoration: gardientBackground2,
                  child: SingleChildScrollView(
                      //scrollDirection: Axis.vertical,
                      child: Column(children: [
                    Padding(
                      padding: EdgeInsets.all(35),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Center(
                            //   child: Container(
                            //     height: 190,
                            //     width: 230,
                            //     margin: EdgeInsets.only(top: 20, right: 70),
                            //     decoration: BoxDecoration(
                            //       //color: Colors.white,
                            //       borderRadius: BorderRadius.circular(10),
                            //     ),
                            //   ),
                            // ),
                            // Image.asset(
                            //   //"${controller.AssetImage}",
                            //   "images/5.jpg",
                            //   height: 250,
                            //   width: 250,
                            //   fit: BoxFit.contain,
                            // )
                            // Image.network(src)
                            // public/product_photos/1684318695.jpg,
                            controller.photo == ""
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Image.network(
                                    '${ServerConfig.domainNameServer}/storage/${controller.photo}'),
                          ],
                        ),
                      ),
                    ),
                    GetBuilder<ProductDetailController>(
                      builder: (controller) => controller.name == "" &&
                              controller.photo == ""
                          ? Center(
                              child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: CircularProgressIndicator()))
                          : Container(
//                          height: MediaQuery.of(context).si
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              decoration: BoxDecoration(
                                color: isDarkMode==false? Color.fromARGB(255, 255, 255, 255):Colors.black,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(35),
                                  topRight: Radius.circular(35),
                                ),
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Color.fromARGB(255, 255, 255, 255),
                                //     blurRadius: 10,
                                //     spreadRadius: 1,
                                //   )
                                // ]
                              ),
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${controller.name}",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color:isDarkMode==false? Color.fromARGB(255, 0, 0, 0):Color.fromARGB(255, 255, 230, 0),),
                                    ),

                                    SizedBox(
                                      width: 50,
                                    ),
                                    Container(
                                      height: 75,
                                      width: 75,
                                      child: InkWell(
                                        onTap: () {
                                          int? pind = controller.userId;
                                          print("hii ${controller.userId}");
                                          Get.toNamed('/upprofile',
                                              arguments: pind);
                                        },
                                        onLongPress: () {
                                          Get.snackbar('Store name:',
                                              '${controller.userName}');
                                        },
                                        child: CircleAvatar(
                                          backgroundImage:
                                              AssetImage('images/1.png'),
                                        ),
                                      ),
                                    )
                                    //  Container(
                                    //   width: 75,
                                    //   height: 120,
                                    //    child: Column(
                                    //      children: [
                                    //        Container(
                                    //   //        width: 70,
                                    //   // height: 90,
                                    //         //  child: GFAvatar(
                                    //         //  backgroundImage:AssetImage('images/1.png'),
                                    //         //  shape: GFAvatarShape.circle,
                                    //         //  size: GFSize.LARGE,
                                    //         //  ),
                                    //         child:CircleAvatar(
                                    //           backgroundImage: AssetImage("images/1.png"),
                                    //         )
                                    //        ),
                                    //     //     Text(
                                    //     //   "${controller.userName}",
                                    //     //   style: TextStyle(
                                    //     //     fontSize: 15,
                                    //     //     fontWeight: FontWeight.w500,
                                    //     //     color: Colors.redAccent,
                                    //     //   ),
                                    //     // ),
                                    //      ],
                                    //    ),
                                    //  ),
                                  ],
                                ),
                                // SizedBox(
                                //   height: 15,
                                // ),
                                Column(
                                  children: [
                                    SizedBox(height: 10,),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: GFRating(
                                        size: 25,
                                        color: Colors.amber,
                                        value: 4,
                                        onChanged: (value) {
                                          setState(() {
                                            _rating = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "${controller.description}",
                                  style: TextStyle(
                                   color:isDarkMode==false? Color.fromARGB(255, 0, 0, 0):Color.fromARGB(255, 255, 230, 0),
                                    fontSize: 17,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    // Text(
                                    //   "${controller.colors[0]}",
                                    //   style: TextStyle(
                                    //       fontSize: 20, fontWeight: FontWeight.w500),
                                    // ),
                                    Row(
                                      children: [
                                        //   Text("${controller.colorname}"),
                                        controller.colors[0]['color'] == 'red'
                                            ? Container(
                                                height: 20,
                                                width: 20,
                                                color: Colors.red,
                                                margin: EdgeInsets.all(10),
                                              )
                                            : SizedBox(),
                                        //  controller.colors[1]['color'] == 'brown'
                                        //     ? Container(
                                        //         height: 20,
                                        //         width: 20,
                                        //         color: Colors.brown,
                                        //         margin: EdgeInsets.all(10),
                                        //       )
                                        //     : SizedBox(),

                                        controller.colors[0]['color'] == 'brown'
                                            ? Container(
                                                height: 20,
                                                width: 20,
                                                color: Colors.red,
                                                margin: EdgeInsets.all(10),
                                              )
                                            : SizedBox(),
                                        controller.colors[0]['color'] == 'red'
                                            ? Container(
                                                height: 20,
                                                width: 20,
                                                color: Colors.red,
                                                margin: EdgeInsets.all(10),
                                              )
                                            : SizedBox(),
                                      ],
                                    ),
                                    // Container(
                                    //   height: 30,
                                    //   child: Row(
                                    //     children: [
                                    //       InkWell(
                                    //           onTap: () {
                                    //             print("red");
                                    //           },
                                    //           child: Container(
                                    //             height: 20,
                                    //             width: 20,
                                    //             color: Colors.red,
                                    //             margin: EdgeInsets.all(10),
                                    //           )),
                                    //       InkWell(
                                    //           onTap: () {
                                    //             print("greenaccent");
                                    //           },
                                    //           child: Container(
                                    //               height: 20,
                                    //               width: 20,
                                    //               color: Colors.greenAccent,
                                    //               margin: EdgeInsets.all(10))),
                                    //       InkWell(
                                    //           onTap: () {
                                    //             print("green");
                                    //           },
                                    //           child: Container(
                                    //               height: 20,
                                    //               width: 20,
                                    //               color: Colors.green,
                                    //               margin: EdgeInsets.all(10))),
                                    //     ],
                                    //   ),
                                    // )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // controller.sizes.contains("large")?
                                    // Container(
                                    //   decoration: BoxDecoration(
                                    //     border: Border.all(color:Color.fromARGB(255, 255, 230, 0),)
                                    //   ),
                                    //   child: Text(
                                    //     "L",
                                    //     //controller.sizes[0],
                                    //     style: TextStyle(
                                    //         fontSize: 25, fontWeight: FontWeight.w500),
                                    //   ),
                                    // ): null
                                    //  controller.sizes.contains("small")?
                                    // Container(
                                    //   decoration: BoxDecoration(
                                    //     border: Border.all(color:Color.fromARGB(255, 255, 230, 0),)
                                    //   ),
                                    //   child: Text(
                                    //     "S",
                                    //     style: TextStyle(
                                    //         fontSize: 25, fontWeight: FontWeight.w500),
                                    //   ),
                                    // ): SizedBox(width: 0.0001,),
                                    // controller.sizes.contains("Medium")?
                                    // Container(
                                    //   decoration: BoxDecoration(
                                    //     border: Border.all(color:Color.fromARGB(255, 255, 230, 0),)
                                    //   ),
                                    //   child: Text(
                                    //     "M",
                                    //     style: TextStyle(
                                    //         fontSize: 25, fontWeight: FontWeight.w500),
                                    //   ),
                                    // ): SizedBox(width: 0.0001,),
                                    // controller.sizes.contains("43")?
                                    // Container(
                                    //   decoration: BoxDecoration(
                                    //     border: Border.all(color:Color.fromARGB(255, 255, 230, 0),)
                                    //   ),
                                    //   child: Text(
                                    //     "43",
                                    //     style: TextStyle(
                                    //         fontSize: 25, fontWeight: FontWeight.w500),
                                    //   ),
                                    // ):SizedBox(width: 0.0001,),

                                    Container(
                                      width: 200,
                                      height: 100,
                                      child: GridView.builder(
                                        shrinkWrap: true,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 5,
                                        ),
                                        //itemCount: controller.Sizes.length,
                                        itemCount: 3,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Container(
                                            // decoration: BoxDecoration(
                                            //     border: Border.all(
                                            //         //color: Color.fromARGB(
                                            //         //  255, 255, 230, 0),
                                            //         )),
                                            child: Center(
                                              child: Text(
                                                "\n${controller.Sizes[index]}",
                                                //"hi",
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                        color:isDarkMode==false? Color.fromARGB(255, 0, 0, 0):Color.fromARGB(255, 255, 230, 0),),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),

                                    Text(
                                      "${controller.price}\$",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 2, 182, 23)),
                                    )
                                  ],
                                ),
                                SizedBox(height: 20),
                                Column(
                                  children: [
                                    
                                    Container(
                                      height: 60,
                                      width: 60,
                                      child: InkWell(
                                        onLongPress: () {
                                          Get.snackbar('Store name:',
                                              '${controller.userName}');
                                        },
                                        child: CircleAvatar(
                                          backgroundImage:
                                              AssetImage('images/1.png'),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Obx(() {
                                      return Center(
                                        child: Container(
                                          width: 300,
                                          child: GFRating(
                                            color: Color.fromARGB(
                                                255, 255, 230, 0),
                                            value: setrating.value,
                                            controller: TextEditingController(),
                                            onChanged: (value) {
                                              setState(() {
                                                print(value);
                                                setrating.value = value;
                                              });
                                            },
                                          ),
                                        ),
                                      );
                                    }),
                                  ],
                                ),

                                TextField(
                                  onChanged: (valuee) {
                                    review.value = valuee;
                                  },
                                  // onSubmitted: (){
                                  //   c
                                  // },
                                  onSubmitted: (value) {
                                    String ppid = controller.proid.toString();
                                    print(ppid);
                                    controller.setreviewcontroller(
                                        setrating.value.toString(),
                                        review.value,
                                        ppid);
                                    Get.snackbar(
                                        'Reviewd!:', 'yor rivew has been added',
                                        backgroundColor:
                                            Color.fromARGB(255, 255, 230, 0));
                                  },
                                  decoration: InputDecoration(
                                      hintText: "Add review..",
                                      suffixIcon: Icon(Icons.reviews_outlined),
                                      border: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 255, 230, 0)))),
                                ),

                                IconButton(
                                    onPressed: () {
                                      String ppid = controller.proid.toString();
                                      print(ppid);
                                      controller.setreviewcontroller(
                                          setrating.value.toString(),
                                          review.value,
                                          ppid);
                                    },
                                    icon: Icon(
                                      Icons.arrow_circle_right_outlined,
                                      size: 30,
                                      color: Color.fromARGB(255, 255, 230, 0),
                                    )),
                                SizedBox(height: 20),
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: controller.productreview.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GFListTile(
                                      avatar: GFAvatar(
                                        backgroundImage:
                                            AssetImage("images/2.png"),
                                      ),
                                      titleText: "3",
                                      //subTitleText: "very good",
                                      subTitleText: controller
                                          .productreview[index]['comment'],
                                      icon: Icon(Icons.person),
                                    );
                                  },
                                ),
                              ]),
                            ),
                    ),
                  ])),
                ),
              )),
    );
  }

  //void setState(Null Function() param0) {}
}
