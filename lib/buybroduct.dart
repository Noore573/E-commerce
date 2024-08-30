import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project2/controllers/cart_controller.dart';
import 'package:project2/lory/ProductDetail_controller.dart';

import 'server.dart';

//String pidd = Get.arguments;
RxBool isselected = false.obs;
RxBool isselected2 = false.obs;
RxBool isselected3 = false.obs;
RxBool isselected4 = false.obs;
RxBool isselected5 = false.obs;
RxBool isselected6 = false.obs;
RxBool isselected7 = false.obs;
RxBool isselected8 = false.obs;

RxBool isselected9 = false.obs;
RxBool isselected10 = false.obs;
RxBool isselected11 = false.obs;
List<String> sizess = ['small', 'medium', 'large'];
RxString chsize = 'small'.obs;
String vv = 'small';
RxInt qunt = 0.obs;
String qq = 's';
int? index = Get.arguments;

RxString cid = ''.obs;
final ProductDetailController controller = Get.put(ProductDetailController());

class BuyProduct extends StatefulWidget {
  const BuyProduct({super.key});

  @override
  State<BuyProduct> createState() => _BuyProductState();
}

class _BuyProductState extends State<BuyProduct> {
  List<String> _productSizes = [];

  List<dynamic> colors = [];
  List<dynamic> sizes = [];
  Color _activeColor = Colors.blue;
  final List<String> _categories = [
    'Women',
    'Men',
    'Kids',
    // Add more categories as needed
  ];

  List<Widget> ccolor = [
    Obx(() {
      return InkWell(
        onTap: () {
          //print(isselected.value);
          //cid.value = '1';
          controller.color_id = '1';
          isselected.value = !isselected.value;
          isselected2.value = false;
          isselected3.value = false;
          isselected4.value = false;
          isselected5.value = false;
          isselected6.value = false;
          isselected7.value = false;
          isselected8.value = false;
          isselected.value == false ? controller.color_id = '0' : print('yo');
          print(controller.color_id);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            border: isselected.value == true
                ? Border.all(color: Color.fromARGB(255, 0, 136, 255), width: 6)
                : Border.all(
                    color: Color.fromARGB(255, 255, 255, 255), width: 3),
          ),
        ),
      );
    }),

    Obx(() {
      return InkWell(
        onTap: () {
          //print(isselected.value);
          //cid.value = '1';
          controller.color_id = '2';
          isselected2.value = !isselected2.value;
          isselected.value = false;
          isselected3.value = false;
          isselected4.value = false;
          isselected5.value = false;
          isselected6.value = false;
          isselected7.value = false;
          isselected8.value = false;
          isselected2.value == false ? controller.color_id = '0' : print('yo');
          print(controller.color_id);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.green,
            border: isselected2.value == true
                ? Border.all(color: Color.fromARGB(255, 0, 136, 255), width: 6)
                : Border.all(
                    color: Color.fromARGB(255, 255, 255, 255), width: 3),
          ),
        ),
      );
    }),
    Obx(() {
      return InkWell(
        onTap: () {
          //print(isselected.value);
          //cid.value = '1';
          controller.color_id = '3';
          isselected3.value = !isselected3.value;
          isselected2.value = false;
          isselected.value = false;
          isselected4.value = false;
          isselected5.value = false;
          isselected6.value = false;
          isselected7.value = false;
          isselected8.value = false;
          isselected3.value == false ? controller.color_id = '0' : print('yo');
          print(controller.color_id);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            border: isselected3.value == true
                ? Border.all(color: Color.fromARGB(255, 0, 136, 255), width: 6)
                : Border.all(
                    color: Color.fromARGB(255, 255, 255, 255), width: 3),
          ),
        ),
      );
    }),
    Obx(() {
      return InkWell(
        onTap: () {
          //print(isselected.value);
          //cid.value = '1';
          controller.color_id = '4';
          isselected4.value = !isselected4.value;
          isselected2.value = false;
          isselected.value = false;
          isselected3.value = false;
          isselected5.value = false;
          isselected6.value = false;
          isselected7.value = false;
          isselected8.value = false;
          isselected4.value == false ? controller.color_id = '0' : print('yo');
          print(controller.color_id);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            border: isselected4.value == true
                ? Border.all(color: Color.fromARGB(255, 0, 136, 255), width: 6)
                : Border.all(
                    color: Color.fromARGB(255, 255, 255, 255), width: 3),
          ),
        ),
      );
    }),
    Obx(() {
      return InkWell(
        onTap: () {
          //print(isselected.value);
          //cid.value = '1';
          controller.color_id = '5';
          isselected5.value = !isselected5.value;
          isselected2.value = false;
          isselected.value = false;
          isselected4.value = false;
          isselected3.value = false;
          isselected6.value = false;
          isselected7.value = false;
          isselected8.value = false;
          isselected5.value == false ? controller.color_id = '0' : print('yo');
          print(controller.color_id);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: isselected5.value == true
                ? Border.all(color: Color.fromARGB(255, 0, 136, 255), width: 6)
                : Border.all(
                    color: Color.fromARGB(255, 255, 255, 255), width: 3),
          ),
        ),
      );
    }),
    Obx(() {
      return InkWell(
        onTap: () {
          //print(isselected.value);
          //cid.value = '1';
          controller.color_id = '6';
          isselected6.value = !isselected6.value;
          isselected2.value = false;
          isselected.value = false;
          isselected4.value = false;
          isselected5.value = false;
          isselected3.value = false;
          isselected7.value = false;
          isselected8.value = false;
          isselected6.value == false ? controller.color_id = '0' : print('yo');
          print(controller.color_id);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            border: isselected6.value == true
                ? Border.all(color: Color.fromARGB(255, 0, 136, 255), width: 6)
                : Border.all(
                    color: Color.fromARGB(255, 255, 255, 255), width: 3),
          ),
        ),
      );
    }),
    Obx(() {
      return InkWell(
        onTap: () {
          //print(isselected.value);
          //cid.value = '1';
          controller.color_id = '7';
          isselected7.value = !isselected7.value;
          isselected2.value = false;
          isselected.value = false;
          isselected4.value = false;
          isselected5.value = false;
          isselected6.value = false;
          isselected3.value = false;
          isselected8.value = false;
          isselected7.value == false ? controller.color_id = '0' : print('yo');
          print(controller.color_id);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.brown,
            border: isselected7.value == true
                ? Border.all(color: Color.fromARGB(255, 0, 136, 255), width: 6)
                : Border.all(
                    color: Color.fromARGB(255, 255, 255, 255), width: 3),
          ),
        ),
      );
    }),
    Obx(() {
      return InkWell(
        onTap: () {
          //print(isselected.value);
          //cid.value = '1';
          controller.color_id = '8';
          isselected8.value = !isselected8.value;
          isselected2.value = false;
          isselected.value = false;
          isselected4.value = false;
          isselected5.value = false;
          isselected6.value = false;
          isselected7.value = false;
          isselected3.value = false;
          isselected8.value == false ? controller.color_id = '0' : print('yo');
          print(controller.color_id);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.pink,
            border: isselected8.value == true
                ? Border.all(color: Color.fromARGB(255, 0, 136, 255), width: 6)
                : Border.all(
                    color: Color.fromARGB(255, 255, 255, 255), width: 3),
          ),
        ),
      );
    }),
    // Container(
    //   color: Color.fromARGB(255, 238, 255, 0),
    // ),
    // Container(
    //   color: Color.fromARGB(255, 255, 0, 0),
    // ),
  ];
  List<Widget> sizechoice = [
    Obx(() {
      return InkWell(
        onTap: () {
          //print(isselected.value);
          //cid.value = '1';
          controller.size = 'small';
          isselected9.value = !isselected9.value;

          isselected9.value == false ? controller.size = 'small' : print('yo');
          print(controller.size);
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            border: isselected9.value == true
                ? Border.all(color: Color.fromARGB(255, 0, 136, 255), width: 6)
                : Border.all(
                    color: Color.fromARGB(255, 255, 255, 255), width: 3),
          ),
          child: Text("small"),
        ),
      );
    }),
    Obx(() {
      return InkWell(
        onTap: () {
          //print(isselected.value);
          //cid.value = '1';
          controller.size = 'medium';
          isselected10.value = !isselected10.value;
          isselected10.value == false ? controller.size = 'small' : print('yo');
          print(controller.size);
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            border: isselected10.value == true
                ? Border.all(color: Color.fromARGB(255, 0, 136, 255), width: 6)
                : Border.all(
                    color: Color.fromARGB(255, 255, 255, 255), width: 3),
          ),
          child: Text("medium"),
        ),
      );
    }),
    Obx(() {
      return InkWell(
        onTap: () {
          //print(isselected.value);
          //cid.value = '1';
          controller.size = 'large';
          isselected11.value = !isselected11.value;
          isselected11.value == false ? controller.size = 'small' : print('yo');
          print(controller.size);
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(20),
            border: isselected11.value == true
                ? Border.all(color: Color.fromARGB(255, 0, 136, 255), width: 6)
                : Border.all(
                    color: Color.fromARGB(255, 255, 255, 255), width: 3),
          ),
          child: Center(child: Text("large")),
        ),
      );
    }),
  ];
  final List<String> colorscoice = [
    'red',
    'green',
    'blue',
    'black',
    'white',
    'gray',
    'brown',
    'pink',
    'multi-color',
    'other'
  ];
  File? _image;
  String? _selectedCategory;

  final List<String> _Types = [
    'Tshirt',
    'Shoes',
    'Dress',
    'Jacket',
    'Watch',
    'Short',
    'Bag',
    'Pant',
    'Shirt',
    // Add more categories as needed
  ];

  String? _selectedType;
  String dropdownValue = 'small';
  @override
  Widget build(BuildContext context) {
    controller.getprobyid(index!);
    return GetBuilder<ProductDetailController>(
      builder: (controller) => controller.name == "" && controller.photo == ""
          ? Center(
              child: GFLoader(
                type: GFLoaderType.circle,
                loaderstrokeWidth: 400,
              ),
            )
          : Scaffold(
              appBar: AppBar(),
              body: Padding(
                padding: const EdgeInsets.all(0.1),
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/bpbackground.jpg"),
                          fit: BoxFit.fitHeight),
                    ),
                    child: Column(children: [
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Container(
                                height: 200,
                                width: 200,
                                child: controller.photo != ""
                                    ? Center(
                                        child: Image.network(
                                          '${ServerConfig.domainNameServer}/storage/${controller.photo}',
                                          fit: BoxFit.fill,
                                        ),
                                      )
                                    //controller.image=_image
                                    : Center(
                                        child: Image(
                                          image: AssetImage(
                                            "images/defult.jpg",
                                          ),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Center(
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "75".tr,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        child: DropdownButton<dynamic>(
                                          value: dropdownValue,
                                          onChanged: ( newValue) {
                                            setState(() {
                                              dropdownValue = newValue!;
                                              controller.size = newValue;
                                            });
                                          },
                                          // items: <String>[
                                          //   sizes
                                          //   // 'small',
                                          //   // 'medium',
                                          //   // 'large'
                                          // ]
                                          //items:sizess
                                          items:controller.Sizes.
                                          map<DropdownMenuItem<dynamic>>(
                                              ( value) {
                                            return DropdownMenuItem<dynamic>(
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
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  '76'.tr,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Obx(() {
                                  return Text(
                                    '${qunt.value}',
                                    style: TextStyle(fontSize: 20),
                                  );
                                }),
                                Column(children: [
                                  IconButton(
                                    onPressed: () {
                                      qunt.value++;
                                    },
                                    icon: Icon(
                                      Icons.add_circle,
                                      size: 30,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      qunt.value--;
                                    },
                                    icon: Icon(
                                      Icons.remove_circle,
                                      size: 30,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                ])
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '77'.tr,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Center(
                              child: Container(
                                width: 300,
                                //width: 30,
                                height: 200,
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                  ),
                                  itemCount: 8,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                        onLongPress: () {
                                          print(controller.color_id);
                                        },
                                        onTap: () {
                                          //  controller.color_id = '${index + 1}';
                                          //print(controller.color_id);
                                        },
                                        child: Container(child: ccolor[index]));
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      GFButton(
                        onPressed: () {
                          qq = qunt.value.toString();
                          controller.quantity2 = qq;
                          //     Get.snackbar(
                          //  titleText: Text('dff')

                          //   },
                          print("------------");
                          print(index.toString());
                          print("------------");
                          controller.addtocartcontroller(index.toString());
                          controller.addtocartstatues == true
                              ? Get.snackbar(
                                  '73'.tr,
                                  '74'.tr,
                                  backgroundColor:
                                      Color.fromARGB(255, 255, 230, 0),
                                )
                              : Get.snackbar(
                                  '72'.tr,
                                  ':(',
                                  backgroundColor:
                                      Color.fromARGB(255, 255, 230, 0),
                                );
                        },
                        text: "78".tr,
                        textStyle: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold),
                        icon: Icon(Icons.shopping_cart_rounded),
                        shape: GFButtonShape.pills,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      // ElevatedButton(

                      //   onPressed: () {
                      //     //  controller.uploadproc();
                      //   },

                      //   color:Color.fromARGB(255, 255, 230, 0),
                      //   style: ElevatedButton.styleFrom(

                      //     // side: BorderSide(width:8, color: Colors.yellow)
                      //   ),
                      //   child: Text("Add to cart"),
                      // ),
                    ]),
                  ),
                ),
              )),
    );
  }
}
