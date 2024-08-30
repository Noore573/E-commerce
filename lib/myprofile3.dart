// ignore_for_file: prefer_const_constructors, unnecessary_cast

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:project2/controllers/profile_controller.dart';
import 'package:project2/controllers/wishlist_controller.dart';
import 'package:project2/lory/ProductDetail_controller.dart';
import 'package:project2/native_services/secure_storage.dart';
import 'package:project2/server.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:getwidget/getwidget.dart';
import 'package:http/http.dart' as http;

final Uri _url = Uri.parse('https://www.facebook.com/');
ProductDetailController controller1 = Get.put(ProductDetailController());
double _rating = 3;
File imageFile = File('D:/screens/2.png');
List wishListItems = [
  //  { 'image': "images/3.png",},
  //   {"images/4.png",},
  //   {"images/5",}
  // "images/111.jpg","images/22.png","images/3.jpg","images/4.jpg", "images/5.jpg","images/6.jpg","images/7.jpg","images/8.jpg","images/9.jpg","images/10.jpg","images/11.jpg","images/11.jpg",
  {
    'name': 'heels',
    'image': 'images/111.jpg',
    'price': '100\$',
    'seller': 'ahmad store',
    'rating': 5,
  },
  {
    'name': 'black shoes',
    'image': 'images/3.jpg',
    'price': '70\$',
    'seller': 'ahmad store',
    'rating': 5,
  },
  {
    'name': 'black shirt',
    'image': 'images/4.jpg',
    'price': '110\$',
    'seller': 'Al fouaz',
    'rating': 5,
  },
  {
    'name': 'red shirt',
    'image': 'images/5.jpg',
    'price': '230\$',
    'seller': 'talis',
    'rating': 5,
  },
  {
    'name': 'pink shirt',
    'image': 'images/6.jpg',
    'price': '100\$',
    'seller': 'talis',
    'rating': 5,
  },
  {
    'name': 'pants',
    'image': 'images/7.jpg',
    'price': '150\$',
    'seller': 'talis',
    'rating': 5,
  },
  {
    'name': 'Ripped pants',
    'image': 'images/8.jpg',
    'price': '300\$',
    'seller': 'Al fouaz',
    'rating': 5,
  },
  {
    'name': 'leggings',
    'image': 'images/9.jpg',
    'price': '200\$',
    'seller': 'ahmad store',
    'rating': 5,
  },
  {
    'name': 'long pants',
    'image': 'images/10.jpg',
    'price': '110\$',
    'seller': 'Xo',
    'rating': 5,
  },
];
ImageProvider imageProvider = FileImage(imageFile);

// List<Widget> wishListItems = <Widget>[
//   Image.asset("/images/3.png"),
//   // Image.asset("/images/4.png"),
//   // Image.asset("/images/5.png"),
//   // Image.asset("/images/6.png"),
// ];
ProfileController controller3 = Get.put(ProfileController());

class Myprofile3 extends StatefulWidget {
  const Myprofile3({super.key});

  @override
  State<Myprofile3> createState() => _Myprofile3State();
}

class _Myprofile3State extends State<Myprofile3> {
  int selectedindex = 0;

  List<Widget> nav = <Widget>[
    pff(),
    myitems2(),
    wishlist(),
    History(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
          IconButton(
              onPressed: () {
                print("change");
              },
              icon: Icon(Icons.money_off_csred_outlined))
        ],
        backgroundColor: Color.fromARGB(255, 255, 230, 0),
      ),
      body: nav.elementAt(selectedindex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Color.fromARGB(255, 255, 230, 0),
              hoverColor: Color.fromARGB(255, 0, 0, 0),
              gap: 8,
              activeColor: Color.fromARGB(255, 0, 0, 0),
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Color.fromARGB(255, 255, 230, 0),
              color: Color.fromARGB(255, 0, 0, 0),
              tabs: [
                GButton(
                  icon: LineIcons.user,
                  text: 'profile',
                ),
                GButton(
                  icon: LineIcons.alternateStore,
                  text: 'MyStore',
                ),
                GButton(
                  icon: LineIcons.shoppingBag,
                  text: 'Wishlist',
                ),
                GButton(
                  icon: LineIcons.history,
                  text: 'History',
                ),
              ],
              selectedIndex: selectedindex,
              onTabChange: (index) {
                setState(() {
                  selectedindex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

class pff extends StatefulWidget {
  const pff({super.key});

  @override
  State<pff> createState() => _pffState();
}

class _pffState extends State<pff> {
  var nnn;

  @override
  Widget build(BuildContext context) {
    controller3.userprofile();
    var myprofile = controller3.myprofile;
    String joineddate = controller3.createdAt;
    ////controller3.['order_date'];
  //  String dateOnly = joineddate.substring(0, 10);
  //String dateOnly = "34";

    return Scaffold(
      body: GetBuilder<ProfileController>(
        builder: (controller) => controller.photo == ""
            ? CircularProgressIndicator()
            : ListView(children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          opacity: 0.8,
                          image: AssetImage(
                            'images/back4.jpg',
                          ))),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          // Image.asset(
                          //   "images/1.png",
                          // ),
                          //fetchImageFromServer(controller.phto)!=null?Image.memory()
                          controller.photo != null
                              ? Image.file(
                                  File("images/1.png"),
                                )
                              : const Image(image: AssetImage("images/1.png")),
                          Center(
                            child: Container(
                                height: 150,
                                width: 150,
                                margin: EdgeInsets.only(top: 150),
                                child: GFAvatar(
                                    backgroundImage: AssetImage("images/2.png"),
                                    shape: GFAvatarShape.circle)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: controller.name != null
                            ? Text(
                                //userdata[0],
                                " ${controller.name}",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold))
                            : Text("noore sabah"),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: Text(controller.bio,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          // ignore: prefer_const_constructors

                          Container(
                              margin: EdgeInsets.only(right: 40),
                              width: 340,
                              height: 30,
                              child: Text(
                                // userdata[1],
                                //"address",
                                controller.address,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )),
                          Divider(
                            height: 20,
                            thickness: 3,
                            color: Colors.blueGrey,
                          ),
                          Container(
                              margin: EdgeInsets.only(right: 50),
                              width: 330,
                              height: 30,
                              child: Text(
                                //"Joined in:",
                                //"${controller.createdAt.substring(0,10)}",
                                controller.createdAtonly,
                              //  dateOnly,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )),
                          Divider(
                            height: 20,
                            thickness: 3,
                            color: Colors.blueGrey,
                          ),
                          Container(
                              margin: EdgeInsets.only(right: 60),
                              width: 320,
                              height: 30,
                              child: Text(
                                "${controller.number}",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )),
                          Divider(
                            height: 20,
                            thickness: 3,
                            color: Colors.blueGrey,
                          ),
                          Container(
                              margin: EdgeInsets.only(right: 70),
                              width: 310,
                              height: 30,
                              child: Text(
                                // "Contacts:",
                                controller.contacts,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )),
                          Divider(
                            height: 20,
                            thickness: 3,
                            color: Colors.blueGrey,
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
              ]),
      ),
    );
  }
}

class wishlist extends StatefulWidget {
  const wishlist({super.key});

  @override
  State<wishlist> createState() => _wishlistState();
}

class _wishlistState extends State<wishlist> {
  WishListController controller1 = Get.put(WishListController());

  @override
  Widget build(BuildContext context) {
    controller1.getwishlistcontroller();
    List<dynamic> wishlist = controller1.wishlist;
    print('f');
    print(wishlist);
    return GetBuilder<WishListController>(
      builder: (controller1) => controller1.getwishliststatues == false
          ? Center(
              child: SizedBox(
                  width: 100, height: 100, child: CircularProgressIndicator()))
          : Scaffold(
              body: Scrollbar(
                thickness: 10,
                // ignore: deprecated_member_use
                isAlwaysShown: true,
                interactive: true,
                child: ListView.builder(
                  itemCount: controller1.wishlist.length,
                  itemBuilder: (context, ind) {
                    return controller1.wishlist == []
                        ? SizedBox(
                            width: 100,
                            height: 100,
                            child: CircularProgressIndicator())
                        : Dismissible(
                            background: Container(
                              color: Colors.red,
                              child: Icon(
                                Icons.delete_outline_outlined,
                                color: Colors.white,
                              ),
                            ),
                            key: ValueKey<dynamic>(wishlist),
                            onDismissed: (DismissDirection direction) async {
                              setState(() {
                                //wishListItems.removeAt(ind);
                                controller1.wishlist.removeAt(ind);
                              });
                              await controller1
                                  .removefromwishlistcontroller(ind);
                            },
                            child: InkWell(
                                onLongPress: () {
                                  controller1.removefromwishlistcontroller(ind);
                                  print("removed!");
                                },
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            "images/background3.jpg")),
                                  ),
                                  height: 150,
                                  child: Row(
                                    children: [
                                      Container(
                                          width: 150,
                                          height: 150,
                                          child: Image.asset(
                                            wishListItems[ind]['image'],
                                            fit: BoxFit.fill,
                                          )),
                                      Container(
                                          padding: EdgeInsets.only(
                                            bottom: 40,
                                          ),
                                          child: Column(
                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 10),
                                                width: 150,
                                                child: Text(
                                                  '${controller1.wishlist[ind]['name']}',
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 12,
                                              ),
                                              Container(
                                                child: Row(
                                                  children: [
                                                    //   Icon(Icons.star),
                                                    //   Icon(Icons.star),
                                                    //   Icon(Icons.star),
                                                    //   Icon(Icons.star),
                                                    //   Icon(Icons.star_half),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  //  Icon(Icons.person_pin_circle_sharp),
                                                  Container(

                                                      // alignment: Alignment.bottomLeft,
                                                      width: 150,
                                                      margin: EdgeInsets.only(
                                                          top: 15),
                                                      child: Row(
                                                        children: [
                                                          Icon(Icons
                                                              .person_pin_circle_sharp),
                                                          Text(
                                                              '${wishListItems[ind]['seller']}',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      20)),
                                                        ],
                                                      )),
                                                ],
                                              ),
                                            ],
                                          )),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Center(
                                        child: Container(
                                            width: 80,
                                            padding:
                                                EdgeInsets.only(bottom: 20),
                                            child: Text(
                                              '${controller1.wishlist[ind]['price']}\$',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green),
                                            )),
                                      )
                                    ],
                                  ),
                                )),
                          );
                  },
                ),
              ),
            ),
    );
  }
}

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _History();
}

class _History extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: wishListItems.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("images/background4.jpg")),
                ),
                height: 150,
                child: Row(
                  children: [
                    Container(
                        width: 150,
                        height: 150,
                        child: Image.asset(
                          wishListItems[index]['image'],
                          fit: BoxFit.fill,
                        )),
                    Container(
                        padding: EdgeInsets.only(
                          bottom: 40,
                        ),
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Container(
                              width: 150,
                              child: Text(
                                '${wishListItems[index]['name']}',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Container(
                              width: 150,
                              child: Text("Date:21/5/2022"),
                            )
                          ],
                        )),
                  ],
                ),
              ));
        },
      ),
    );
  }
}

class myitems2 extends StatefulWidget {
  @override
  State<myitems2> createState() => _myitems2State();
}

class _myitems2State extends State<myitems2> {
  @override
  Widget build(BuildContext context) {
    controller1.getuserproductcontroller();
    return GetBuilder<ProductDetailController>(
        builder: (controller1) => controller1.getuserprostatues == false
            ? Center(
                child: SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator()))
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount:  controller1.userpro.length,
                itemBuilder: (context, index) {
                  return SafeArea(
                      child: Container(
                    width: 200,
                    height: 200,
                    child: Stack(
                      children: [
                        GestureDetector(
                            onLongPress: () {
                              print("noore");
                            },
                            child:  controller1.userpro[index]['photo']==null
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                :
                             Image.network(
                                    '${ServerConfig.domainNameServer}/storage/${controller1.userpro[index]['photo']}'),),
                            //  Image.asset(
                            //     '${wishListItems[index]['image']}')),
                        //   //File('${controller1.userpro[index]['photo']}'))),
                        //   File('product_photos/1684444940.jpg'))
                        // child: Image.network(
                        //     '${ServerConfig.domainNameServer}/e-commerce-main/storage/app/public/product_photos/1684079833.jpg')),

                        //child: Image.memory(await getImageBytes(index))),
                        InkWell(
                          onTap: () {
                            Get.bottomSheet(
                                enterBottomSheetDuration:
                                    Duration(milliseconds: 500),
                                elevation: 100,
                                Container(
                                  height: 400,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                    //backgroundBlendMode: BlendMode.darken
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 200,
                                        width: 200,
                                        child:
                                        // Image.asset(
                                          // wishListItems[index]['image'],
                                           controller1.userpro[index]['photo']==null
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Image.network(
                                    '${ServerConfig.domainNameServer}/storage/${controller1.userpro[index]['photo']}'),
                                          // fit: BoxFit.fill,
                                        
                                      ),
                                      Text(
                                        '${controller1.userpro[index]['name']}',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                        child: GFRating(
                                          padding: EdgeInsets.only(right: 30),
                                          size: 30,
                                          value: _rating,
                                          onChanged: (value) {
                                            setState(() {
                                              _rating = wishListItems[index]
                                                  ['rating'];
                                            });
                                          },
                                        ),
                                      ),
                                      Center(
                                        child: Container(
                                            width: 50,
                                            padding:
                                                EdgeInsets.only(bottom: 20),
                                            child: Text(
                                              '${controller1.userpro[index]['price']}',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green),
                                            )),
                                      ),
                                      Center(
                                          child: ElevatedButton.icon(
                                              onPressed: () {
                                                int pin = controller1
                                                    .userpro[index]['id'];
                                                print(pin);
                                                Get.toNamed('/productdetail',
                                                    arguments: pin);
                                              },
                                              icon: Icon(Icons
                                                  .arrow_forward_ios_rounded),
                                              label: Text("view product")))
                                    ],
                                  ),
                                ));
                          },
                        )
                      ],
                    ),
                  ));
                }));
  }
}

class MyItems extends StatefulWidget {
  @override
  State<MyItems> createState() => _MyItemsState();
}

class _MyItemsState extends State<MyItems> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

Future<Future<Uint8List>> readFileFromCDrive(String fileName) async {
  final filePath = 'C:/$fileName';
  return File(filePath).readAsBytes();
}

Future<Uint8List> getImageBytes(int ind) async {
  var urlgetpro =
      Uri.parse(ServerConfig.domainNameServer + ServerConfig.pro + '/$ind');
  var response = await http.get(
    urlgetpro,
    headers: {
      "Content-Type": 'application/json',
      "Accept": "application/json",
    },
  );
  print(response.statusCode);
  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);
    var image = jsonResponse['photo'];
    print("fff $image");

    return image.bodyBytes;
  } else {
    throw new Exception("image error");
  }
}

// String imagePath = "${controller3.photo}";
// File imageFile = getFileFromImagePath(imagePath);
// File getFileFromImagePath(String imagePath) {
//   File imageFile = File(imagePath);
//   return imageFile;
//}
