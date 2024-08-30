// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:project2/Home.dart';
import 'package:project2/controllers/favourite_controller.dart';
import 'package:project2/controllers/upprofile_controller.dart';
import 'package:project2/lory/ProductDetail_controller.dart';
import 'package:project2/server.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:getwidget/getwidget.dart';

import 'color.dart';

final Uri _url = Uri.parse('https://www.facebook.com/');
double _rating = 3;
var profileid = Get.arguments;
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
List ItemsItems = [
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
// List<Widget> ItemsItems = <Widget>[
//   Image.asset("/images/3.png"),
//   // Image.asset("/images/4.png"),
//   // Image.asset("/images/5.png"),
//   // Image.asset("/images/6.png"),
// ];

UpProfileController controlleru = Get.put(UpProfileController());
ProductDetailController userproductscontroller =
    Get.put(ProductDetailController());
int ud = controlleru.profileid;
FavouriteController controllerff = Get.put(FavouriteController());

class UpProfile extends StatefulWidget {
  @override
  State<UpProfile> createState() => _UpProfileState();
}

class _UpProfileState extends State<UpProfile> {
  int selectedindex = 0;

  List<Widget> nav = <Widget>[
    pff(),
    //Items(),
    myitems2(),
  ];
  FavouriteController controllerfav = Get.put(FavouriteController());
  void onclickaddtofavs(int index) async {
    EasyLoading.show(status: "Loading");
    await controllerfav.addtofavs(profileid);
    if (controllerfav.addtofavstatues.value) {
      EasyLoading.showSuccess("Account have been added to favorites");
    } else {
      EasyLoading.showError("Already added!");
      print("Error!!");
    }
  }

  RxString desc = "".obs;
  @override
  Widget build(BuildContext context) {
    controllerff.getfavcontroller();
    List<dynamic> addedtofav = controllerff.favs;
    RxBool at = false.obs;
    return Scaffold(
      appBar: AppBar(
        actions: [
          //  Obx(() {
          //return
          Container(
              margin: EdgeInsets.only(right: 10, bottom: 10),
              child: Center(
                child: IconButton(
                  alignment: Alignment.center,
                  onPressed: () {
                    print(ud);
                    onclickaddtofavs(profileid);
                    //at.value = true;
                    //controllerfav.addtofavstatues == true;
                  },
                  color: profileid == true ? Colors.redAccent : Colors.white,
                  splashColor: Color.fromARGB(255, 60, 135, 255),
                  focusColor: Color.fromARGB(255, 60, 135, 255),
                  highlightColor: Color.fromARGB(255, 60, 135, 255),
                  icon: Icon(
                    Icons.favorite_outlined,
                    size: 45,
                  ),
                ),
              )),

          IconButton(
              onPressed: () {
                //controller.reportproductcontroller(description.value);
                Get.bottomSheet(
                    backgroundColor: Colors.white,
                    Container(
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 10),
                             Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: TextFormField(
                                  onChanged: (value) {
                                    setState(() {
                                    desc.value = value;  
                                    });
                                    
                                  },
                                  decoration: InputDecoration(
                                      hintText: "70".tr),
                                )),
                          //SizedBox(height: 20),
                          SizedBox(height: 10),
                          Container(
                            child: IconButton(
                                icon: Icon(Icons.arrow_forward),
                                color: Colors.black,
                                iconSize: 40,
                                onPressed: () {
                                  controlleru
                                      .reportusercontroller(desc.value);
                                  Get.snackbar(
                                      '71'.tr, '${desc.value}');
                                  print("HII");
                                }),
                          ),
                        ],
                      ),
                    ));
              },
              icon: Icon(
                Icons.flag,
                color: Colors.white,
              )),
        ],
      ),
      body: nav.elementAt(selectedindex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
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
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Color.fromARGB(255, 255, 230, 0),
              color: Colors.black,
              tabs: [
                GButton(
                  icon: LineIcons.user,
                  text: 'profile',
                ),
                // GButton(
                //   icon: LineIcons.shoppingBag,
                //   text: 'Items',
                // ),
                GButton(
                  icon: LineIcons.alternateStore,
                  text: 'Store',
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
  int? pid = Get.arguments;
  @override
  Widget build(BuildContext context) {
    // controllerup.profileid = 6;
    //var upprofile = controllerup.upprofile;
    UpProfileController controllerup = Get.put(UpProfileController());
    var upprofile = controllerup.getprofile(profileid);

    //String onlydate = controllerup.onlycreatedat;
    print(' yoooo $profileid');
    return GetBuilder<UpProfileController>(
      builder: (controller1) =>
          controller1.upstatues == false && controllerup.onlycreatedat == ""
              ? Center(
                  child: SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator()))
              : Scaffold(
                  body: ListView(children: [
                    Container(
                      // decoration: BoxDecoration(
                      //     image: DecorationImage(
                      //         fit: BoxFit.fill,
                      //         image: AssetImage('images/background1.png'))),
                      decoration: gardientBackground3,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                "images/1.png",
                              ),
                              Center(
                                child: Container(
                                    height: 150,
                                    width: 150,
                                    margin: EdgeInsets.only(top: 150),
                                    child: GFAvatar(
                                        //backgroundImage: AssetImage("images/2.png"),

                                        backgroundImage: NetworkImage(
                                            "${ServerConfig.domainNameServer}/uploads/users_photo/1685705778.png"),
                                        //'${ServerConfig.domainNameServer}/storage/product_photos/1684922931.jpg'),
                                        shape: GFAvatarShape.circle)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Text(
                              //"Noore Sadon ",
                              controllerup.name,
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Text(
                              controllerup.bio,
                              style: TextStyle(fontSize: 15),
                            ),
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
                                    //"Address:",
                                    controllerup.address,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 17),
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
                                    controllerup.onlycreatedat,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 17),
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
                                    controllerup.number,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 17),
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
                                    controllerup.contacts,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 17),
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

class myitems2 extends StatefulWidget {
  const myitems2({super.key});

  @override
  State<myitems2> createState() => _myitems2State();
}

class _myitems2State extends State<myitems2> {
  @override
  Widget build(BuildContext context) {
    userproductscontroller.proprofile(profileid);

    return GetBuilder<ProductDetailController>(
        builder: (controller1) => userproductscontroller.proprofilestatues ==
                false
            ? Center(
                child: SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator()))
            : Scaffold(
                body: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: userproductscontroller.pf.length,
                    itemBuilder: (context, index) {
                      return SafeArea(
                          child: Container(
                        width: 200,
                        height: 200,
                        child: Stack(
                          children: [
                            GestureDetector(
                                // child: Image.asset(
                                //     '${wishListItems[1]['image']}')),
                                child: Image.network(
                                    '${ServerConfig.domainNameServer}/storage/${userproductscontroller.pf[index]['photo']}')),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: InkWell(
                                onLongPress: () {
                                  GFToast.showToast(
                                      '${userproductscontroller.pf[index]['price']}',
                                      context,
                                      toastPosition: GFToastPosition.BOTTOM,
                                      toastDuration: 1,
                                      backgroundColor: Colors.green);
                                },
                                onTap: () {
                                  Get.bottomSheet(
                                      enterBottomSheetDuration:
                                          Duration(milliseconds: 500),
                                      elevation: 100,
                                      Container(
                                        height: 400,
                                        width: 300,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "images/back5.jpg"),
                                              opacity: 0.9,
                                              fit: BoxFit.fill),
                                          // color: Color
                                          //     .fromARGB(
                                          //         255,
                                          //         255,
                                          //         255,
                                          //         255),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20)),
                                          border: Border.all(
                                            width: 4,
                                            color: Color.fromARGB(
                                                255, 255, 230, 0),
                                          ),
                                          //backgroundBlendMode: BlendMode.darken
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 200,
                                              width: 200,
                                              //child:
                                              //  Image.asset(
                                              //     // controllerpf.pf[index!]['image'],
                                              //     "images/5.jpg"
                                              //     // fit: BoxFit.fill,
                                              //     ),
                                              child: Image.network(
                                                '${ServerConfig.domainNameServer}/storage/${userproductscontroller.pf[index]['photo']}',
                                                height: 170,
                                                fit: BoxFit.cover,
                                                width: double.infinity,
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              '${userproductscontroller.pf[index]['name']}',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 10),
                                            Center(
                                              child: Container(
                                                  width: 150,
                                                  padding: EdgeInsets.only(
                                                      bottom: 20),
                                                  child: Center(
                                                    child: Text(
                                                      '\$${userproductscontroller.pf[index]['price']}',
                                                      style: TextStyle(
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color.fromARGB(
                                                              255,
                                                              22,
                                                              255,
                                                              30)),
                                                    ),
                                                  )),
                                            ),
                                            Center(
                                                child: Container(
                                              //  color: Color.fromARGB(255, 255, 230, 0),
                                              child: GFButton(
                                                onPressed: () {
                                                  int pin =
                                                      userproductscontroller
                                                          .pf[index]['id'];
                                                  print(pin);
                                                  Get.toNamed('/productdetail',
                                                      arguments: pin);
                                                },
                                                text: "view product",
                                                textStyle: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                                icon: Icon(
                                                  Icons
                                                      .arrow_circle_right_sharp,
                                                  color: Colors.white,
                                                ),
                                                color: Color.fromARGB(
                                                    255, 255, 230, 0),
                                              ),
                                              // child: ElevatedButton.icon(

                                              //     onPressed: () {
                                              //       int pin =
                                              //           controllerpf.pf[index]['id'];
                                              //       print(
                                              //           pin);
                                              //       Get.toNamed(
                                              //           '/productdetail',
                                              //           arguments: pin);
                                              //     },
                                              //     icon: Icon(Icons.arrow_forward_ios_rounded,color: Color.fromARGB(255, 255, 230, 0),),
                                              //     label: Text("view product",style: TextStyle(fontWeight: FontWeight.bold),)),
                                            ))
                                          ],
                                        ),
                                      ));
                                },
                              ),
                            )
                          ],
                        ),
                      ));
                    }),
              ));
  }
}

class Items extends StatefulWidget {
  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  ProductDetailController controllerupp = Get.put(ProductDetailController());
  @override
  Widget build(BuildContext context) {
    controllerupp.proprofile(profileid);
    return GetBuilder<ProductDetailController>(
      builder: (controller1) => controller1.proprofilestatues == false
          ? Center(
              child: SizedBox(
                  width: 100, height: 100, child: CircularProgressIndicator()))
          : Scaffold(
              body: ListView.builder(
                itemCount: controllerupp.pf.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        int pin = controllerupp.pf[index]['id'];
                        print(pin);
                        Get.toNamed('/productdetail', arguments: pin);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("images/background3.jpg")),
                        ),
                        height: 150,
                        child: Row(
                          children: [
                            Container(
                                width: 150,
                                height: 150,
                                child: Image.asset(
                                  "images/10.jpg",
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
                                      height: 50,
                                      child: Text(
                                        '${controllerupp.pf[index]['name']}',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          //   Icon(Icons.star),
                                          //   Icon(Icons.star),
                                          //   Icon(Icons.star),
                                          //   Icon(Icons.star),
                                          //   Icon(Icons.star_half),

                                          Container(
                                            child: GFRating(
                                              padding:
                                                  EdgeInsets.only(right: 30),
                                              size: 30,
                                              value: _rating,
                                              onChanged: (value) {
                                                setState(() {
                                                  _rating = value;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Center(
                              child: Container(
                                  width: 95,
                                  padding: EdgeInsets.only(bottom: 40),
                                  child: Text(
                                    '\$${controllerupp.pf[index]['price']}',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 4, 207, 11)),
                                  )),
                            )
                          ],
                        ),
                      ));
                },
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
        itemCount: ItemsItems.length,
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
                          ItemsItems[index]['image'],
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
                                '${ItemsItems[index]['name']}',
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

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
