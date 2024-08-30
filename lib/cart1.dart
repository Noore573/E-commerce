import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:another_stepper/another_stepper.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:project2/controllers/cart_controller.dart';

import 'controllers/order_controller.dart';

RxString dropdownvalue = 'Damascus'.obs;
RxString dropdownvalue2 = 'حي المزة'.obs;

class Cart1 extends StatelessWidget {
  static const String _title = 'Flutter Stateful Clicker Counter';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: tabs(),
    );
  }
}

class Product {
  final String name;
  final String image;
  final double price;

  const Product({
    required this.name,
    required this.image,
    required this.price,
    required String quantity,
  });
}

final List<Product> products = [
  const Product(
    name: 'Apple iPhone 13',
    image:
        'https://images.freeimages.com/images/large-previews/af8/hill-fort-hawthorn-3-1186087.jpg',
    price: 799,
    quantity: '',
  ),
  const Product(
    name: 'Samsung Galaxy S21',
    image:
        'https://images.freeimages.com/images/large-previews/af8/hill-fort-hawthorn-3-1186087.jpg',
    price: 699,
    quantity: '',
  ),
  const Product(
    name: 'Sony PlayStation 5',
    image:
        'https://images.freeimages.com/images/large-previews/af8/hill-fort-hawthorn-3-1186087.jpg',
    price: 499,
    quantity: '',
  ),
  const Product(
    name: 'Bose QuietComfort 35 II',
    image:
        'https://images.freeimages.com/images/large-previews/af8/hill-fort-hawthorn-3-1186087.jpg',
    price: 299,
    quantity: '',
  ),
  const Product(
    name: 'Amazon Echo Dot (4th Gen)',
    image:
        'https://images.freeimages.com/images/large-previews/af8/hill-fort-hawthorn-3-1186087.jpg',
    price: 49.99,
    quantity: '',
  ),
];

class tabs extends StatefulWidget {
  @override
  State<tabs> createState() => _tabsState();
}

class _tabsState extends State<tabs> {
  int selectedindex = 0;
  List<Widget> nav = <Widget>[
    ProductsList(),
    InprogressOrder(),
    OrderHistory(),
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
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
                    icon: Icons.credit_card,
                    text: 'Checkout',
                  ),
                  GButton(
                    icon: LineIcons.shippingFast,
                    text: 'In progress',
                  ),
                  GButton(
                    icon: LineIcons.history,
                    text: 'history',
                  ),
                ],
                selectedIndex: selectedindex,
                onTabChange: (index) {
                  setState(() {
                    print(index);
                    selectedindex = index;
                  });
                },
              ),
            ),
          ),
        ));
  }
}

class ProductsList extends StatefulWidget {
  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    controller.getcartcontroller();
    controller.getcarttpcontroller();
    //double totalPrice = products.fold(0, (sum, product) => sum + product.price);

    return GetBuilder<CartController>(
      builder: (controller) => controller.getcartliststatues == false
          ? Center(
              child: SizedBox(
                  width: 100, height: 100, child: CircularProgressIndicator()))
          : Scaffold(
              // appBar: AppBar(
              //   title: const Text('Checkout'),
              //   //backgroundColor: Color.fromARGB(255, 255, 230, 0),
              // ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.cartlist.length,
                      itemBuilder: (context, index) {
                        //final product = products[index];
                        return InkWell(
                          onLongPress: () {
                            controller.deletecartbyid(index);
                          },
                          child: Container(
                            height: 100,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                Image.asset(
                                  //product.image,
                                  "images/5.jpg",
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.fill,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        //product.name,
                                        controller.cartlist[index]['name'],
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        '\$${controller.cartlist[index]['price']}',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    height: 100,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Total',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              //' \$${totalPrice.toStringAsFixed(2)}',
                              //'\$350',
                              "\$ ${controller.carttp}",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 130,
                        ),
                        Container(
                          height: 60,
                          width: 140,
                          child: GFButton(
                            onPressed: () {
                              print("pressed");
                              //Get.bottomsheet{}
                              //showModalBottomSheet(
                              Get.bottomSheet(
                                
                                Center(
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 255, 230, 0),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(35),
                                        topRight: Radius.circular(35),
                                      )),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 40),
                                      Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: TextFormField(
                                            onChanged: (value) {
                                              controller.shipping_address =
                                                  value;
                                            },
                                            decoration: InputDecoration(
                                                hintText: "Shipping address:"),
                                          )),
                                      SizedBox(height: 20),
                                      SizedBox(height: 20),
                                      Container(
                                        child: Row(
                                          children: [
                                            Text(
                                              "Choose the city:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Obx(() {
                                              return DropdownButton<String>(
                                                //dropdownColor: Colors.amber,
                                                value: dropdownvalue.value,
                                                onChanged: (newValue) {
                                                  //print(dropdownvalue)
                                                  controller.city_id = newValue;
                                                  setState(() {
                                                    dropdownvalue.value =
                                                        newValue!;
                                                  });
                                                },
                                                items: <String>[
                                                  'Damascus',
                                                  'Aleppo',
                                                  'Latakia',
                                                  'Hama'
                                                ].map<DropdownMenuItem<String>>(
                                                    (String value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Container(
                                                        child: Text(
                                                      value,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                  );
                                                }).toList(),
                                              );
                                            }),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Text(
                                              "Choose the place:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Obx(() {
                                              return DropdownButton<String>(
                                                //dropdownColor: Colors.amber,
                                                value: dropdownvalue2.value,
                                                onChanged: (String? newValue2) {
                                                  controller.place_id =
                                                      newValue2;
                                                  setState(() {
                                                    dropdownvalue2.value =
                                                        newValue2!;
                                                  });
                                                },
                                                items: <String>[
                                                  'حي المزة',
                                                  'حي المهاجرين',
                                                  'حي قابون',
                                                  'حي جرمانا',
                                                  'حي الجامعة',
                                                  'حي الازرق',
                                                  'حي الشعار',
                                                  'حي الانصاري',
                                                  'حي الاشرفية',
                                                  'حي المطار',
                                                  'حي الاسد',
                                                  'حي المزارع',
                                                  'حي المحطة',
                                                  'حي الحديقة',
                                                  'حي الشهباء',
                                                ].map<DropdownMenuItem<String>>(
                                                    (String value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Container(
                                                        child: Text(
                                                      value,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                  );
                                                }).toList(),
                                              );
                                            }),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      GFButton(
                                        onPressed: () {
                                          controller.placeordercontroller();
                                          Get.snackbar(
                                            'Order!',
                                            'Order have been placed',
                                            backgroundColor: Colors.amber,
                                          );
                                        },
                                        text: "Place order",
                                        textStyle: TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontWeight: FontWeight.bold),
                                        icon: Icon(
                                          Icons.place_sharp,
                                        ),
                                        shape: GFButtonShape.pills,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                      ),
                                    ],
                                  ),
                                ),
                              ));
                              // GFToast.showToast(
                              //     'Item have been purchased successfully\nYou can Check the process  ',
                              //     context,
                              //     toastDuration: 4,
                              //     toastPosition: GFToastPosition.TOP,
                              //     textStyle: TextStyle(
                              //         fontSize: 16, color: GFColors.DARK),
                              //     backgroundColor: GFColors.LIGHT,
                              //     trailing: Icon(
                              //       Icons.shopping_cart_checkout_outlined,
                              //       color: GFColors.SUCCESS,
                              //     ));
                            },
                            text: 'Checkout',
                            shape: GFButtonShape.pills,
                            color: Color.fromARGB(255, 255, 230, 0),
                            child: Text(
                              "Check Out",
                              style: TextStyle(
                                  color: Color.fromARGB(0, 255, 255, 255),
                                  fontSize: 23),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

////////////////////--------------------------------------------------------------------/////////////////////

class OrderHistory extends StatelessWidget {
  OrderController controllerord = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    controllerord.gteallorderc(13);
    bool delev = false;

    //double totalPrice = products.fold(0, (sum, product) => sum + product.price);

    return GetBuilder<OrderController>(
      builder: (controllero) => controllero.getorderliststatues == false
          ? Center(
              child: SizedBox(
                  width: 100, height: 100, child: CircularProgressIndicator()))
          : Scaffold(
              appBar: AppBar(
                title: const Text('Checkout'),
                backgroundColor: Color.fromARGB(255, 255, 230, 0),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: controllerord.orderslist.length,
                      itemBuilder: (context, index) {
                        String orderdate =
                            controllerord.orderslist[index]['order_date'];
                        String dateOnly = orderdate.substring(0, 10);

                        //final product = products[index];
                        return InkWell(
                          onLongPress: () {
                            // controllerord.deletecartbyid(index);
                          },
                          child: Container(
                            height: 100,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                Image.asset(
                                  //product.image,
                                  //"images/5.jpg",
                                  "images/delivery.png",
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.fill,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        //product.name,
                                        controllerord.orderslist[index]
                                            ['shipping_address'],
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      //String dateOnly = orderDate.substring(0, 10);
                                      Text(
                                        //product.name,
                                        // controllerord.orderslist[index]
                                        //     ['order_date'],
                                        dateOnly,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '\$${controllerord.orderslist[index]['Total_price']}',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                controllerord.orderslist[index]
                                            ['shipping_address'] ==
                                        'Damas'
                                    ?
                                    //delev==false?
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.local_shipping_rounded,
                                          size: 30,
                                          color: Colors.grey,
                                        ))
                                    : IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.local_shipping_rounded,
                                          size: 30,
                                          color:
                                              Color.fromARGB(255, 0, 216, 14),
                                        ))
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

/////////////////////////////////////-----------------------------------------
class InprogressOrder extends StatelessWidget {
  OrderController controllerord = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    controllerord.gtealluncheckedorderc(13);
    return GetBuilder<OrderController>(
      builder: (controllero) => controllero.getorderliststatues == false
          ? Center(
              child: SizedBox(
                  width: 100, height: 100, child: CircularProgressIndicator()))
          : Scaffold(
              appBar: AppBar(
                title: const Text('Checkout'),
                backgroundColor: Color.fromARGB(255, 255, 230, 0),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: controllerord.orderslist.length,
                      itemBuilder: (context, index) {
                        String orderdate =
                            controllerord.orderslist[index]['order_date'];
                        String dateOnly = orderdate.substring(0, 10);

                        //final product = products[index];
                        return InkWell(
                          onLongPress: () {
                            // controllerord.deletecartbyid(index);
                          },
                          child: Container(
                            height: 100,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                Image.asset(
                                  //product.image,
                                  //"images/5.jpg",
                                  "images/delivery.png",
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.fill,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        //product.name,
                                        controllerord.orderslist[index]
                                            ['shipping_address'],
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      //String dateOnly = orderDate.substring(0, 10);
                                      Text(
                                        //product.name,
                                        // controllerord.orderslist[index]
                                        //     ['order_date'],
                                        dateOnly,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '\$${controllerord.orderslist[index]['Total_price']}',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                controllerord.orderslist[index]
                                            ['shipping_address'] ==
                                        'Damas'
                                    ?
                                    //delev==false?
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.local_shipping_rounded,
                                          size: 30,
                                          color: Colors.grey,
                                        ))
                                    : IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.local_shipping_rounded,
                                          size: 30,
                                          color:
                                              Color.fromARGB(255, 0, 216, 14),
                                        ))
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
