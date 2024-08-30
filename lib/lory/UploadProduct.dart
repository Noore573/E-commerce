import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:image_picker/image_picker.dart';
//import '../../Constant.dart';

//import '../Bags/Bags.dart';
import 'UploadProduct_controller.dart';

class UploadProduct extends StatefulWidget {
  const UploadProduct({super.key});

  @override
  State<UploadProduct> createState() => _UploadProductState();
}

class _UploadProductState extends State<UploadProduct> {
  final UploadProductController controller = Get.put(UploadProductController());
  List<String> _productSizes = [];
  File? _image;
  Map<String, bool> _colorValues = {
    'Red': false,
    'Orange': false,
    'Yellow': false,
    'Green': false,
    'Blue': false,
    'Indigo': false,
    'Violet': false,
    'Black': false,
    'White': false,
  };

  String imagepathh = 'images/6.jpg';
//File? _image = File(imagepathh);
  final _picker = ImagePicker();
  List<dynamic> colors = [];
  List<dynamic> sizes = [];

  bool _isChecked = false;

  Color _activeColor = Colors.blue;
  final List<String> _categories = [
    'women',
    'men',
    'boy',
        'girl' // Add more categories as needed
  ];

  RxString? _selectedCategory = "men".obs;

  final List<String> _Types = [
    'shirt',
    'shoes',
    'dress',
    'jacket',
    'watch',
    'short',
    'bag',
    'pants',
    // Add more categories as needed
  ];
  List<bool> _isSelected = [false, false, false];
  List<String> colorstoadd = [];
  List<String> sizestoadd = [];
  RxString selectedsize = "other".obs;

  RxString? _selectedType = "shoes".obs;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UploadProductController>(
      builder: (controller2) => Scaffold(
          appBar: AppBar(
            title: Text("27".tr),
          ),
          body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Container(
                    child: Column(children: [
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      /*  Row(
                  children: [
                    Icon(Icons.front_loader,size: 25,),
                    Text("  "),
                    Column(
                      children: [
                        Text("Add product details",style: TextStyle(fontSize:15,color: Colors.black )),
                        Text("Enter your product details",style: TextStyle(fontSize: 10,color: Colors.grey),),
                      ],
                    ),
                  ],
                ),*/

                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "28".tr,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            SizedBox(
                              height: 5,
                            ),

                            Row(
                              children: [
                                Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 5, color: Colors.amber),
                                  ),
                                  child: _image != null
                                      ? Image.file(
                                          _image!,
                                          fit: BoxFit.fill,
                                        )
                                      //controller.image=_image
                                      : const Image(
                                          image: AssetImage("images/1.png"),fit: BoxFit.fill,),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: InkWell(
                                        onTap: () {
                                          _openImagePicker();
                                        },
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.blue,
                                        ))),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "29".tr,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            // SizedBox(height:20 ,),
                            // Text("Select product category",style:TextStyle(color: Colors.grey,fontSize: 15),),
                            SizedBox(
                              height: 3,
                            ),
                            Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade200,
                              ),
                              child: Row(
                                children: [
                                  // Text(
                                  //   "${_selectedCategory}",
                                  //   style: TextStyle(
                                  //       color: Colors.grey, fontSize: 15),
                                  // ),
                                  SizedBox(width: 10),
                                  Obx(() {
                                    return DropdownButton<String>(
                                      value: _selectedCategory!.value,
                                      icon: Icon(Icons.arrow_drop_down),
                                      iconSize: 24,
                                      elevation: 16,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                      underline: SizedBox(),
                                      onChanged: (String? newValue) {
                                        // Update the selected category
                                        _selectedCategory!.value = newValue!;
                                        // Do something with the selected value
                                        // For example, you can pass it to the controller or store it in a variable
                                        controller.gender = newValue;
                                        print(newValue);
                                      },
                                      items: _categories
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    );
                                  }),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "30".tr,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 50,
                              width: double.infinity,
                              child: TextField(
                                maxLength: 20,
                                onChanged: (value) {
                                  controller.name = value;
                                  print(value);
                                },
                                cursorColor: Colors.black,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "38".tr,
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                  contentPadding: EdgeInsets.all(10),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "31".tr,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 50,
                              width: double.infinity,
                              child: TextField(
                                onChanged: (value) {
                                  controller.description = value;
                                  print(value);
                                },
                                cursorColor: Colors.black,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "39".tr,
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                  contentPadding: EdgeInsets.all(10),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "32".tr,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade200,
                              ),
                              child: Row(
                                children: [
                                  // Text(
                                  //   " _Select the type",
                                  //   style: TextStyle(
                                  //       color: Colors.grey, fontSize: 15),
                                  // ),
                                  SizedBox(width: 10),
                                  Obx(() {
                                    return DropdownButton<String>(
                                      value: _selectedType!.value,
                                      icon: Icon(Icons.arrow_drop_down),
                                      iconSize: 24,
                                      elevation: 16,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                      underline: SizedBox(),
                                      onChanged: (String? newValue) {
                                        // Update the selected category
                                        _selectedType!.value = newValue!;
                                        // Do something with the selected value
                                        // For example, you can pass it to the controller or store it in a variable
                                        controller.category = newValue;
                                        print(newValue);
                                      },
                                      items:
                                          _Types.map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    );
                                  }),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "33".tr,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 50,
                              width: double.infinity,
                              child: TextField(
                                onChanged: (value) {
                                  controller.material = value;
                                  print(value);
                                },
                                cursorColor: Colors.black,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "40".tr,
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                  contentPadding: EdgeInsets.all(10),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "34".tr,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: 20.0, bottom: 10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                    ),
                                    child: Checkbox(
                                      value: _colorValues['Red']!,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _colorValues['Red'] = value!;
                                        });
                                        value == true
                                            ? colorstoadd.add("1")
                                            : colorstoadd.remove("1");
                                        print(colorstoadd);
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: 20.0, bottom: 10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                    ),
                                    child: Checkbox(
                                      value: _colorValues['Orange']!,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _colorValues['Orange'] = value!;
                                        });
                                        value == true
                                            ? colorstoadd.add("2")
                                            : colorstoadd.remove("2");
                                        print(colorstoadd);
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                    ),
                                    child: Checkbox(
                                      value: _colorValues['Yellow']!,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _colorValues['Yellow'] = value!;
                                        });
                                        value == true
                                            ? colorstoadd.add("3")
                                            : colorstoadd.remove("3");
                                        print(colorstoadd);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: 20.0, bottom: 10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                    ),
                                    child: Checkbox(
                                      value: _colorValues['Green']!,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _colorValues['Green'] = value!;
                                        });
                                        value == true
                                            ? colorstoadd.add("4")
                                            : colorstoadd.remove("4");
                                        print(colorstoadd);
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: 20.0, bottom: 10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Checkbox(
                                      value: _colorValues['Blue']!,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _colorValues['Blue'] = value!;
                                        });
                                        value == true
                                            ? colorstoadd.add("5")
                                            : colorstoadd.remove("5");
                                        print(colorstoadd);
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                    ),
                                    child: Checkbox(
                                      value: _colorValues['Indigo']!,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _colorValues['Indigo'] = value!;
                                        });
                                        value == true
                                            ? colorstoadd.add("6")
                                            : colorstoadd.remove("6");
                                        print(colorstoadd);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: 20.0, bottom: 10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.brown,
                                    ),
                                    child: Checkbox(
                                      value: _colorValues['Violet']!,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _colorValues['Violet'] = value!;
                                        });
                                        value == true
                                            ? colorstoadd.add("7")
                                            : colorstoadd.remove("7");
                                        print(colorstoadd);
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: 20.0, bottom: 10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.pink,
                                    ),
                                    child: Checkbox(
                                      value: _colorValues['Black']!,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _colorValues['Black'] = value!;
                                        });
                                        value == true
                                            ? colorstoadd.add("8")
                                            : colorstoadd.remove("8");
                                        print(colorstoadd);
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.red,
                                          Colors.orange,
                                          Colors.yellow,
                                          Colors.green,
                                          Colors.blue,
                                          Colors.indigo,
                                          Colors.purple,
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                    ),
                                    child: Checkbox(
                                      value: _colorValues['White']!,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _colorValues['White'] = value!;
                                        });
                                        value == true
                                            ? colorstoadd.add("9")
                                            : colorstoadd.remove("9");
                                        print(colorstoadd);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "35".tr,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isSelected[0] = !_isSelected[0];
                                    });
                                    _isSelected[0] == true
                                        ? sizestoadd.add("Small")
                                        : sizestoadd.remove("Small");
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(16.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: _isSelected[0]
                                            ? Colors.blue
                                            : Colors.white,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Text(
                                      'Small',
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isSelected[1] = !_isSelected[1];
                                    });
                                    _isSelected[1] == true
                                        ? sizestoadd.add("Medium")
                                        : sizestoadd.remove("Medium");
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(16.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: _isSelected[1]
                                            ? Colors.blue
                                            : Colors.white,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Text(
                                      'Medium',
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isSelected[2] = !_isSelected[2];
                                    });
                                    _isSelected[2] == true
                                        ? sizestoadd.add("Large")
                                        : sizestoadd.remove("Large");
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(16.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: _isSelected[2]
                                            ? Colors.blue
                                            : Colors.white,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Text(
                                      'Large',
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  Get.bottomSheet(Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10))),
                                    child: Column(
                                      children: [
                                        TextField(
                                          onChanged: (value) {
                                            setState(() {
                                              selectedsize.value = value;
                                            });

                                            print(value);
                                          },
                                          // onEditingComplete: () {
                                          //   sizestoadd.add(selectedsize.value);
                                          //   print(sizestoadd);
                                          // },
                                          cursorColor: Colors.black,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            suffixIcon: Icon(
                                              Icons.numbers_outlined,
                                            ),
                                            hintText: "Enter the Size:",
                                            hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15),
                                            contentPadding: EdgeInsets.all(10),
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              sizestoadd
                                                  .add(selectedsize.value);
                                              print(sizestoadd);
                                              
                                              selectedsize.value = "";
                                            },
                                            icon: Icon(
                                              Icons.add,
                                              size: 40,
                                            ))
                                      ],
                                    ),
                                  ));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(16.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Text(
                                    'Other',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  "36".tr,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(10)),
                                  height: 40,
                                  width: 250,
                                  child: TextField(
                                    onChanged: (value) {
                                      controller.price = value;
                                      print(value);
                                    },
                                    cursorColor: Colors.black,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      suffixIcon: Icon(Icons.attach_money_sharp),
                                      hintText: "37".tr,
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 18),
                                      contentPadding: EdgeInsets.all(10),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          controller.photo = _image!;
                          controller.sizessss = sizestoadd;
                          controller.colorsss = colorstoadd;
                          //_initImage();
                          print(controller.image);
                          controller.uploadproc();
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 255, 230, 0),
                          // side: BorderSide(width:8, color: Colors.yellow)
                        ),
                        child: Text("Upload Product"),
                      ),
                    ]),
                  ),
                ],
              ))),
    );
    /*  SafeArea(
          child: Center(
          child: Container(
          height:MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width,
        decoration: gardientBackground,
        child:
        ListView(

          children:[

            Center(child: Text("Upload Prodcut",style: TextStyle(fontSize: 20,color: Colors.white),)),
            SizedBox(height: 10,),
            Container(
              padding:EdgeInsets.all(10) ,
              height:60,
              width:MediaQuery.of(context).size.width*0.9,
              decoration: BoxDecoration(
                  color:Colors.white.withAlpha(20) ,
                  borderRadius: BorderRadius.circular(20),
                  border: Border(
                    top: BorderSide(width: 2,color:Colors.black54),
                    bottom: BorderSide(width: 2,color:Colors.black54),
                    left: BorderSide(width: 2,color:Colors.black54),
                    right: BorderSide(width: 2,color:Colors.black54),

                  )
              ),
              child: Center(
                child: TextField(
                  onChanged: (value){controller.productName=value;
                  print(value);},
                  cursorColor: Colors.black,

                  style: TextStyle(color: Colors.black,
                      fontSize: 20),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "_productName",
                    hintStyle: TextStyle(color: Colors.white,
                        fontSize: 20),
                    contentPadding: EdgeInsets.all(10),
                  ),

                ),
              ),),
    SizedBox(height: 10,),
    Container(
    padding:EdgeInsets.all(10) ,
      height:60,
      width:MediaQuery.of(context).size.width*0.9,
    decoration: BoxDecoration(
    color:Colors.white.withAlpha(20) ,
    //Colors.white.withAlpha(20)
    borderRadius: BorderRadius.circular(20),
    border: Border(
    top: BorderSide(width: 2,color:Colors.black54),
    bottom: BorderSide(width: 2,color:Colors.black54),
    left: BorderSide(width: 2,color:Colors.black54),
    right: BorderSide(width: 2,color:Colors.black54),

    )
    ),
    child: Center(
    child: TextField(
      onChanged: (value){controller.brandName=value;
      print(value);},
    cursorColor: Colors.black,
   // keyboardType:keyboard ?? TextInputType.text,
    style: TextStyle(color: Colors.black,
    fontSize: 20),
    decoration: InputDecoration(
    border: InputBorder.none,
    hintText: "_brandName",
    hintStyle: TextStyle(color: Colors.white,
    fontSize: 20),
    contentPadding: EdgeInsets.all(10),
    ),

    ),
    ),),
            SizedBox(height: 10,),
            Container(
              padding:EdgeInsets.all(10) ,
              height:60,
              width:MediaQuery.of(context).size.width*0.9,
              decoration: BoxDecoration(
                  color:Colors.white.withAlpha(20) ,
                  //Colors.white.withAlpha(20)
                  borderRadius: BorderRadius.circular(20),
                  border: Border(
                    top: BorderSide(width: 2,color:Colors.black54),
                    bottom: BorderSide(width: 2,color:Colors.black54),
                    left: BorderSide(width: 2,color:Colors.black54),
                    right: BorderSide(width: 2,color:Colors.black54),

                  )
              ),
              child: Center(
                child: TextField(
                  onChanged: (value){controller.dsec=value;
                  print(value);},
                  cursorColor: Colors.black,
                  // keyboardType:keyboard ?? TextInputType.text,
                  style: TextStyle(color: Colors.black,
                      fontSize: 20),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "_dsec",
                    hintStyle: TextStyle(color: Colors.white,
                        fontSize: 20),
                    contentPadding: EdgeInsets.all(10),
                  ),

                ),
              ),),
            SizedBox(height: 10,),
            Container(
              padding:EdgeInsets.all(10) ,
              height:60,
              width:MediaQuery.of(context).size.width*0.9,
              decoration: BoxDecoration(
                  color:Colors.white.withAlpha(20) ,
                  //Colors.white.withAlpha(20)
                  borderRadius: BorderRadius.circular(20),
                  border: Border(
                    top: BorderSide(width: 2,color:Colors.black54),
                    bottom: BorderSide(width: 2,color:Colors.black54),
                    left: BorderSide(width: 2,color:Colors.black54),
                    right: BorderSide(width: 2,color:Colors.black54),

                  )
              ),
              child: Center(
                child: TextField(
                  onChanged: (value){controller.catagory=value;
                  print(value);},
                  cursorColor: Colors.black,
                  // keyboardType:keyboard ?? TextInputType.text,
                  style: TextStyle(color: Colors.black,
                      fontSize: 20),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "catagory",
                    hintStyle: TextStyle(color: Colors.white,
                        fontSize: 20),
                    contentPadding: EdgeInsets.all(10),
                  ),

                ),
              ),),
            SizedBox(height: 10,),
            Container(
              padding:EdgeInsets.all(10) ,
              height:60,
              width:MediaQuery.of(context).size.width*0.9,
              decoration: BoxDecoration(
                  color:Colors.white.withAlpha(20) ,
                  //Colors.white.withAlpha(20)
                  borderRadius: BorderRadius.circular(20),
                  border: Border(
                    top: BorderSide(width: 2,color:Colors.black54),
                    bottom: BorderSide(width: 2,color:Colors.black54),
                    left: BorderSide(width: 2,color:Colors.black54),
                    right: BorderSide(width: 2,color:Colors.black54),

                  )
              ),
              child: Center(
                child: TextField(
                  onChanged: (value){controller.gender=value;
                  print(value);},
                  cursorColor: Colors.black,
                  // keyboardType:keyboard ?? TextInputType.text,
                  style: TextStyle(color: Colors.black,
                      fontSize: 20),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "_gender",
                    hintStyle: TextStyle(color: Colors.white,
                        fontSize: 20),
                    contentPadding: EdgeInsets.all(10),
                  ),

                ),
              ),),
            SizedBox(height: 10,),
            Container(
              padding:EdgeInsets.all(10) ,
              height:60,
              width:MediaQuery.of(context).size.width*0.9,
              decoration: BoxDecoration(
                  color:Colors.white.withAlpha(20) ,
                  //Colors.white.withAlpha(20)
                  borderRadius: BorderRadius.circular(20),
                  border: Border(
                    top: BorderSide(width: 2,color:Colors.black54),
                    bottom: BorderSide(width: 2,color:Colors.black54),
                    left: BorderSide(width: 2,color:Colors.black54),
                    right: BorderSide(width: 2,color:Colors.black54),

                  )
              ),
              child: Center(
                child: TextField(
                  onChanged: (value){controller.material=value;
                  print(value);},
                  cursorColor: Colors.black,
                  // keyboardType:keyboard ?? TextInputType.text,
                  style: TextStyle(color: Colors.black,
                      fontSize: 20),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "_material",
                    hintStyle: TextStyle(color: Colors.white,
                        fontSize: 20),
                    contentPadding: EdgeInsets.all(10),
                  ),

                ),
              ),),
            SizedBox(height: 10,),
            Container(
              padding:EdgeInsets.all(10) ,
              height:60,
              width:MediaQuery.of(context).size.width*0.9,
              decoration: BoxDecoration(
                  color:Colors.white.withAlpha(20) ,
                  //Colors.white.withAlpha(20)
                  borderRadius: BorderRadius.circular(20),
                  border: Border(
                    top: BorderSide(width: 2,color:Colors.black54),
                    bottom: BorderSide(width: 2,color:Colors.black54),
                    left: BorderSide(width: 2,color:Colors.black54),
                    right: BorderSide(width: 2,color:Colors.black54),

                  )
              ),
              child: Center(
                child: TextField(
                  onChanged: (value){controller.productPrice=value;
                  print(value);},
                  cursorColor: Colors.black,
                  // keyboardType:keyboard ?? TextInputType.text,
                  style: TextStyle(color: Colors.black,
                      fontSize: 20),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "_productPrice",
                    hintStyle: TextStyle(color: Colors.white,
                        fontSize: 20),
                    contentPadding: EdgeInsets.all(10),
                  ),

                ),
              ),),
            SizedBox(height: 10,),
            Container(
              padding:EdgeInsets.all(10) ,
              height:60,
              width:MediaQuery.of(context).size.width*0.9,
              decoration: BoxDecoration(
                  color:Colors.white.withAlpha(20) ,
                  //Colors.white.withAlpha(20)
                  borderRadius: BorderRadius.circular(20),
                  border: Border(
                    top: BorderSide(width: 2,color:Colors.black54),
                    bottom: BorderSide(width: 2,color:Colors.black54),
                    left: BorderSide(width: 2,color:Colors.black54),
                    right: BorderSide(width: 2,color:Colors.black54),

                  )
              ),
              child: Center(
                child: TextField(
                  onChanged: (value){controller.productPhoto=value;
                  print(value);},
                  cursorColor: Colors.black,
                  // keyboardType:keyboard ?? TextInputType.text,
                  style: TextStyle(color: Colors.black,
                      fontSize: 20),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "_productPhoto",
                    hintStyle: TextStyle(color: Colors.white,
                        fontSize: 20),
                    contentPadding: EdgeInsets.all(10),
                  ),

                ),
              ),),
            SizedBox(height: 10,),
            Container(
              padding:EdgeInsets.all(10) ,
              height:60,
              width:MediaQuery.of(context).size.width*0.9,
              decoration: BoxDecoration(
                  color:Colors.white.withAlpha(20) ,
                  //Colors.white.withAlpha(20)
                  borderRadius: BorderRadius.circular(20),
                  border: Border(
                    top: BorderSide(width: 2,color:Colors.black54),
                    bottom: BorderSide(width: 2,color:Colors.black54),
                    left: BorderSide(width: 2,color:Colors.black54),
                    right: BorderSide(width: 2,color:Colors.black54),

                  )
              ),
              child: Center(
                child: TextField(
                  onChanged: (value){controller.productQuantity=value;
                  print(value);},
                  cursorColor: Colors.black,
                  // keyboardType:keyboard ?? TextInputType.text,
                  style: TextStyle(color: Colors.black,
                      fontSize: 20),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "_productQuantity",
                    hintStyle: TextStyle(color: Colors.white,
                        fontSize: 20),
                    contentPadding: EdgeInsets.all(10),
                  ),

                ),
              ),),
            SizedBox(height: 10,),
            Container(
              padding:EdgeInsets.all(10) ,
              height:60,
              width:MediaQuery.of(context).size.width*0.9,
              decoration: BoxDecoration(
                  color:Colors.white.withAlpha(20) ,
                  //Colors.white.withAlpha(20)
                  borderRadius: BorderRadius.circular(20),
                  border: Border(
                    top: BorderSide(width: 2,color:Colors.black54),
                    bottom: BorderSide(width: 2,color:Colors.black54),
                    left: BorderSide(width: 2,color:Colors.black54),
                    right: BorderSide(width: 2,color:Colors.black54),

                  )
              ),
              child: Center(
                child: TextField(
    onChanged: (value){controller.productColors=value;
    print(value);},
                  cursorColor: Colors.black,
                  // keyboardType:keyboard ?? TextInputType.text,
                  style: TextStyle(color: Colors.black,
                      fontSize: 20),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText:"_productColors",
                    hintStyle: TextStyle(color: Colors.white,
                        fontSize: 20),
                    contentPadding: EdgeInsets.all(10),
                  ),

                ),
              ),),
            SizedBox(height: 10,),
            Container(
              padding:EdgeInsets.all(10) ,
              height:60,
              width:MediaQuery.of(context).size.width*0.9,
              decoration: BoxDecoration(
                  color:Colors.white.withAlpha(20) ,
                  //Colors.white.withAlpha(20)
                  borderRadius: BorderRadius.circular(20),
                  border: Border(
                    top: BorderSide(width: 2,color:Colors.black54),
                    bottom: BorderSide(width: 2,color:Colors.black54),
                    left: BorderSide(width: 2,color:Colors.black54),
                    right: BorderSide(width: 2,color:Colors.black54),

                  )
              ),
              child: Center(
                child: TextField(
                  onChanged: (value){controller.productSizes=value;
                    print(value);
                    },
                  cursorColor: Colors.black,
                  style: TextStyle(color: Colors.black,
                      fontSize: 20),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "_productSizes",
                    hintStyle: TextStyle(color: Colors.white,
                        fontSize: 20),
                    contentPadding: EdgeInsets.all(10),
                  ),

                ),
              ),),


            IconButton(onPressed: (){controller.decrement();
              Get.toNamed("/myitems");
              }, icon: Icon(Icons.add))




          ]
        ),),),)*/
  }

  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  void _initImage() {
    _image = File(imagepathh);
    //controller.image = _image!;
    controller.image = _image!.path;
    print(_image!.path);
  }
}
