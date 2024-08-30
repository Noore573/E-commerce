// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:getwidget/getwidget.dart';
import '../config/userinfo.dart';

import 'main.dart';

final Uri _url = Uri.parse('https://www.facebook.com/');
double _rating = 3;
//final String? ttt = sharedpref?.getString('token');
final String? ttt = UserInfo.user_token;
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
// List<Widget> wishListItems = <Widget>[
//   Image.asset("/images/3.png"),
//    Image.asset("/images/4.png"),
//   // Image.asset("/images/5.png"),
//   // Image.asset("/images/6.png"),
// ];

class Myprofile2 extends StatefulWidget {
  const Myprofile2({super.key});

  @override
  State<Myprofile2> createState() => _Myprofile2State();
}

class _Myprofile2State extends State<Myprofile2> {
  int selectedindex = 0;

  List<Widget> nav = <Widget>[
    pff(),
    // MyItems(),
    myitems2(),
    wishlist(),
    History(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: LineIcons.user,
                  text: 'profile',
                ),
                // GButton(
                //   icon: LineIcons.store,
                //   text: 'MyStore',
                // ),
                GButton(
                  icon: LineIcons.alternateStore,
                  text: 'MyStore2',
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('images/background1.png'))),
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
                            backgroundImage: AssetImage("images/2.png"),
                            shape: GFAvatarShape.circle)),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text(
                  "Noore Sadon ",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text(
                  "Bio ",
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
                        "Address:",
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
                        "Joined in:",
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
                        "Numbers:",
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
                        "Contacts:",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 17),
                      )),
                  Divider(
                    height: 20,
                    thickness: 3,
                    color: Colors.blueGrey,
                  ),
                  GFIconButton(
                    onPressed: () {
                      _launchUrl();
                    },
                    icon: Icon(Icons.facebook),
                    shape: GFIconButtonShape.standard,
                  ),
                ],
              )),
            ],
          ),
        ),
      ]),
    );
  }
}

class wishlist extends StatefulWidget {
  const wishlist({super.key});

  @override
  State<wishlist> createState() => _wishlistState();
}

class _wishlistState extends State<wishlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        thickness: 10,
        isAlwaysShown: true,
        interactive: true,
        child: ListView.builder(
          itemCount: wishListItems.length,
          itemBuilder: (context, index) {
            return Dismissible(
              background: Container(
                color: Colors.red,
                child: Icon(
                  Icons.delete_outline_outlined,
                  color: Colors.white,
                ),
              ),
              key: ValueKey<dynamic>(wishListItems[index]),
              onDismissed: (DismissDirection direction) {
                setState(() {
                  wishListItems.removeAt(index);
                });
              },
              child: InkWell(
                  onTap: () {},
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
                                  margin: EdgeInsets.only(top: 10),
                                  width: 150,
                                  child: Text(
                                    '${wishListItems[index]['name']}',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
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
                                        margin: EdgeInsets.only(top: 15),
                                        child: Row(
                                          children: [
                                            Icon(Icons.person_pin_circle_sharp),
                                            Text(
                                                '${wishListItems[index]['seller']}',
                                                style: TextStyle(fontSize: 20)),
                                          ],
                                        )),
                                  ],
                                ),
                              ],
                            )),
                        SizedBox(
                          width: 15,
                        ),
                        Center(
                          child: Container(
                              width: 50,
                              padding: EdgeInsets.only(bottom: 20),
                              child: Text(
                                '${wishListItems[index]['price']}',
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

class MyItems extends StatefulWidget {
  const MyItems({super.key});

  @override
  State<MyItems> createState() => _MyItemsState();
}

class _MyItemsState extends State<MyItems> {
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
                      image: AssetImage("images/background3.jpg")),
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
                              child: Row(
                                children: [
                                  //   Icon(Icons.star),
                                  //   Icon(Icons.star),
                                  //   Icon(Icons.star),
                                  //   Icon(Icons.star),
                                  //   Icon(Icons.star_half),

                                  Container(
                                    child: GFRating(
                                      padding: EdgeInsets.only(right: 30),
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
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(Icons.person_pin_circle_sharp),
                                Container(
                                    width: 150,
                                    padding: EdgeInsets.only(),
                                    child: Text(
                                        '${wishListItems[index]['seller']}',
                                        style: TextStyle(fontSize: 20))),
                              ],
                            ),
                          ],
                        )),
                    Center(
                      child: Container(
                          width: 50,
                          padding: EdgeInsets.only(bottom: 40),
                          child: Text(
                            '${wishListItems[index]['price']}',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          )),
                    )
                  ],
                ),
              ));
        },
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
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: wishListItems.length,
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
                    child: Image.asset('${wishListItems[index]['image']}')),
                InkWell(
                  onTap: () {
                    Get.bottomSheet(
                        enterBottomSheetDuration: Duration(milliseconds: 500),
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
                                child: Image.asset(
                                  wishListItems[index]['image'],
                                  // fit: BoxFit.fill,
                                ),
                              ),
                              Text(
                                '${wishListItems[index]['name']}',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              Container(
                                child: GFRating(
                                  padding: EdgeInsets.only(right: 30),
                                  size: 30,
                                  value: _rating,
                                  onChanged: (value) {
                                    setState(() {
                                      _rating = wishListItems[index]['rating'];
                                    });
                                  },
                                ),
                              ),
                              Center(
                                child: Container(
                                    width: 50,
                                    padding: EdgeInsets.only(bottom: 20),
                                    child: Text(
                                      '${wishListItems[index]['price']}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green),
                                    )),
                              ),
                              Center(
                                  child: ElevatedButton.icon(
                                      onPressed: () {},
                                      icon:
                                          Icon(Icons.arrow_forward_ios_rounded),
                                      label: Text("view product")))
                            ],
                          ),
                        ));
                  },
                )
              ],
            ),
          ));
        });
  }
}

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
