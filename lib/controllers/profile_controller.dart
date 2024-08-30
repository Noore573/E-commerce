import 'dart:io';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:project2/Services/myprofile.services.dart';
import 'package:project2/model/profile.dart';
import 'package:project2/config/userinfo.dart';
import 'package:project2/native_services/secure_storage.dart';
import 'package:path_provider/path_provider.dart';

import '../model/user.dart';

class ProfileController extends GetxController {
  MyProfileServices services = MyProfileServices();
  String name = "";
  late String number = "";
  late String bio = "";
  late String email = "";
  late String details = "";
  late var password = "";
  late File? image1 = null;
  String createdAt = "";
  String createdAtonly = "";
  String address = "";
  File? photo;
  File? phto;
  File? pimage;
  String? path;
  late String contacts = "";
  var myprofile;
  bool editprofilestatues = false;
  late Map<String, dynamic> data = new Map<String, dynamic>();
  List<Profile> myprofile2 = [];
  Future<Future<Uint8List>> readFileFromCDrive(String fileName) async {
    final filePath = 'C:/$fileName';
    return File(filePath).readAsBytes();
  }

  @override
  void onInit() async {
//     SecureStorage storage = SecureStorage();
//     String? token = await storage.read('token');
// //    myprofile = await services.getprofile(token!);
//     myprofile = await services.getprofile('${token}');
//     print("int1");
//     print(myprofile.name);
//     print("int2");
//      name = myprofile.name;
//     address = myprofile.address;
//     bio = myprofile.details;
//     number = myprofile.phone;
//     email = myprofile.email;
//     details = myprofile.details;
//     contacts = myprofile.contact;
//     createdAt = myprofile.created_at;

    //Directory? directory = await getExternalStorageDirectory();
    // path = directory!.path;
    // print(path);
    // name1 = myprofile.name;
    //File img = File('$path/"${myprofile.photo}');
    //File contents = await img.readAsBytes();
    // set the fit mode of the image

    super.onInit();
  }

  void onReady() async {
    //myprofile= await services.getprofile(UserInfo.user_token);
    print("ready1");
    //print(myprofile.name);
    //print(myprofile.photo);
    print("ff");

    print("ready2");
    // name = myprofile.name;
    // address = myprofile.address;
    // bio = myprofile.details;
    // number = myprofile.phone;
    // email = myprofile.email;
    // details = myprofile.details;
    // contacts = myprofile.contact;
    // createdAt = myprofile.created_at;
    //photo = myprofile.photo;
    //print(photo);
    // pimage = File(photo);
    //image1 = myprofile.Photo;

    //password = myprofile.password;
    update();

    super.onReady();
  }

  Future<void> userprofile() async {
    SecureStorage storage = SecureStorage();
    String? token = await storage.read('token');
//    myprofile = await services.getprofile(token!);
    myprofile = await services.getprofile('${token}');
    print("int1");
    print(myprofile.name);
    print("int2");
    name = myprofile.name;
    address = myprofile.address;
    bio = myprofile.details;
    number = myprofile.phone;
    email = myprofile.email;
    details = myprofile.details;
    contacts = myprofile.contact;
    createdAt = myprofile.created_at;
    //profieimage=myprofile.profileimage
    createdAtonly = createdAt.substring(0, 10);
    print(createdAt);
     

    update();
  }

  Future<void> editprofilecontroller(
    File PhotoProfile,File photo,String newname,String newphone,String newpassword,String newpasswordconfirm,String newcontact,String current_password,String newbio,String newaddress )
     async {
    SecureStorage storage = SecureStorage();
    String? cookies = await storage.read('cookies');
    String? token = await storage.read('token');
    print("Yes");
    // User user = new User(
    //   name: newname,
    //   // email: email,
    //   // password: password,
    //   // phone: phone,
    //   // address: address,
    //   // photo: photo,
    //   // photo_profile: photo_profile,
    //   // bio: bio,
    //   //confirmcode: confirmcode,
    //   //cpass: password_confirmation,
    // );

    editprofilestatues = await services.editprofile(PhotoProfile,photo,newname,newphone,newpassword,newpasswordconfirm,newcontact,current_password,newbio,newaddress, cookies!, token!);
    print(" edited? $editprofilestatues");
    //services.registerUserWithPhoto(user);
  }
}
