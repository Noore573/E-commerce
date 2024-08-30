import 'dart:io';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:project2/Services/upprofile_services.dart';
import 'package:project2/model/profile.dart';
import 'package:project2/config/userinfo.dart';
import 'package:project2/native_services/secure_storage.dart';
import 'package:path_provider/path_provider.dart';

class UpProfileController extends GetxController {
  UpProfileServices services = UpProfileServices();

  String name = "";
  //int? profileid = Get.arguments;
  int profileid = 0;
  late String number = "";
  late String bio = "";
  late String details = "";
  late File? image1 = null;
  String createdAt = "";
  String onlycreatedat = "";
  String address = "";
  File? photo;
  File? phto;
  File? pimage;
  String? path;
  late String contacts = "";
  bool upstatues = false;
  var upprofile;
  String? cookies = "";
  String? token = "";
  bool reportuserstatues = false;
  late Map<String, dynamic> data = new Map<String, dynamic>();
  List<Profile> upprofile2 = [];

//   @override
//   void onInit() async {
//     // SecureStorage storage = SecureStorage();
//     // String? token = await storage.read('token');
//     // String? cookie = await storage.read('cookies');
// //    upprofile = await services.getprofile(token!);
//     //print(profileid);

//     print("int1");
//     //print(upprofile.name);
//     print("int2");

//     //Directory? directory = await getExternalStorageDirectory();
//     // path = directory!.path;
//     // print(path);
//     // name1 = upprofile.name;
//     //File img = File('$path/"${upprofile.photo}');
//     //File contents = await img.readAsBytes();
//     // set the fit mode of the image

//     super.onInit();
//   }

//   void onReady() async {
//     //upprofile= await services.getprofile(UserInfo.user_token);
//     // print("ready1");
//     // print(upprofile.name);
//     // //print(upprofile.photo);
//     // print("ff");

//     // print("ready2");
//     // name = upprofile.name;
//     // address = upprofile.address;
//     // bio = upprofile.details;
//     // number = upprofile.phone;
//     // details = upprofile.details;
//     // contacts = upprofile.contact;
//     // createdAt = upprofile.created_at;
//     // upstatues = true;
//     //update();
//     // name = upprofile.name;
//     // address = upprofile.address;
//     // bio = upprofile.details;
//     // number = upprofile.phone;
//     // email = upprofile.email;
//     // details = upprofile.details;
//     // contacts = upprofile.contact;
//     // createdAt = upprofile.created_at;
//     // //photo = upprofile.photo;
//     // //print(photo);
//     // // pimage = File(photo);
//     // //image1 = upprofile.Photo;

//     // //password = upprofile.password;
//     // update();

//     super.onReady();
//   }

  Future<void> getprofile(int pid) async {
    print('controler $pid');
    SecureStorage storage = SecureStorage();
    String? token = await storage.read('token');
    String? cookie = await storage.read('cookies');
    upprofile = await services.getupprofile(pid, token!, cookie!);
    print("ready1");
    print(upprofile.name);
    //print(upprofile.photo);
    print("ff");

    print("ready2");
    name = upprofile.name;
    address = upprofile.address;
    bio = upprofile.details;
    number = upprofile.phone;
    details = upprofile.details;
    contacts = upprofile.contact;
    createdAt = upprofile.created_at;
    onlycreatedat = createdAt.substring(0, 10);

    upstatues = true;
    update();
  }

  Future<void> reportusercontroller(String description) async {
    print("adding...");
    SecureStorage storage = SecureStorage();
    cookies = await storage.read('cookies');
    token = await storage.read('token');
    reportuserstatues =
        await services.reportuser("user", description, token!, cookies!);
    //message = services.message;

    update();
    print(" reported?:$reportuserstatues");
  }
}
