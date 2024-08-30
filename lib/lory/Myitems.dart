import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/lory/Myitems_controller.dart';
// import 'package:untitled4/modules/Myitems/Myitems_controller.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';


class Myitems extends StatelessWidget {

  MyitemsController controller = Get.put(MyitemsController());
  bool notify = false;

 late File image;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        ListView(
          children: [
            Container(height: 10, margin: EdgeInsets.all(10),),
            Center(child: Text(
              "MYITEMS", style: TextStyle(color: Colors.amber, fontSize: 30),)),
            Container(height: 25,),
            Container(margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      'images/5.jpg', height: 150, width: 100,),
                    Column(
                      children: [
                        Text("sizes:[36,37,38,39,40]",
                          style: TextStyle(color: Colors.black, fontSize: 20),),
                        SizedBox(height: 10,),
                        Container(height: 30,child: Row(children: [InkWell( onTap:(){print("red");},child: Container(height: 20,width: 20,color: Colors.red,margin: EdgeInsets.all(10),)),
                          InkWell(onTap: (){print("greenaccent");},
                              child: Container(height: 20,width: 20,color: Colors.greenAccent,margin: EdgeInsets.all(10))),
                          InkWell(onTap: (){print("green");},
                              child: Container(height: 20,width: 20,color: Colors.green,margin: EdgeInsets.all(10))),
                        ],),),
                      ],
                    ),

                  ],
                )
              /*   Container(  ListTile(title: Text("Availble colors:[pink black yellow]"),
        onTap: (){print("l");})
         // child: Image.asset('assets/images/shoes(1).jpg'),
          */
            ),
            Container(height: 20,

            ),

            Container(height: 10,),
            Container(margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      'images/5.jpg', height: 150, width: 100,),
                    Column(
                      children: [
                        Text("sizes:[S M L XL]",
                          style: TextStyle(color: Colors.black, fontSize: 20),),
                        SizedBox(height: 10,),
                        Container(height: 30,child: Row(children: [InkWell( onTap:(){print("pink");},child: Container(height: 20,width: 20,color: Colors.pink,margin: EdgeInsets.all(10),)),
                          InkWell(onTap: (){print("black");},
                              child: Container(height: 20,width: 20,color: Colors.black,margin: EdgeInsets.all(10))),
                          InkWell(onTap: (){print("amber");},
                              child: Container(height: 20,width: 20,color: Colors.amber,margin: EdgeInsets.all(10))),
                        ],),),
                      ],
                    ),

                  ],
                )),

            Container(height: 30,),
            Container(margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      'images/5.jpg', height: 150, width: 100,),
                    Column(
                      children: [
                        Text("sizes:[S M L]",
                          style: TextStyle(color: Colors.black, fontSize: 20),),
                        SizedBox(height: 10,),
                        Container(height: 30,child: Row(children: [InkWell( onTap:(){print("red");},child: Container(height: 20,width: 20,color: Colors.red,margin: EdgeInsets.all(10),)),
                          InkWell(onTap: (){print("greenaccent");},
                              child: Container(height: 20,width: 20,color: Colors.greenAccent,margin: EdgeInsets.all(10))),
                          InkWell(onTap: (){print("green");},
                              child: Container(height: 20,width: 20,color: Colors.green,margin: EdgeInsets.all(10))),
                        ],),),
                      ],
                    ),

                  ],
                )),

            Container(height: 30,),
            Container(margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      'images/5.jpg', height: 150, width: 100,),
                    Column(
                      children: [
                        Text("sizes:[S M L XL]",
                          style: TextStyle(color: Colors.black, fontSize: 20),),
                        SizedBox(height: 10,),
                        Container(height: 30,child: Row(children: [InkWell( onTap:(){print("grey");},child: Container(height: 20,width: 20,color: Colors.grey,margin: EdgeInsets.all(10),)),
                          InkWell(onTap: (){print("blue");},
                              child: Container(height: 20,width: 20,color: Colors.blueAccent,margin: EdgeInsets.all(10))),
                          InkWell(onTap: (){print("white");},
                              child: Container(height: 20,width: 20,color: Colors.white60,margin: EdgeInsets.all(10))),
                        ],),),
                      ],
                    ),

                  ],
                )),

            SizedBox.fromSize(size: Size(56, 56),
              child: ClipOval(
                child: Material(color: Colors.amberAccent,
                  child: InkWell(splashColor: Colors.green,
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Center(child: InkWell(
                            onTap: () {},
                            child: Icon(Icons.add, size: 50,)),),]


                  ),
              ),

            ),

        )),

          ])
    );

  }

  void setState(Null Function() param0) {}



}