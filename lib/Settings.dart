import 'dart:convert';
import 'dart:io';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import "package:project2/controllers/Login_Controller.dart";
import "package:project2/controllers/SignUp_Controller.dart";
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:project2/controllers/logout_controller.dart';
import 'package:project2/controllers/profile_controller.dart';
import 'package:project2/controllers/theme_controller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:getwidget/getwidget.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:project2/server.dart';
import 'package:flutter/material.dart';

import 'color.dart';
import 'config/gobals.dart';
import 'native_services/secure_storage.dart';

Logoutcontroller lcontroller = Get.put(Logoutcontroller());
RxString currentpass = "".obs;

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  var _expandedL = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Column(children: [
          Stack(children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50, left: 10),
                  height: 30,
                  width: 30,
                  color: Color.fromARGB(255, 255, 230, 0),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50, left: 10),
                  height: 30,
                  width: 30,
                  color: Colors.grey,
                ),
                Container(
                  margin: EdgeInsets.only(top: 50, left: 10),
                  height: 30,
                  width: 30,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                SizedBox(
                  width: 160,
                ),
                Container(
                  margin: EdgeInsets.only(top: 50, left: 10),
                  height: 30,
                  width: 30,
                  color: Color.fromARGB(255, 255, 230, 0),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50, left: 10),
                  height: 30,
                  width: 30,
                  color: Colors.grey,
                ),
                Container(
                  margin: EdgeInsets.only(top: 50, left: 10),
                  height: 30,
                  width: 30,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ],
            ),
            Center(
              child: Container(
                  width: 130,
                  height: 130,
                  child: Image.asset("images/yellowicon.png")),
            ),
          ]),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 70,
            child: ListTile(
              splashColor: Colors.blue,
              leading: Icon(Icons.manage_accounts),
              title: Text("19".tr),
              onTap: () {
                Get.to(() => accountinfo());
              },
            ),
          ),
          // Container(
          //   height: 70,
          //   child: ListTile(
          //     splashColor: Colors.blue,
          //     leading: Icon(Icons.view_carousel_outlined),
          //     title: Text("Themes"),
          //     onTap: () {
          //       Get.to(() => Themes());
          //     },
          //   ),
          // ),
          // Container(
          //   height: 70,
          //   child: ListTile(
          //     splashColor: Colors.blue,
          //     leading: Icon(Icons.privacy_tip),
          //     title: Text("Privacy"),
          //     onTap: () {
          //       Get.to(() => Privacy());
          //     },
          //   ),
          // ),
          // Obx(() {
          //   RxInt isselectedL = 1.obs;
          //   return Container(
          //     child: ExpansionPanelList(
          //       animationDuration: Duration(milliseconds: 500),
          //       children: [
          //         ExpansionPanel(
          //           headerBuilder: (context, isExpanded) {
          //             return ListTile(
          //               onTap: () {
          //                 _expandedL(!(_expandedL.value));
          //               },
          //               splashColor: Colors.blue,
          //               leading: Icon(Icons.language),
          //               title: Text("20".tr),
          //             );
          //           },
          //           body: Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               Obx(() {
          //                 return InkWell(
          //                   onTap: () {
          //                     isselectedL.value = 1;
          //                     print("Changed Language");
          //                   },
          //                   child: Container(
          //                     height: 50,
          //                     width: 50,
          //                     decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(30),
          //                       border: isselectedL.value == 1
          //                           ? Border.all(
          //                               color: Color.fromARGB(255, 0, 136, 255),
          //                               width: 6)
          //                           : Border.all(
          //                               color:
          //                                   Color.fromARGB(255, 255, 255, 255),
          //                               width: 3),
          //                     ),
          //                     child: Image(image: AssetImage("images/uk.png")),
          //                   ),
          //                 );
          //               }),
          //               SizedBox(
          //                 width: 30,
          //               ),
          //               Obx(() {
          //                 return InkWell(
          //                   onTap: () {
          //                     isselectedL.value = 2;
          //                     print("تم تغيير اللغة");
          //                   },
          //                   child: Container(
          //                     height: 50,
          //                     width: 50,
          //                     decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(30),
          //                       border: isselectedL.value == 2
          //                           ? Border.all(
          //                               color: Color.fromARGB(255, 0, 136, 255),
          //                               width: 6)
          //                           : Border.all(
          //                               color:
          //                                   Color.fromARGB(255, 255, 255, 255),
          //                               width: 3),
          //                     ),
          //                     child: Image(image: AssetImage("images/ksa.png")),
          //                   ),
          //                 );
          //               }),
          //             ],
          //           ),
          //           isExpanded: _expandedL.value,
          //           canTapOnHeader: true,
          //         ),
          //       ],
          //     ),
          //   );
          // }),
          Container(
            height: 70,
            child: ListTile(
              splashColor: Colors.blue,
              leading: Icon(Icons.info),
              title: Text("21".tr),
              onTap: () {
                Get.to(() => About());
              },
            ),
          ),
          Container(
            height: 70,
            child: ListTile(
              splashColor: Colors.blue,
              leading: Icon(Icons.email),
              title: Text("22".tr),
              onTap: () {
                Get.to(ContactDevs());
              },
            ),
          ),
          Container(
            height: 70,
            child: ListTile(
              splashColor: Colors.blue,
              leading: Icon(Icons.rocket_launch_rounded),
              title: Text("23".tr),
              onTap: () {
                Get.to(() => AppDemo());
              },
            ),
          ),
          Container(
            height: 70,
            child: ListTile(
              splashColor: Colors.blue,
              leading: Icon(Icons.supervised_user_circle),
              title: Text("24".tr),
              onTap: () {},
            ),
          ),
          Container(
            height: 70,
            child: ListTile(
              splashColor: Colors.blue,
              leading: Icon(Icons.login),
              title: Text("25".tr),
              onTap: () async {
                onclicklogout();
              },
            ),
          ),
        ]),
      ],
    ));
  }
}

class accountinfo extends StatefulWidget {
  @override
  State<accountinfo> createState() => _accountinfoState();
}

class _accountinfoState extends State<accountinfo> {
  File? _image;
  File? _image2;
  final _picker = ImagePicker();

  ProfileController controllerp = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Get.bottomSheet(Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(children: [
                  TextField(
                      decoration: InputDecoration(
                          hintText: "Enter current password",
                          suffixIcon: IconButton(
                              onPressed: () {
                                Get.to(Editaccountinfo(),
                                    arguments: currentpass);
                              },
                              icon: Icon(Icons.play_arrow_rounded))),
                      onChanged: (value) {
                        setState(() {
                          currentpass.value = value;
                        });
                      }),
                ]),
              ));
            },
            // Get.to(Editaccountinfo());
            icon: Icon(
              Icons.edit_note_rounded,
              size: 40,
            ),
          )
        ],
        //backgroundColor: Color.fromARGB(255, 255, 230, 0),
      ),
      body: GetBuilder<ProfileController>(
        builder: (controller) => Container(
          decoration:
              isDarkMode == false ? gardientBackground : gardientBackground4,
          //  BoxDecoration(

          //   // image: DecorationImage(
          //   //     fit: BoxFit.fill,
          //   //     image:
          //   //         AssetImage('images/5c2fdd99b189119c2cab6e116469606a.jpg')),
          // ),
          child: ListView(children: [
            Column(children: [
              Container(
                  // decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //         fit: BoxFit.fill,
                  //         image: AssetImage('images/background1.png'))),
                  child: Column(children: [
                Stack(
                  children: [
                    InkWell(
                      onLongPress: () {
                        print("image1");
                        //_openImagePicker();
                      },
                      child:
                          //  Image.asset(
                          //   " images/1.png",
                          _image != null
                              ? Image.file(
                                  _image!,
                                  fit: BoxFit.fill,
                                )
                              : const Image(image: AssetImage("images/1.png")),
                    ),
                    Center(
                      child: InkWell(
                        onLongPress: () {
                          _openImagePicker();
                        },
                        child: InkWell(
                          child: Container(
                              height: 150,
                              width: 150,
                              margin: EdgeInsets.only(top: 150),
                              child: GFAvatar(
                                  backgroundImage: AssetImage("images/2.png"),
                                  shape: GFAvatarShape.circle)),
                        ),
                      ),
                    ),
                  ],
                ),
              ])),
              SizedBox(
                height: 5,
              ),
              // Container(
              //    alignment: Alignment.center,
              //   width: double.infinity,
              //   height: 300,
              //   color: Colors.grey[300],
              //   child:
              //       _image != null ? Image.file(_image!) : const Text('No Image'),
              // ),
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blue)),
                height: 70,
                child: ListTile(
                  splashColor: Colors.blue,
                  //trailing: Icon(Icons.edit),
                  title: Text("${'47'.tr}:${controllerp.name}"),
                  onTap: () {},
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blue)),
                height: 70,
                child: ListTile(
                  splashColor: Colors.blue,
                  //  trailing: Icon(Icons.edit),
                  title: Text("${'48'.tr}:${controllerp.email}"),
                  onTap: () {},
                ),
              ),
              // Container(
              //   decoration:
              //       BoxDecoration(border: Border.all(color: Colors.blue)),
              //   height: 70,
              //   child: ListTile(
              //     splashColor: Colors.blue,
              //     //  trailing: Icon(Icons.edit),
              //     title: Text("${'49'.tr}:${controllerp.password}"),
              //     onTap: () {},
              //   ),
              // ),
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blue)),
                height: 70,
                child: ListTile(
                  splashColor: Colors.blue,
                  //   trailing: Icon(Icons.edit),
                  title: Text("${'50'.tr}:${controllerp.details}"),
                  onTap: () {},
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blue)),
                height: 70,
                child: ListTile(
                  splashColor: Colors.blue,
                  //   trailing: Icon(Icons.edit),
                  title: Text("${'51'.tr}:${controllerp.number}"),
                  onTap: () {},
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blue)),
                height: 70,
                child: ListTile(
                  splashColor: Colors.blue,
                  //  trailing: Icon(Icons.edit),
                  title: Text("${'52'.tr}:${controllerp.address}"),
                  onTap: () {},
                ),
              ),
              SizedBox(
                height: 50,
              )
            ]),
          ]),
        ),
      ),
    );
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

  Future<void> _openImagePicker2() async {
    final XFile? pickedImage2 =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage2 != null) {
      setState(() {
        _image2 = File(pickedImage2.path);
      });
    }
  }
}

class Editaccountinfo extends StatefulWidget {
  @override
  State<Editaccountinfo> createState() => _EditaccountinfoState();
}

class _EditaccountinfoState extends State<Editaccountinfo> {
  File? _image;
  File? _image2;
  final _picker = ImagePicker();

  ProfileController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    RxString currentpass = Get.arguments;
    RxString newname = controller.name.obs;
    RxString newphone = controller.number.obs;
    RxString newpassword = currentpass.value.obs;
    RxString newpasswordconfirm = currentpass.value.obs;
    RxString newcontact = controller.contacts.obs;
    String current_password = currentpass.value;
    RxString newbio = controller.bio.obs;
    RxString newaddress = controller.address.obs;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                controller.editprofilecontroller(
                    _image!,
                    _image2!,
                    newname.value,
                    newphone.value,
                    newpassword.value,
                    newpasswordconfirm.value,
                    newcontact.value,
                    current_password,
                    newbio.value,
                    newaddress.value);
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: GetBuilder<ProfileController>(
        builder: (controller) => Container(
          decoration:
              isDarkMode == false ? gardientBackground3 : gardientBackground5,
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //       fit: BoxFit.fill,
          //       image:
          // AssetImage('images/0396af77e21143921aee8608b687b1c6.jpg')),
          // ),
          child: ListView(children: [
            Column(children: [
              Container(
                  decoration: BoxDecoration(
                      // image: DecorationImage(
                      //     fit: BoxFit.fill,
                      //     image: AssetImage('images/background1.png'))
                      ),
                  child: Column(children: [
                    Container(
                      height: 250,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          InkWell(
                            onLongPress: () {
                              print("image1");
                              _openImagePicker();
                            },
                            child:
                                //  Image.asset(
                                //   " images/1.png",
                                _image != null
                                    ? Image.file(
                                        _image!,
                                        fit: BoxFit.fill,
                                      )
                                    : const Image(
                                        image: AssetImage("images/1.png")),
                          ),
                          Center(
                            child: InkWell(
                                onTap: () {
                                  _openImagePicker2();
                                },
                                child: Container(
                                    height: 200,
                                    width: 200,
                                    margin: EdgeInsets.only(top: 120),
                                    child: _image2 != null
                                        ? GFAvatar(
                                            child:
                                                Icon(Icons.camera_alt_outlined),
                                            backgroundImage:
                                                FileImage(_image2!, scale: 2),
                                            // child:Image.file(_image2!,fit: ,),
                                            shape: GFAvatarShape.circle)
                                        : GFAvatar(
                                            backgroundImage: AssetImage(
                                                "images/defaultavatar.jpg"),
                                            child:
                                                Icon(Icons.camera_alt_outlined),
                                            shape: GFAvatarShape.circle))
                                // AssetImage("images/2.png"),

                                ),
                          ),
                        ],
                      ),
                    ),
                  ])),
              SizedBox(
                height: 5,
              ),
              // Container(
              //    alignment: Alignment.center,
              //   width: double.infinity,
              //   height: 300,
              //   color: Colors.grey[300],
              //   child:
              //       _image != null ? Image.file(_image!) : const Text('No Image'),
              // ),
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blue)),
                height: 70,
                child: ListTile(
                  splashColor: Colors.blue,
                  trailing: Icon(Icons.edit),
                  title: TextFormField(
                    decoration: InputDecoration(hintText: '47'.tr),
                    onChanged: (value) => newname.value = value,
                  ),

                  //Text("Username: ${controller.name}"),
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blue)),
                height: 70,
                child: ListTile(
                  splashColor: Colors.blue,
                  trailing: Icon(Icons.edit),
                  title: TextFormField(
                    decoration: InputDecoration(hintText: "new password"),
                    onChanged: (value) => newpassword.value = value,
                  ),
                  // Text("Email: ${controller.email}"),
                  // onTap: () {},
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blue)),
                height: 70,
                child: ListTile(
                  splashColor: Colors.blue,
                  trailing: Icon(Icons.edit),
                  title: TextFormField(
                    decoration:
                        InputDecoration(hintText: "confirm new password"),
                    onChanged: (value) => newpasswordconfirm.value = value,
                  ),
                  // Text("Email: ${controller.email}"),
                  // onTap: () {},
                ),
              ),
              // Container(
              //   decoration:
              //       BoxDecoration(border: Border.all(color: Colors.blue)),
              //   height: 70,
              //   child: ListTile(
              //     splashColor: Colors.blue,
              //     trailing: Icon(Icons.edit),
              //     title: TextFormField(
              //       decoration: InputDecoration(hintText: '49'.tr),
              //       onChanged: (value) => newbio.value = value,
              //     ),
              //     // title: Text("Password: ${controller.password}"),
              //     // onTap: () {},
              //   ),
              // ),
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blue)),
                height: 70,
                child: ListTile(
                  splashColor: Colors.blue,
                  trailing: Icon(Icons.edit),
                  title: TextFormField(
                    decoration: InputDecoration(hintText: '50'.tr),
                    onChanged: (value) => newbio.value = value,
                  ),
                  // title: Text("details: ${controller.details}"),
                  // onTap: () {},
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blue)),
                height: 70,
                child: ListTile(
                  splashColor: Colors.blue,
                  trailing: Icon(Icons.edit),
                  title: TextFormField(
                    decoration: InputDecoration(hintText: '51'.tr),
                    onChanged: (value) => newphone.value = value,
                  ),
                  // title: Text("Phone Number: ${controller.number}"),
                  // onTap: () {},
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blue)),
                height: 70,
                child: ListTile(
                  splashColor: Colors.blue,
                  trailing: Icon(Icons.edit),
                  title: TextFormField(
                    decoration: InputDecoration(hintText: '52'.tr),
                    onChanged: (value) => newaddress.value = value,
                  ),
                  // title: Text("address: ${controller.address}"),
                  // onTap: () {},
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blue)),
                height: 70,
                child: ListTile(
                  splashColor: Colors.blue,
                  trailing: Icon(Icons.edit),
                  title: TextFormField(
                    decoration: InputDecoration(hintText: '53'.tr),
                    onChanged: (value) => newcontact.value = value,
                  ),
                  // title: Text("address: ${controller.address}"),
                  // onTap: () {},
                ),
              ),
              SizedBox(
                height: 50,
              )
            ]),
          ]),
        ),
      ),
    );
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

  Future<void> _openImagePicker2() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image2 = File(pickedImage.path);
      });
    }
  }
}

class Themes extends StatefulWidget {
  @override
  State<Themes> createState() => _ThemesState();
}

class _ThemesState extends State<Themes> {
  ThemeController controller2 = Get.put(ThemeController());
  RxBool isselected = true.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<ThemeController>(
        builder: (controller2) => Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(controller2.backgroundimage))),
          child: Center(
            child: ListView(scrollDirection: Axis.horizontal, children: [
              Row(
                children: [
                  Container(
                    height: 280,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30),
                      border: isselected.value == false
                          ? Border.all(
                              color: Color.fromARGB(255, 0, 136, 255), width: 6)
                          : Border.all(
                              color: Color.fromARGB(255, 255, 255, 255),
                              width: 3),
                      image: DecorationImage(
                          image: AssetImage(
                            "images/Dark.jpg",
                          ),
                          fit: BoxFit.fill),
                    ),
                    child: InkWell(
                      onTap: () {
                        isselected.value = !isselected.value;

                        controller2.changebackground("images/Darkback.jpg");
                        //backgroundimage = "images/Darkback.jpg";
                      },
                    ),
                  ),

                  InkWell(
                    child: Container(
                      height: 280,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(30),
                        border: isselected.value == true
                            ? Border.all(
                                color: Color.fromARGB(255, 0, 136, 255),
                                width: 6)
                            : Border.all(
                                color: Color.fromARGB(255, 255, 255, 255),
                                width: 3),
                        image: DecorationImage(
                            image: AssetImage(
                              "images/Light.jpg",
                            ),
                            fit: BoxFit.fill),
                      ),
                      child: InkWell(
                        onTap: () {
                          controller2.changebackground("images/Lightback.jpg");
                          // backgroundimage = "images/Lightback.jpg";
                        },
                      ),
                    ),
                  )

                  // Card(
                  //   child: InkWell(
                  //     onTap: () {},
                  //     child: Container(
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(50)
                  //       ),
                  //       height: 250,
                  //       width: 200,
                  //        child: Image.asset("images/Light.jpg",fit: BoxFit.fill,),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class Privacy extends StatefulWidget {
  @override
  State<Privacy> createState() => _PrivacyState();
}

LoginController controllerL = Get.find();

class _PrivacyState extends State<Privacy> {
  @override
  Widget build(BuildContext context) {
    var checkboxtest = controllerL.checkboxstatus;
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Container(
              height: 70,
              child: Obx(() {
                return CheckboxListTile(
                  title: Text("Remmeber Login information "),
                  secondary: Icon(Icons.token_rounded),
                  value: controllerL.checkboxstatus.value,
                  onChanged: (val) {
                    controllerL.changeCheckBox();
                  },
                );
              })),
          Container(
              height: 70,
              child: Obx(() {
                return CheckboxListTile(
                  title: Text("Hide Address "),
                  secondary: Icon(Icons.home_outlined),
                  value: controllerL.checkboxstatus.value,
                  onChanged: (val) {},
                );
              })),
          Container(
              height: 70,
              child: Obx(() {
                return CheckboxListTile(
                  secondary: Icon(Icons.phone_disabled_rounded),
                  title: Text("Hide Phone number "),
                  value: controllerL.checkboxstatus.value,
                  onChanged: (val) {},
                );
              })),
          Container(
              height: 70,
              child: Obx(() {
                return CheckboxListTile(
                  title: Text("Make account private  "),
                  secondary: Icon(Icons.private_connectivity),
                  value: controllerL.checkboxstatus.value,
                  onChanged: (val) {},
                );
              })),
        ],
      ),
    );
  }
}

class ContactDevs extends StatefulWidget {
  const ContactDevs({super.key});

  @override
  State<ContactDevs> createState() => _ContactDevsState();
}

class _ContactDevsState extends State<ContactDevs> {
  ThemeController controllerrep = Get.put(ThemeController());
  String reptext = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          isDarkMode == false ? gardientBackground : gardientBackground4,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                "Tell us your problem",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Enter here"),
              onChanged: (value) {
                setState(() {
                  reptext = value;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            IconButton(
                onPressed: () {
                  controllerrep.reportcontroller(reptext);
                },
                icon: Icon(
                  Icons.telegram,
                  size: 40,
                  color: Color.fromARGB(255, 255, 230, 0),
                ))
          ],
        ),
      ),
    );
  }
}

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image:
                    AssetImage('images/02cec44627918d4a756d87e3976c7f89.jpg'))),
        child: Column(
          children: [
            Center(
              child: Text("Welcome to our app! \n we are... "),
            ),
          ],
        ));
  }
}

class AppDemo extends StatefulWidget {
  @override
  State<AppDemo> createState() => _AppDemoState();
}

class _AppDemoState extends State<AppDemo> {
  List<Container> cards = [
    Container(
      alignment: Alignment.center,
      child: const Text('1'),
      color: Colors.blue,
    ),
    Container(
      alignment: Alignment.center,
      child: const Text('2'),
      color: Colors.red,
    ),
    Container(
      alignment: Alignment.center,
      child: const Text('3'),
      color: Colors.purple,
    )
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

//  Future<bool> logout() async {
//     SecureStorage storage = SecureStorage();
//     //String? cookies1 = await storage.read('cookies');
//     String? token = await storage.read('token');
//   var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.logout);
//     var response = await http.post(url, headers: {
//       "Accept": "application/json",
//       'Authorization': 'Bearer $token'
//     },
//     );
//     print(response.statusCode);
//     print(response.body);
//     if (response.statusCode == 200) {
//       return true;
//     } else {
//       return false;
//     }
//   }
void onclicklogout() async {
  EasyLoading.show(status: "Loading");
  await lcontroller.logoutc();
  if (lcontroller.logoutstatue) {
    EasyLoading.showSuccess("Logedout");
    Get.offAllNamed(
      "/login",
    );
  } else {
    EasyLoading.showError("Error!");
    print("Error!!");
  }
}
