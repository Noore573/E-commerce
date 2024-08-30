import 'dart:convert';
import 'dart:io';
import 'package:getwidget/getwidget.dart';
import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';
import 'package:project2/Home.dart';
import 'package:project2/controllers/SignUp_Controller.dart';
import 'package:project2/controllers/confirmcode_controller.dart';
import 'package:project2/controllers/register_controller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:getwidget/getwidget.dart';
import 'package:project2/color.dart';

RxString dropdownvalue = 'Damascus'.obs;
RxString dropdownvalue2 = 'حي المزة'.obs;
var data = Get.arguments;
String em = data[0];
String cc = data[1];
RxInt groupValue = 0.obs;
RxInt groupValue2 = 0.obs;
File? _file;
String base64 = '';

class Register2 extends StatefulWidget {
  const Register2({super.key});

  @override
  State<Register2> createState() => _Register2State();
}

class _Register2State extends State<Register2> {
  File? image;
  File? imagepath;
  var imgholder = false.obs;
  RegisterController controller = Get.find();
  CCode ccontroller = Get.find();
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      SafeArea(
          child: Center(
              child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: gardientBackground,
        child: ListView(children: [
          Container(
            height: 40,
          ),
          InkWell(
            onTap: () {
              Get.bottomSheet(Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Color.fromARGB(203, 238, 255, 0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        pickimage();
                        //controller.photo =  File(controller.profilepicpath.value);

                        //controller.photo_profile = base64;
                      },
                      icon: Icon(Icons.camera),
                      color: Colors.white,
                      iconSize: 70,
                      splashColor: Color.fromARGB(255, 255, 153, 0),
                    ),
                    SizedBox(width: 50),
                    //  IconButton(
                    //   onPressed: () {
                    //      controller.photo = imagepath;
                    //     print(controller.photo);
                    //     print(imagepath);
                    //     //controller.photo_profile = base64;
                    //   },
                    //   icon: Icon(Icons.save),
                    //   color: Colors.white,
                    //   iconSize: 70,
                    //   splashColor: Color.fromARGB(255, 255, 153, 0),
                    // ),
                    SizedBox(width: 50),
                    IconButton(
                      onPressed: () {
                        captureimage();
                      },
                      icon: Icon(Icons.camera_alt),
                      color: Colors.white,
                      iconSize: 70,
                    )
                  ],
                ),
              ));
              // pickimage();
            },
            child: Obx(() {
              return Container(
                width: 100,
                height: 100,
                child: Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    //  backgroundImage: AssetImage('images/defaultavatar.jpg'),
                    backgroundImage: controller.isset.value == false
                        ? AssetImage(
                            "images/defaultavatar.jpg",
                          )
                        : FileImage(File(controller.profilepicpath.value),
                            scale: 4) as ImageProvider,
                  ),
                ),
              );
            }),
            // Obx(() {
            //   return SizedBox(
            //     height: 100,
            //     width: 100,
            //     child: CircleAvatar(
            //       radius: 50,
            //       // ignore: unnecessary_null_comparison
            //       backgroundImage: controller.isset.value == false
            //           ? AssetImage("images/defaultavatar.jpg",)
            //           : FileImage(File(controller.profilepicpath.value),
            //               scale: 4) as ImageProvider,
            //     ),
            //   );
            // }),

            //         // image!=null?
            //         // backgroundImage: AssetImage("$image"):backgroun

            //           // child: image != null
            //           //     ? Image.file( image!, fit: BoxFit.cover,)
            //           //     : Image.asset("images/111.jpg")
            //             // child:
            //             //    Image.asset("images/111.jpg")

            // image != null
            //     ? Image.file(
            //         image!,
            //         fit: BoxFit.cover,
            //       )
            //     : Image.asset("images/2.png",fit: BoxFit.cover,)),
          ),
          Container(
            height: 40,
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: 30, //MediaQuery.of(context).size.width*0.9
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white.withAlpha(20),
                borderRadius: BorderRadius.circular(20),
                border: Border(
                  top: BorderSide(width: 2, color: Colors.white),
                  bottom: BorderSide(width: 2, color: Colors.white),
                  left: BorderSide(width: 2, color: Colors.white),
                  right: BorderSide(width: 2, color: Colors.white),
                )),
            child: Center(
              child: TextField(
                onChanged: (value) {
                  controller.name = value;
                },
                cursorColor: Colors.black,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.black, fontSize: 20),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.person_4_outlined,
                  ),
                  hintText: "47".tr,
                  hintStyle: TextStyle(
                      color: Color.fromARGB(255, 184, 184, 184), fontSize: 20),
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
            ),
          ),
          Container(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: 30, //MediaQuery.of(context).size.width*0.9,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white.withAlpha(20),
                borderRadius: BorderRadius.circular(20),
                border: Border(
                  top: BorderSide(width: 2, color: Colors.white),
                  bottom: BorderSide(width: 2, color: Colors.white),
                  left: BorderSide(width: 2, color: Colors.white),
                  right: BorderSide(width: 2, color: Colors.white),
                )),
            child: Center(
              child: TextField(
                onChanged: (value) {
                  controller.password = value;
                },
                cursorColor: Colors.black,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.black, fontSize: 20),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.password_outlined,
                  ),
                  hintText: "49".tr,
                  hintStyle: TextStyle(
                      color: Color.fromARGB(255, 184, 184, 184), fontSize: 20),
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
            ),
          ),
          Container(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: 30, //MediaQuery.of(context).size.width*0.9
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white.withAlpha(20),
                borderRadius: BorderRadius.circular(20),
                border: Border(
                  top: BorderSide(width: 2, color: Colors.white),
                  bottom: BorderSide(width: 2, color: Colors.white),
                  left: BorderSide(width: 2, color: Colors.white),
                  right: BorderSide(width: 2, color: Colors.white),
                )),
            child: Center(
              child: TextField(
                onChanged: (value) {
                  controller.password_confirmation = value;
                },
                cursorColor: Colors.black,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.black, fontSize: 20),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.password_rounded,
                  ),
                  hintText: "65".tr,
                  hintStyle: TextStyle(
                      color: Color.fromARGB(255, 184, 184, 184), fontSize: 20),
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
            ),
          ),
          Container(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: 30, //MediaQuery.of(context).size.width*0.9,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white.withAlpha(20),
                borderRadius: BorderRadius.circular(20),
                border: Border(
                  top: BorderSide(width: 2, color: Colors.white),
                  bottom: BorderSide(width: 2, color: Colors.white),
                  left: BorderSide(width: 2, color: Colors.white),
                  right: BorderSide(width: 2, color: Colors.white),
                )),
            child: Center(
              child: TextField(
                onChanged: (value) {
                  controller.bio = value;
                },
                cursorColor: Colors.black,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.black, fontSize: 20),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.info_outline,
                  ),
                  hintText: "50".tr,
                  hintStyle: TextStyle(
                      color: Color.fromARGB(255, 184, 184, 184), fontSize: 20),
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
            ),
          ),
          Container(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: 30, //MediaQuery.of(context).size.width*0.9,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white.withAlpha(20),
                borderRadius: BorderRadius.circular(20),
                border: Border(
                  top: BorderSide(width: 2, color: Colors.white),
                  bottom: BorderSide(width: 2, color: Colors.white),
                  left: BorderSide(width: 2, color: Colors.white),
                  right: BorderSide(width: 2, color: Colors.white),
                )),
            child: Center(
              child: TextField(
                onChanged: (value) {
                  controller.contacts = value;
                },
                cursorColor: Colors.black,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.black, fontSize: 20),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.info_outline,
                  ),
                  hintText: "53".tr,
                  hintStyle: TextStyle(
                      color: Color.fromARGB(255, 184, 184, 184), fontSize: 20),
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
            ),
          ),
          Container(
            height: 10,
          ),
          Container(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: 30, //MediaQuery.of(context).size.width*0.9,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white.withAlpha(20),
                borderRadius: BorderRadius.circular(20),
                border: Border(
                  top: BorderSide(width: 2, color: Colors.white),
                  bottom: BorderSide(width: 2, color: Colors.white),
                  left: BorderSide(width: 2, color: Colors.white),
                  right: BorderSide(width: 2, color: Colors.white),
                )),
            child: Center(
              child: TextField(
                onChanged: (value) {
                  controller.phone = value;
                },
                cursorColor: Colors.black,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.black, fontSize: 20),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.phone_android_rounded,
                  ),
                  hintText: "51".tr,
                  hintStyle: TextStyle(
                      color: Color.fromARGB(255, 184, 184, 184), fontSize: 20),
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
            ),
          ),
          Container(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: 30, //MediaQuery.of(context).size.width*0.9,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white.withAlpha(20),
                borderRadius: BorderRadius.circular(20),
                border: Border(
                  top: BorderSide(width: 2, color: Colors.white),
                  bottom: BorderSide(width: 2, color: Colors.white),
                  left: BorderSide(width: 2, color: Colors.white),
                  right: BorderSide(width: 2, color: Colors.white),
                )),
            child: Center(
              child: TextField(
                onChanged: (value) {
                  controller.address = value;
                },
                cursorColor: Colors.black,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.black, fontSize: 20),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.home,
                  ),
                  hintText: "52".tr
                  ,
                  hintStyle: TextStyle(
                      color: Color.fromARGB(255, 184, 184, 184), fontSize: 20),
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
            ),
          ),
          Container(
            height: 15,
          ),
          Container(
            child: Row(
              children: [
                Text(
                  "66".tr,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
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
                      controller.city_id = newValue!;
                      //print(dropdownvalue)
                      //  controller.city_id = newValue;
                      setState(() {
                        dropdownvalue.value = newValue;
                      });
                    },
                    items: <String>['Damascus', 'Aleppo', 'Latakia', 'Hama']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Container(
                            child: Text(
                          value,
                          style: TextStyle(fontWeight: FontWeight.bold),
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
          Container(
            child: Row(
              children: [
                Text(
                  "67".tr,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
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
                      controller.place_id = newValue2!;
                      setState(() {
                        dropdownvalue2.value = newValue2;
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
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Container(
                            child: Text(
                          value,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      );
                    }).toList(),
                  );
                }),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "68".tr,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(width: 7.5),
              Obx(() {
                return GFRadio(
                  size: 30,
                  value: 1,
                  groupValue: groupValue.value,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      controller.permission_id = value;
                      groupValue.value = value;
                    });
                  },
                  inactiveIcon: null,
                  activeBorderColor: Color.fromARGB(255, 255, 230, 0),
                  radioColor: Color.fromARGB(255, 255, 230, 0),
                  inactiveBgColor: GFColors.WHITE,
                  inactiveBorderColor: GFColors.WHITE,
                );
              }),
              SizedBox(width: 40),
              Text(
                "69".tr,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(width: 7.5),
              Obx(() {
                return GFRadio(
                  size: 30,
                  value: 3,
                  groupValue: groupValue.value,
                  onChanged: (value) {
                    setState(() {
                      controller.permission_id = value;
                      print(value);
                      groupValue.value = value;
                    });
                  },
                  inactiveIcon: null,
                  activeBorderColor: Color.fromARGB(255, 255, 230, 0),
                  radioColor: Color.fromARGB(255, 255, 230, 0),
                  inactiveBgColor: GFColors.WHITE,
                  inactiveBorderColor: GFColors.WHITE,
                );
              }),
            ],
          ),
          Container(
            height: 15,
          ),
          Container(
            // color: Colors.white,
            // margin: EdgeInsets.only(top: 10),
            child: IconButton(
                icon: Icon(Icons.arrow_forward),
                color: Colors.black,
                iconSize: 40,
                onPressed: () {
                  print("HII");
                  //Get.to(() => Home());
                  //onclickconfirm();
                  print(controller.email);
                  print(controller.confirmcode);
                  controller.photo = imagepath;
                  print(controller.photo!.path);
                  onclicksignup();
                  //ccontroller.ccode();
                }),
          ),
          Container(
            height: 10,
          ),
        ]),
      ))),
    ]));
  }

  Future pickimage() async {
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return print("fddddddd");
    }
    imgholder.value = true;
    imagepath = File(image.path);
    controller.SetProfileImagePath(imagepath!.path);
    //upload();
  }

  Future captureimage() async {
    final image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) {
      return print("fddddddd");
    }
    imgholder.value = true;
    imagepath = File(image.path);

    controller.SetProfileImagePath(imagepath!.path);
  }

  void upload() async {
    base64 = base64Encode(imagepath!.readAsBytesSync());
    String imagename = imagepath!.path.split('/').last;
    print(imagename);
  }

  Future<void> openImagePicker() async {
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    }
  }

  void onclicksignup() async {
    EasyLoading.show(status: "Loading");
    await controller.signuponclick();
    if (controller.signupStatues) {
      EasyLoading.showSuccess("yiay");
      Get.toNamed("/homeL");
    } else {
      EasyLoading.showError("Error");
      print("Error!!!!");
    }
  }

  void onclickconfirm() async {
    EasyLoading.show(status: "Loading");
    await ccontroller.ccode();
    if (ccontroller.confirmationstatue) {
      EasyLoading.showSuccess("yiay2");
      Get.toNamed("/splash2");
    } else {
      EasyLoading.showError(controller.message);
      print("Error!!!!");
    }
  }
}
