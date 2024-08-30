import 'dart:io';

import 'package:get/get.dart';
import 'package:project2/Services/register_services.dart';
import 'package:project2/model/user.dart';
import 'package:project2/native_services/secure_storage.dart';
import 'package:project2/register2.dart';
import 'package:project2/server.dart';

import '../Services/SignUpservices.dart';

class RegisterController extends GetxController {
  String name = "";
  String email = "";
  String password = "";
  int permission_id = 1;
  String city_id = "";
  int city_idd = 0;
  String place_id = "";
  int place_idd = 0;
  var phone = "";
  String confirmcode = "";
  String address = "";
  File? photo;
  String? photo_profile;
  String? password_confirmation;
  //var confirmcode = "";
  String? bio;
  String? cookies;
  String? contacts;

  var message;
  var isset = false.obs;
  var profilepicpath = "".obs;

  bool signupStatues = false;
  bool sendcodestatue = false;
  RegisterServices services = RegisterServices();
  @override
  void onInit() async {
    SecureStorage storage = SecureStorage();
    String? cookies = await storage.read('cookies');
    super.onInit();
  }

  void SetProfileImagePath(String path) {
    profilepicpath.value = path;
    print(profilepicpath.value);
    isset.value = true;
  }

  Future<void> sendcode() async {
    User user = new User(
      email: email,
    );
    sendcodestatue = await services.sc(user);
    message = services.message;
    if (message is List) {
      String temp = "";
      for (String s in message) {
        temp += s + '\n';
        message = temp;
      }
    }
  }

  bool confirmcodestatue = false;
  Future<void> Confirmcode() async {
    User user2 = new User(
      email: email,
      confirmcode: confirmcode,
    );
    confirmcodestatue = await services.cc(user2);
    message = services.message;
    if (message is List) {
      String temp = "";
      for (String s in message) {
        temp += s + '\n';
        message = temp;
      }
    }
  }

  Future<void> signuponclick() async {
    SecureStorage storage = SecureStorage();
    cookies = await storage.read('cookies');
    print("Yes");
    // ignore: unnecessary_new
    city_id == 'Damascus'
        ? city_idd = 1
        : city_id == 'Aleppo'
            ? city_idd = 2
            : city_id == 'Latakia'
                ? city_idd = 3
                : city_id == 'Hama'
                    ? city_idd = 4
                    : city_idd = 1;

    place_id == 'حي المزة'
        ? place_idd = 1
        : place_id == 'حي المهاجرين'
            ? place_idd = 2
            : place_id == 'حي قابون'
                ? place_idd = 3
                : place_id == 'حي جرمانا'
                    ? place_idd = 4
                    : place_id == 'حي الجامعة'
                        ? place_idd = 5
                        : place_id == 'حي الازرق'
                            ? place_idd = 6
                            : place_id == 'حي الشعار'
                                ? place_idd = 7
                                : place_id == 'حي الانصاري'
                                    ? place_idd = 8
                                    : place_id == 'حي الاشرفية'
                                        ? place_idd = 9
                                        : place_id == 'حي المطار'
                                            ? place_idd = 10
                                            : place_id == 'حي الاسد'
                                                ? place_idd = 11
                                                : place_id == 'حي المزارع'
                                                    ? place_idd = 12
                                                    : place_id == 'حي المحطة'
                                                        ? place_idd = 13
                                                        : place_id ==
                                                                'حي الحديقة'
                                                            ? place_idd = 14
                                                            : place_id ==
                                                                    'حي الشهباء'
                                                                ? place_idd = 15
                                                                : place_idd = 1;

    User user = new User(
      name: name,
      email: email,
      password: password,
      phone: phone,
      address: address,
      photo: photo,
      photo_profile: photo_profile,
      bio: bio,
      place_id: place_idd,
      city_id: city_idd,
      permission_id: permission_id,
      contacts: contacts,
      //confirmcode: confirmcode,
      cpass: password_confirmation,
    );
    print(user.email);
    signupStatues = await services.register2(user, cookies!);
    //services.registerUserWithPhoto(user);
    message = services.message;
    if (message is List) {
      String temp = "";
      for (String s in message) {
        temp += s + '\n';
        message = temp;
      }
    }
  }
}
