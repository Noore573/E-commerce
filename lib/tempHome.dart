import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:http/http.dart';

//import 'package:untitled4/components/custom_text.dart';
//import 'package:untitled4/modules/Home/Home_controller.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:project2/Settings.dart';
import 'package:project2/lory/ProductDetail_controller.dart';

final List<String> names = <String>[
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
List<String> imgname = <String>[
  'images/6.jpg',
  'images/5.jpg',
  'images/3.jpg',
  'images/4.jpg',
  'images/8.jpg',
  'images/9.jpg',
  'images/4.jpg',
  'images/8.jpg',
  'images/9.jpg',
   'images/6.jpg',
  'images/5.jpg',
  'images/3.jpg',
];
List<String> imgname2 = <String>[
  
  'images/4.jpg',
  'images/8.jpg',
  'images/9.jpg',
   'images/6.jpg',
  'images/5.jpg',
  'images/3.jpg',
  'images/4.jpg',
  'images/8.jpg',
  'images/9.jpg',
   'images/6.jpg',
  'images/5.jpg',
  'images/3.jpg',
];
List<String> imgname3 = <String>[
  
  'images/1681374085925.jpg',
  'images/1681374145304.jpg',
  'images/pants.jpg',
   'images/shirt.jpg',
  'images/1681374175322.jpg',
  'images/3.jpg',
  'images/1681374085925.jpg',
  'images/1681374145304.jpg',
  'images/pants.jpg',
   'images/shirt.jpg',
  'images/1681374175322.jpg',
  'images/3.jpg',
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
ProductDetailController controllerpf = Get.put(ProductDetailController());

List<Widget> nav = <Widget>[
  Home1(),
  Home1(),
  SpecialOffers(),
  //catagories
  Settings(),
];

class HomeTemp extends StatefulWidget {
  @override
  State<HomeTemp> createState() => _HomeState();
}

class _HomeState extends State<HomeTemp> {
  int selectedindex = 0;
  var checkonline;
  RxBool IsOnline = true.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              color: Color.fromARGB(255, 255, 230, 0),
              // color: Colors.black
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 230, 0),
                ),
                accountName: Text(
                  'Noore Sadon',
                  style: TextStyle(color: Colors.black, fontSize: 27),
                ),
                accountEmail: Text("", style: TextStyle(color: Colors.black)),
                arrowColor: Colors.black,
                currentAccountPicture: Image.asset("images/logo.png"),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                    // width: double.infinity,
                    height: 50,
                    child: IsOnline == true
                        ? Icon(
                            Icons.radio_button_on_outlined,
                            color: Color.fromARGB(255, 19, 246, 26),
                          )
                        : Icon(Icons.radio_button_on_outlined)),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Text(
                    "online statues",
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {
                print("vas!");
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
                      color: Colors.black,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child:
                          Text("Favourites ", style: TextStyle(fontSize: 20)),
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
                Get.toNamed('/cart1');
                print("cart!");
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
                      color: Color.fromARGB(255, 0, 0, 0),
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Text(
                        "Favourites ",
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 230, 0),
        //color: Colors.amber,
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
              rippleColor: Color.fromARGB(255, 255, 230, 0),
              hoverColor: Colors.black,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Color.fromARGB(255, 255, 230, 0),
              color: Colors.black,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.alternateStore,
                  text: 'Catagories',
                ),
                GButton(
                  icon: Icons.discount_outlined,
                  text: 'Special Offers',
                ),
                GButton(
                  icon: Icons.settings_outlined,
                  text: 'Settings',
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

class Home1 extends StatelessWidget {
  const Home1({super.key});

  @override
  Widget build(BuildContext context) {
    controllerpf.profiltercontroller();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("23");
        },
        mouseCursor: SystemMouseCursors.click,
        backgroundColor: Color.fromARGB(255, 255, 230, 0),
        child: Icon(
          Icons.shopping_basket_outlined,
          color: Colors.black,
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          _ListViewCategory(),

          SizedBox(
            height: 30,
          ),

          GetBuilder<ProductDetailController>(
            builder: (controllerbs) => controllerbs.pfstatues == false
                ? Center(
                    child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator()))
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Best Selling",
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      Text("See all",
                          style: TextStyle(
                            fontSize: 18,
                          )),
                    ],
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
                                  borderRadius: BorderRadius.circular(40),
                                  child: Material(
                                    child: Ink.image(
                                        //image: AssetImage("images/6.jpg"),
                                        image:AssetImage(imgname[index]),
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
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(20),
                                                            topRight:
                                                                Radius.circular(
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
                                                      Text(
                                                        '${controllerpf.pf[index]['name']}',
                                                        style: TextStyle(
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Center(
                                                        child: Container(
                                                            width: 50,
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom: 20),
                                                            child: Text(
                                                              ' ${controllerpf.pf[index]['price']}',
                                                              style: TextStyle(
                                                                  fontSize: 20,
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
                                                                    int pin = controllerpf
                                                                            .pf[
                                                                        index]['id'];
                                                                    print(pin);
                                                                    Get.toNamed(
                                                                        '/productdetail',
                                                                        arguments:
                                                                            pin);
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
                          // Text(
                          // controllerpf.pf[index]['name'],
                          //   style: TextStyle(
                          //     color: Colors.black,
                          //     fontSize: 20,
                          //   ),
                          // ),
                          // Text(
                          //   controllerpf.pf[index]['price'],
                          //   style: TextStyle(color: Colors.grey, fontSize: 16),
                          // ),
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
              Text("On sale",
                  style: TextStyle(
                    fontSize: 18,
                  )),
              Text("See all",
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
                                  //image: AssetImage("images/6.jpg"),
                                 image: AssetImage(imgname2[index]),
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
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight:
                                                      Radius.circular(20)),
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
                                                Text(
                                                  '${controllerpf.pf[index + 5]['name']}',
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Center(
                                                  child: Container(
                                                      width: 50,
                                                      padding: EdgeInsets.only(
                                                          bottom: 20),
                                                      child: Text(
                                                        ' ${controllerpf.pf[index + 5]['price']}',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.green),
                                                      )),
                                                ),
                                                Center(
                                                    child: ElevatedButton.icon(
                                                        onPressed: () {
                                                          int pin = controllerpf
                                                              .pf[index]['id'];
                                                          print(pin);
                                                          Get.toNamed(
                                                              '/productdetail',
                                                              arguments: pin);
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
                    // Text(
                    // controllerpf.pf[index+5]['name'],
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 20,
                    //   ),
                    // ),
                    // Text(
                    //   controllerpf.pf[index+5]['price'],
                    //   style: TextStyle(color: Colors.grey, fontSize: 16),
                    // ),
                  ],
                ),
                //Image.asset(item.AssetImage,fit: BoxFit.cover,)
              ),
            ),
          ),

          //  child:
        ],
      ),
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
                                        topRight: Radius.circular(20)),
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
                                      Text(
                                        '${controllerpf.pf[index]['name']}',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Center(
                                        child: Container(
                                            width: 50,
                                            padding:
                                                EdgeInsets.only(bottom: 20),
                                            child: Text(
                                              ' ${controllerpf.pf[index]['price']}',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green),
                                            )),
                                      ),
                                      Center(
                                          child: ElevatedButton.icon(
                                              onPressed: () {
                                                int pin = controllerpf.pf[index]
                                                    ['id'];
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
          Text(
            controllerpf.pf[index]['price'],
            style: TextStyle(color: Colors.grey, fontSize: 16),
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
                Get.toNamed("/${names[index]}");
              },
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black54),
                  height: 60,
                  width: 60,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    //child: Image.asset('images/6.jpg'),
                    child: Image.asset(imgname3[index]),
                  )),
            ),
            SizedBox(
              height: 20,
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
             child: Icon(Icons.home_filled,)),),
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






