import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:http/http.dart' as http;
//import 'package:untitled4/components/custom_text.dart';
//import 'package:untitled4/modules/Home/Home_controller.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:project2/Settings.dart';
import 'package:project2/lory/ProductDetail_controller.dart';

import 'config/gobals.dart';
import 'controllers/profile_controller.dart';
import 'main.dart';
import 'native_services/secure_storage.dart';
import 'server.dart';

//var isDarkMode = false.obs;
List<String> imgname3 = <String>[
  'images/1681374085925.jpg',
  'images/1681374145304.jpg',
  'images/pants111.png',
  'images/pngegg.png',
  'images/hats111.png',
  'images/bags111.png',
  'images/acc.png',
  'images/watches111.png',
  'images/shoes111.png',
  'images/sportwear111.png',
  'images/jacket111.png',
  //'images/3.jpg',
];
final List<String> names = <String>[
  '8'.tr,
  '9'.tr,
  '10'.tr,
  '11'.tr,
  '12'.tr,
  '13'.tr,
  '14'.tr,
  '15'.tr,
  '16'.tr,
  '17'.tr,
  '18'.tr,
];
final List<String> names2 = <String>[
  'dress',
  'shorts',
  'pants',
  'shirts',
  'hats',
  'bags',
  'accessories',
  'watches',
  'shoes',
  'sportwear',
  'jackets',
];
List<CardItem> items = [
  CardItem(
    AssetImage: 'images/6.jpg',
    title: 'Nike',
    subtitle: '\$99',
  ),
  CardItem(
    AssetImage: 'images/5.jpg',
    title: 'White Shirt',
    subtitle: '\$75',
  ),
  CardItem(
    AssetImage: 'images/3.jpg',
    title: 'Zara',
    subtitle: '\$99',
  ),
  CardItem(
    AssetImage: 'images/4.jpg',
    title: 'GUCCI',
    subtitle: '\$100',
  ),
];
List<ProductItem> itemss = [
  ProductItem(
    AssetImage: 'images/7.jpg',
    title: 'GUCCI',
    subtitle: '\$200',
  ),
  ProductItem(
    AssetImage: 'images/8.jpg',
    title: 'Zara',
    subtitle: '\$100',
  ),
  ProductItem(
    AssetImage: 'images/9.jpg',
    title: 'GUCCI',
    subtitle: '\$88',
  ),
  ProductItem(
    AssetImage: 'images/10.jpg',
    title: 'GUCCI',
    subtitle: '\$100',
  ),
];
final List<String> imageList = [
  "images/car.jpg",
  "images/car1.jpg",
  "images/car5.jpg",
  "images/car6.jpg",
  "images/car7.jpg",
  "images/car8.jpg",
  "images/car2.jpg",
  "images/car4.jpg",
];
ProductDetailController controllerpf = Get.put(ProductDetailController());

List<Widget> nav = <Widget>[
  Home1(),
  Catagories(),
  SpecialOffers(),
  //catagories
];

class GuestHome extends StatefulWidget {
  @override
  State<GuestHome> createState() => _GuestHomeState();
}

class _GuestHomeState extends State<GuestHome> {
  int selectedindex = 0;
  var checkonline;
  RxBool IsOnline = true.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        //backgroundColor: Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              color: Color.fromARGB(255, 255, 230, 0),
              // color: Colors.black
              child: InkWell(
                child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 230, 0),
                    ),
                    accountName: Text(
                      'guest',
                      style: TextStyle(color: Colors.black, fontSize: 27),
                    ),
                    accountEmail:
                        Text("", style: TextStyle(color: Colors.black)),
                    arrowColor: Colors.black,
                    currentAccountPicture:
                        //controller3.photo=""?
                        Image.asset("images/defaultavatar.jpg")
                    // :Image.asset("images/defaultavatar.jpg")

                    //  Image.network('${ServerConfig.domainNameServer}/e-commerce-main/storage/app/public/product_photos/1684079833.jpg'),
                    ),
              ),
            ),
            Row(
              children: [
                // SizedBox(
                //   width: 20,
                // ),
                // Container(
                //     // width: double.infinity,
                //     height: 50,
                //     child: IsOnline == true
                //         ? Icon(
                //             Icons.radio_button_on_outlined,
                //             color: Color.fromARGB(255, 19, 246, 26),
                //           )
                //         : Icon(Icons.radio_button_on_outlined)),
                // SizedBox(
                //   width: 10,
                // ),
                // Container(
                //   child: Text(
                //     "online statues",
                //     style: TextStyle(fontSize: 20,color:Color.fromARGB(255, 255, 230, 0),),
                //   ),
                // )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {
                print("vas!");
                Get.snackbar("please Login!", "",backgroundColor: Color.fromARGB(255, 255, 230, 0),);
              },
              child: Container(
                height: 40,
                child: Row(
                  children: [
                    SizedBox(
                      width: 18,
                    ),
                    Icon(
                      Icons.favorite,
                      color: isDarkMode.value == true
                          ? Color.fromARGB(255, 255, 230, 0)
                          : Color.fromARGB(255, 0, 0, 0),
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Text("45".tr,
                          style: TextStyle(
                            fontSize: 20,
                            color: isDarkMode.value == true
                                ? Color.fromARGB(255, 255, 230, 0)
                                : Color.fromARGB(255, 0, 0, 0),
                          )),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {
                // Get.toNamed('/cart1');
                // print("cart!");
                Get.snackbar("please Login!", "",backgroundColor: Color.fromARGB(255, 255, 230, 0),);
              },
              child: Container(
                height: 40,
                child: Row(
                  children: [
                    SizedBox(
                      width: 18,
                    ),
                    Icon(
                      Icons.shopping_cart_sharp,
                      color: isDarkMode.value == true
                          ? Color.fromARGB(255, 255, 230, 0)
                          : Color.fromARGB(255, 0, 0, 0),
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Text(
                        "46".tr,
                        style: TextStyle(
                          fontSize: 20,
                          color: isDarkMode.value == true
                              ? Color.fromARGB(255, 255, 230, 0)
                              : Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // SizedBox(
            //   height: 5,
            // ),
            Container(
                //width:120,
                height: 200,
                alignment: Alignment.topLeft,
                child:
                    //  GFToggle(
                    //   onChanged: (val) {
                    //     print(val);
                    //     isDarkMode.value = val!;
                    //     Get.changeTheme(isDarkMode.value
                    //         ? Themeschanger.customLight
                    //         : Themeschanger.customDark);
                    //   },
                    //   value: isDarkMode.value,
                    //   type: GFToggleType.android,

                    //   enabledTrackColor: Color.fromARGB(255, 255, 230, 0),
                    //   disabledTrackColor: Color.fromARGB(255, 0, 11, 67),
                    //   enabledText: "light",
                    //   //enabledTextStyle: TextStyle(fontSize: 20),
                    //   disabledText: "Dark",
                    // ),
                    Row(
                  children: [
                    Container(
                      height: 75,
                      child: Switch(
                        value: isDarkMode.value,
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            isDarkMode.value = value;
                            isDarkMode == false
                                ? backimage.value = bi1
                                : backimage.value = bi2;
                            //  "images/81f4a63234bd40fe099dd641e31f5aa4.jpg";
                          });
                          Get.changeTheme(isDarkMode.value
                              ? Themeschanger.customDark
                              : Themeschanger.customLight);
                        },
                      ),
                    ),
                    Container(
                      child: isDarkMode.value == false
                          ? Icon(
                              Icons.sunny,
                              color: Color.fromARGB(255, 255, 230, 0),
                            )
                          : Icon(Icons.dark_mode_outlined),
                    )
                  ],
                ))
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                // Get.toNamed("/notif");
                Get.snackbar("please Login!", "",backgroundColor: Color.fromARGB(255, 255, 230, 0),);
              },
              icon: Icon(Icons.notifications)),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ProductSearchDelegate(),
              );
            },
          ),
          // InkWell(
          //   onTap: () {
          //     Get.toNamed("/notif");
          //   },
          //   child: GFBadge(
          //       child: Icon(Icons.notifications), shape: GFBadgeShape.circle),
          // )
        ],
        //backgroundColor: Color.fromARGB(255, 255, 230, 0),
      ),
      body: nav.elementAt(selectedindex),
      bottomNavigationBar: Obx(() {
        return Container(
          decoration: BoxDecoration(
            color: isDarkMode.value == false
                ? Colors.white
                : Color.fromARGB(255, 0, 0, 0),
            boxShadow: [
              // BoxShadow(
              //   blurRadius: 20,
              //   color: Colors.black.withOpacity(.1),
              //)
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                rippleColor: Color.fromARGB(255, 255, 230, 0),
                hoverColor: Colors.black,
                gap: 8,
                activeColor: Colors.black,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: Color.fromARGB(255, 255, 230, 0),
                color: isDarkMode.value == true
                    ? Color.fromARGB(255, 255, 230, 0)
                    : Color.fromARGB(255, 0, 0, 0),
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    text: "4".tr,
                  ),
                  GButton(
                    icon: LineIcons.alternateStore,
                    text: '5'.tr,
                  ),
                  GButton(
                    icon: Icons.discount_outlined,
                    text: '6'.tr,
                  ),
                  // GButton(
                  //   icon: Icons.settings_outlined,
                  //   text: '7'.tr,
                  // ),
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
        );
      }),
    );
  }
}


class Home1 extends StatefulWidget {
  const Home1({super.key});

  @override
  State<Home1> createState() => _Home1State();
}

RxString backimage = "images/back3.jpg".obs;
String bi1 = "images/back3.jpg";
String bi2 = "images/81f4a63234bd40fe099dd641e31f5aa4.jpg";

class _Home1State extends State<Home1> {
  @override
  Widget build(BuildContext context) {
    controllerpf.profiltercontroller();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Get.toNamed('/uploadproduct');
          Get.snackbar("please Login!", "",backgroundColor: Color.fromARGB(255, 255, 230, 0),);
        },
        mouseCursor: SystemMouseCursors.click,
        backgroundColor: Color.fromARGB(255, 255, 230, 0),
        child: Icon(
          Icons.shopping_basket_outlined,
          color: Colors.black,
        ),
      ),
      body: Obx(() {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(backimage.value),
              fit: BoxFit.fill,
              opacity: 0.4,
            ),
          ),
          child: GetBuilder<ProductDetailController>(
            builder: (controllerbs) => controllerbs.pfstatues == false
                ? Center(
                    child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator()))
                : ListView(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      _ListViewCategory(),

                      SizedBox(
                        height: 30,
                      ),
                      GFCarousel(
                            autoPlay: true,
                            autoPlayAnimationDuration: Duration(milliseconds: 500),
                            autoPlayCurve: Curves.bounceInOut,
                            enlargeMainPage: true,
                            hasPagination: true,
                            enableInfiniteScroll: true,
                            

                          items: imageList.map(
                           (url) {
                           return Container(
                            width:double.infinity,
                             margin: EdgeInsets.all(8.0),
                             child: ClipRRect(
                               borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                child: Image.asset(
                                   url,
                                   fit: BoxFit.fill,
                                    //width: 1000.0
                                 ),
                              ),
                            );
                            },
                           ).toList(),
                          onPageChanged: (index) {
                            setState(() {
                              index;
                            });
                          },
                       ),
                      GetBuilder<ProductDetailController>(
                        builder: (controllerbs) =>
                            controllerbs.pfstatues == false
                                ? Center(
                                    child: SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator()))
                                : Container(
                                    height: 70,
                                    // decoration: BoxDecoration(image: DecorationImage(
                                    //   image: AssetImage('images/5c2fdd99b189119c2cab6e116469606a.jpg  '),
                                    //   fit: BoxFit.fill,
                                    //),
                                    //),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("1".tr,
                                            style: TextStyle(
                                              fontSize: 18,
                                            )),
                                        Text("2".tr,
                                            style: TextStyle(
                                              fontSize: 18,
                                            )),
                                      ],
                                    ),
                                  ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 256,
                        child: ListView.separated(
                            padding: EdgeInsets.all(16),
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            separatorBuilder: (context, index) => SizedBox(
                                  width: 12,
                                ),
                            itemBuilder: (context, index) =>
                                //Container(color:Colors.red , child:Text("nnn"))

                                // buildCard(index),
                                Container(
                                  width: 200,

                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: AspectRatio(
                                          aspectRatio: 4 / 3,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                              child: Material(
                                                child: Ink.image(
                                                    // image: AssetImage(
                                                    //     "images/6.jpg"),
                                                    image: NetworkImage(
                                                      '${ServerConfig.domainNameServer}/storage/${controllerpf.pf[index]['photo']}',
                                                    ),
                                                    fit: BoxFit.cover,
                                                    child: InkWell(
                                                      onTap: () {
                                                        // int pin = controllerpf
                                                        //     .pf[index]['id'];
                                                        // print(pin);
                                                        // Get.toNamed(
                                                        //     '/productdetail',
                                                        //     arguments: pin);
                                                        Get.snackbar("please Login!", "",backgroundColor: Color.fromARGB(255, 255, 230, 0),);
                                                      },
                                                      onLongPress: () {
                                                        var _rating = 4;
                                                        Get.bottomSheet(
                                                            enterBottomSheetDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            elevation: 100,
                                                            Container(
                                                              height: 400,
                                                              width: 300,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image: DecorationImage(
                                                                    image: AssetImage(
                                                                        "images/back5.jpg"),
                                                                    opacity:
                                                                        0.9,
                                                                    fit: BoxFit
                                                                        .fill),
                                                                // color: Color
                                                                //     .fromARGB(
                                                                //         255,
                                                                //         255,
                                                                //         255,
                                                                //         255),
                                                                borderRadius: BorderRadius.only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            20),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            20)),
                                                                border:
                                                                    Border.all(
                                                                  width: 4,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          255,
                                                                          230,
                                                                          0),
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
                                                                    child: Image
                                                                        .network(
                                                                      '${ServerConfig.domainNameServer}/storage/${controllerpf.pf[index]['photo']}',
                                                                      height:
                                                                          170,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      width: double
                                                                          .infinity,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          10),
                                                                  Text(
                                                                    '${controllerpf.pf[index]['name']}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            25,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          10),
                                                                  Center(
                                                                    child: Container(
                                                                        width: 150,
                                                                        padding: EdgeInsets.only(bottom: 20),
                                                                        child: Center(
                                                                          child:
                                                                              Text(
                                                                            '\$${controllerpf.pf[index]['price']}',
                                                                            style: TextStyle(
                                                                                fontSize: 25,
                                                                                fontWeight: FontWeight.bold,
                                                                                color: Color.fromARGB(255, 224, 0, 0)),
                                                                          ),
                                                                        )),
                                                                  ),
                                                                  Center(
                                                                      child:
                                                                          Container(
                                                                    //  color: Color.fromARGB(255, 255, 230, 0),
                                                                    child:
                                                                        GFButton(
                                                                      onPressed:
                                                                          () {
                                                                        // int pin =
                                                                        //     controllerpf.pf[index]['id'];
                                                                        // print(
                                                                        //     pin);
                                                                        // Get.toNamed(
                                                                        //     '/productdetail',
                                                                        //     arguments:
                                                                        //         pin);
                                                                        Get.snackbar("please Login!", "",backgroundColor: Color.fromARGB(255, 255, 230, 0),);
                                                                      },
                                                                      text:
                                                                          "view product",
                                                                      textStyle:
                                                                          TextStyle(
                                                                              fontWeight: FontWeight.bold),
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .arrow_circle_right_sharp,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          255,
                                                                          230,
                                                                          0),
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
                                                    )),
                                              )),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        controllerpf.pf[index]['name'],
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                      // Text(
                                      // controllerpf.pf[index]['name'],
                                      //   style: TextStyle(
                                      //     color: Colors.black,
                                      //     fontSize: 20,
                                      //   ),
                                      // ),
                                      Column(
                                        children: [
                                          Container(
                                            child: GFRating(
                                              padding:
                                                  EdgeInsets.only(right: 30),
                                              color: Color.fromARGB(
                                                  255, 249, 224, 0),
                                              size: 25,
                                              value: 5,
                                              onChanged: (double rating) {},
                                            ),
                                          ),
                                          Text(
                                            '\$${controllerpf.pf[index]['price']}',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 33, 227, 39),
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  //Image.asset(item.AssetImage,fit: BoxFit.cover,)
                                )),
                      ),
                      // InkWell(
                      //   onTap: () {
                      //   //  Get.toNamed('/women', arguments: items);
                      //   },
                      //   child: Container(
                      //     child: Image.asset('images/6.jpg'),
                      //   ),
                      // ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("3".tr,
                              style: TextStyle(
                                fontSize: 18,
                              )),
                          Text("2".tr,
                              style: TextStyle(
                                fontSize: 18,
                              )),
                        ],
                      ),

                      Container(
                        height: 256,
                        child: ListView.separated(
                          padding: EdgeInsets.all(16),
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          separatorBuilder: (context, _) => SizedBox(
                            width: 12,
                          ),
                          itemBuilder: (context, index) =>
                              //ProductCard(item: itemss[index]),
                              Container(
                            width: 200,
                            child: Column(
                              children: [
                                Expanded(
                                  child: AspectRatio(
                                    aspectRatio: 4 / 3,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(40),
                                        child: Material(
                                          child: Ink.image(
                                              image: NetworkImage(
                                                '${ServerConfig.domainNameServer}/storage/${controllerpf.pf[index + 5]['photo']}',
                                              ),
                                              //image: AssetImage("images/6.jpg"),
                                              //  Image.network(
                                              // '${ServerConfig.domainNameServer}/storage/${controllerpf.pf[index]['photo']}',
                                              fit: BoxFit.cover,
                                              child: InkWell(
                                                onTap: () {
                                                  // int pin = controllerpf
                                                  //     .pf[index]['id'];
                                                  // print(pin);
                                                  // Get.toNamed('/productdetail',
                                                  //     arguments: pin);
                                                  Get.snackbar("please Login!", "",backgroundColor: Color.fromARGB(255, 255, 230, 0),);
                                                },
                                                onLongPress: () {
                                                  var _rating = 4;
                                                  Get.bottomSheet(
                                                      enterBottomSheetDuration:
                                                          Duration(
                                                              milliseconds:
                                                                  500),
                                                      elevation: 100,
                                                      Container(
                                                        height: 400,
                                                        width: 300,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          20),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          20)),
                                                          //backgroundBlendMode: BlendMode.darken
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              height: 200,
                                                              width: 200,
                                                              child: Image.asset(
                                                                  // controllerpf.pf[index!]['image'],
                                                                  "images/6.jpg"
                                                                  // fit: BoxFit.fill,
                                                                  ),
                                                            ),
                                                            // Text(
                                                            //   '${controllerpf.pf[index + 5]['name']}',
                                                            //   style: TextStyle(
                                                            //       fontSize: 25,
                                                            //       fontWeight:
                                                            //           FontWeight
                                                            //               .bold),
                                                            // ),
                                                            Center(
                                                              child: Container(
                                                                  width: 50,
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          bottom:
                                                                              20),
                                                                  child: Text(
                                                                    ' ${controllerpf.pf[index + 5]['price']}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Colors
                                                                            .green),
                                                                  )),
                                                            ),
                                                            Center(
                                                                child: ElevatedButton
                                                                    .icon(
                                                                        onPressed:
                                                                            () {
                                                                          // int pin =
                                                                          //     controllerpf.pf[index]['id'];
                                                                          // print(
                                                                          //     pin);
                                                                          // Get.toNamed(
                                                                          //     '/productdetail',
                                                                          //     arguments: pin);
                                                                          Get.snackbar("please Login!", "",backgroundColor: Color.fromARGB(255, 255, 230, 0),);
                                                                        },
                                                                        icon: Icon(Icons
                                                                            .arrow_forward_ios_rounded),
                                                                        label: Text(
                                                                            "view product")))
                                                          ],
                                                        ),
                                                      ));
                                                },
                                              )),
                                        )),
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  controllerpf.pf[index + 5]['name'],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                                Container(
                                  child: GFRating(
                                    padding: EdgeInsets.only(right: 30),
                                    color: Color.fromARGB(255, 249, 224, 0),
                                    size: 25,
                                    value: 5,
                                    onChanged: (double rating) {},
                                  ),
                                ),
                                Text(
                                  controllerpf.pf[index + 5]['price'],
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 33, 227, 39),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            //Image.asset(item.AssetImage,fit: BoxFit.cover,)
                          ),
                        ),
                      ),

                      //  child:
                    ],
                  ),
          ),
        );
      }),
    );
  }
}

Widget buildCard(int index) => Container(
      width: 200,
      child: Column(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 4 / 3,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Material(
                    child: Ink.image(
                        image: AssetImage("images/6.jpg"),
                        fit: BoxFit.cover,
                        child: InkWell(
                          onTap: () {
                            var _rating = 4;
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
                                        topRight: Radius.circular(20),
                                      ),
                                      border: Border.all(
                                        color: Color.fromARGB(255, 255, 230, 0),
                                      )
                                      //backgroundBlendMode: BlendMode.darken
                                      ),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 200,
                                        width: 200,
                                        // child: Image.asset(
                                        //     // controllerpf.pf[index!]['image'],
                                        //     "images/6.jpg"
                                        //     // fit: BoxFit.fill,
                                        //     ),
                                        child: ClipRRect(
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
                                      ),
                                      Text(
                                        '${controllerpf.pf[index]['name']}',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Center(
                                        child: Row(
                                          children: [
                                            Container(
                                                width: 200,
                                                padding:
                                                    EdgeInsets.only(bottom: 20),
                                                child: Text(
                                                  '\$${controllerpf.pf[index]['price']}',
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.green),
                                                )),
                                          ],
                                        ),
                                      ),
                                      Center(
                                          child: ElevatedButton.icon(
                                              onPressed: () {
                                                // int pin = controllerpf.pf[index]
                                                //     ['id'];
                                                // print(pin);
                                                // Get.toNamed('/productdetail',
                                                //     arguments: pin);
                                                Get.snackbar("please Login!", "",backgroundColor: Color.fromARGB(255, 255, 230, 0),);
                                              },
                                              icon: Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                color: Color.fromARGB(
                                                    255, 255, 230, 0),
                                              ),
                                              label: Text("view product")))
                                    ],
                                  ),
                                ));
                          },
                        )),
                  )),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            controllerpf.pf[index]['name'],
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          Row(
            children: [
              Container(
                child: GFRating(
                  padding: EdgeInsets.only(right: 30),
                  size: 30,
                  value: 5,
                  onChanged: (double rating) {},
                ),
              ),
              Text(
                controllerpf.pf[index]['price'],
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 0, 0), fontSize: 16),
              ),
            ],
          ),
        ],
      ),
      //Image.asset(item.AssetImage,fit: BoxFit.cover,)
    );

Widget ProductCard({
  required ProductItem item,
}) =>
    Container(
      width: 200,
      child: Column(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 4 / 3,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Material(
                    child: Ink.image(
                        image: AssetImage(item.AssetImage),
                        fit: BoxFit.cover,
                        child: InkWell(onTap: () {})),
                  )),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            item.title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          Text(
            item.subtitle,
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ],
      ),
    );

ShoePage({required CardItem item}) {}

Widget _ListViewCategory() {
  return Container(
    height: 100,
    child: ListView.separated(
      itemCount: names.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Column(
          children: [
            InkWell(
              onTap: () {
                //Get.toNamed("/${names2[index]}");
                Get.snackbar("please Login!", "",backgroundColor: Color.fromARGB(255, 255, 230, 0),);
              },
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black54),
                  height: 60,
                  width: 60,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Image.asset(imgname3[index]),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            //CustomText(text: names[index],),
            Text("${names[index]}"),
          ],
        );
      },
      separatorBuilder: (context, int index) => SizedBox(
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

class CardItem {
  final String AssetImage;
  final String title;
  final String subtitle;

  const CardItem({
    required this.AssetImage,
    required this.title,
    required this.subtitle,
  });
}

class Search extends SearchDelegate {
  List names = ["dress", "shorts", "pants", "shoes", "hats"];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("$query");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List filternames =
        names.where((element) => element.contains(query)).toList();

    return ListView.builder(
        itemCount: query == "" ? names.length : filternames.length,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              query = query == "" ? names[i] : filternames[i];
            },
            child: Container(
                padding: EdgeInsets.all(10),
                child: query == ""
                    ? Text(
                        "${names[i]}",
                        style: TextStyle(fontSize: 25),
                      )
                    : Text(
                        "${filternames[i]}",
                        style: TextStyle(fontSize: 25),
                      )),
          );
        });
  }
}

class SpecialOffers extends StatefulWidget {
  const SpecialOffers({super.key});

  @override
  State<SpecialOffers> createState() => _SpecialOffersState();
}

class _SpecialOffersState extends State<SpecialOffers> {
  List<Container> cards = [
    Container(
      alignment: Alignment.center,
      child: Stack(
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 5)),
              child: Image.asset(
                "images/6.jpg",
                fit: BoxFit.fill,
              )),
          Positioned(
            top: 10,
            right: 1,
            child: Container(
                width: 200,
                height: 200,
                child: Image.asset(
                  "images/sale1.png",
                  fit: BoxFit.fill,
                )),
          ),
        ],
      ),
      color: Colors.red,
    ),
    Container(
      alignment: Alignment.center,
      child: Stack(
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 5)),
              child: Image.asset(
                "images/5.jpg",
                fit: BoxFit.fill,
              )),
          Positioned(
            top: 10,
            right: 1,
            child: Container(
                width: 200,
                height: 200,
                child: Image.asset(
                  "images/sale.png",
                  fit: BoxFit.fill,
                )),
          ),
        ],
      ),
      color: Colors.red,
    ),
    Container(
      alignment: Alignment.center,
      child: Stack(
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 5)),
              child: Image.asset(
                "images/9.jpg",
                fit: BoxFit.fill,
              )),
          Positioned(
            top: 10,
            right: 1,
            child: Container(
                width: 200,
                height: 200,
                child: Image.asset(
                  "images/sale2.png",
                  fit: BoxFit.fill,
                )),
          ),
        ],
      ),
      color: Colors.red,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CardSwiper(
          cardsCount: cards.length,
          cardBuilder: (context, index) => cards[index],
        ),
      ),
    );
  }
}

// _ListViewProducts(),

/* Widget bottomNavigationBar() {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller)=>
       BottomNavigationBar(items:
      [BottomNavigationBarItem(
        activeIcon: Text("Explore"),
        label: '',
         icon: InkWell(onTap: (){Get.toNamed("/home");},
             child: Icon(Icons.home_filled,f.)),),
        BottomNavigationBarItem(
          activeIcon: Text("cart"),
          label: '',
          icon: InkWell(onTap: (){Get.toNamed("/cart");},child: Icon(Icons.card_travel,)),),
        BottomNavigationBarItem(
          activeIcon: Text("Profile"),
          label: '',
          icon: InkWell(onTap: (){Get.toNamed("/profile");},child: Icon(Icons.person_rounded,)),),
      ],
      currentIndex: controller.navigatorvalue,
        onTap: (index)=>controller.changeSelectedValue(index),


      ),
    );
  }
*/

/*
class Search extends SearchDelegate{
  List names=[
    "dress","shorts","pants","shoes","hats"
  ];


  @override
  List<Widget>? buildActions(BuildContext context) {
 return[IconButton(onPressed: (){
   query="";
 },
     icon: Icon(Icons.close))];
  }
  @override
  Widget? buildLeading(BuildContext context) {
return IconButton(onPressed: (){close(context, null);},
    icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
  return Text("$query");
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    List filternames=names.where((element) => element.contains(query)).toList();


   return ListView.builder(
     itemCount: query==""? names.length:filternames.length,
     itemBuilder:(context,i){
       return InkWell(
         onTap: (){
           query=query==""? names[i]:filternames[i];
         },
         child: Container(
             padding: EdgeInsets.all(10),
             child: query==""? Text("${names[i]}", style: TextStyle(fontSize: 25),):
             Text("${filternames[i]}",style: TextStyle(fontSize: 25),)
         ),
       );


       });

     //  Text("${names[i]}",style: TextStyle(fontSize: 25),));

  }

}*/

//searchd
class ProductSearchDelegate extends SearchDelegate<String> {
  ProductDetailController searchcontroller = Get.find();
  final String searchUrl =
      '${ServerConfig.domainNameServer + ServerConfig.searchpro}';
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List searchlist = [];
    return FutureBuilder(
      future: searchProducts(query),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print('here');
          searchlist = snapshot.data!;
          return ListView.builder(
            itemCount: searchlist.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(searchlist[index]['name']),
                onTap: () {
                  //c.deleteproductrc(searchlist[index]['id']);
                  int pin = searchcontroller.pf[index]['id'];
                  print(pin);
                  //Get.toNamed('/productdetail', arguments: pin);
                  Get.snackbar("please Login!", "",backgroundColor: Color.fromARGB(255, 255, 230, 0),);
                },
              );
            },
          );
        } else if (snapshot.hasError) {
          print('hereerror');
          return Text('Error: ${snapshot.error}');
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.search),
          title: Text('...$query'),
          onTap: () {
            showResults(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.history),
          title: Text('26'),
          onTap: () {},
        ),
      ],
    );
  }

  Future<List> searchProducts(String query) async {
    print('$searchUrl?s=$query');
    SecureStorage storage = SecureStorage();
    String? cookies = await storage.read('cookies');
    String? token = await storage.read('token');
    var urlsearch =
        Uri.parse(ServerConfig.domainNameServer + ServerConfig.searchpro);
    var response = await http.post(urlsearch, headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token",
      'Cookie': '$cookies',
    }, body: {
      "name": query,
    });
    print(urlsearch);
    print("searching..");
    if (response.statusCode == 200) {
      print(response.statusCode);
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      List<dynamic> se = jsonResponse;

      return se;
    } else {
      print(response.statusCode);
      //throw Exception('');
      return [];
    }
  }
}
class Catagories extends StatelessWidget {
  @override
  List<String> cimages = [
    "images/cdress.jpg",
    "images/cshorts.jpg",
    "images/cpants.jpg",
    "images/cshirt.jpg",
    "images/chat.png",
    "images/cbag.jpg",
    "images/cacc.jpg",
    "images/cwatch.jpg",
    "images/cshoe.jpg",
    "images/csport.jpg",
  ];
  Widget build(BuildContext context) {
    return
        //title: 'GridView Builder',

        Scaffold(
      body: GridView.builder(
        itemCount: 10,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 2,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              Get.toNamed("/${names2[index]}");
            },
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.primaries[index],width: 3),
              ),
              //color: Colors.primaries[index],
              child: Image.asset(
                //"images/cdress.jpg",
                cimages[index],
                fit: BoxFit.fill,
              ),
            ),
          );
        },
      ),
    );
  }
}
