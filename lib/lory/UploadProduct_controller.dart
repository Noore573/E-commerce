import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:p
import '../Services/pros_services.dart';
import '../native_services/secure_storage.dart';

class UploadProductController extends GetxController {
  ProServices services = new ProServices();
  var name = 'fd';
  var description = 'vs';
  var price = '200';
  var category = 'shoes';
  var gender = 'women';
  var brand_name = 'nike';
  var material = 'leather';
  int quantity = 4;
  File? photo;
   List<dynamic> sizessss = [];
   List<dynamic> colorsss = [];
  // late File image;
  late String image = "jj";
  bool upstatue = false;
  String? cookies;
  String? token;

  Future<void> uploadproc() async {
    SecureStorage storage = SecureStorage();
    cookies = await storage.read('cookies');
    token = await storage.read('token');

    print(sizessss);
    print(colorsss);
    upstatue = await services.newuploadproduct(
      photo!,
      name,
      description,
      price,
      token!,
      cookies!,
      category,
      gender,
      brand_name,
      material,
      colorsss,
      sizessss,
      quantity,
    );
    update();
    print("uploaded? ${upstatue}");
  }
//  @override
//  void onInit() {
//    super.onInit();
//    _requestPermission();

//  }

//   void _requestPermission() async {
//     final status = await Permission.storage.request();
//     if (status.isGranted) {
//       _loadImageFromExternalStorage();
//     } else {
//       print('Error: Permission not granted');
//     }
//   }
// final String _filename = 'MSalah2022.jpg';
//   void _loadImageFromExternalStorage() async {
//     final file = File('/storage/emulated/0/Download/$_filename');

//     if (await file.exists()) {
//       print('Image file found: ${file.path}');
//       // Do something with the image file
//     } else {
//       print('Error: Image file not found');
//     }
//   }
  // Future<void> uploadproc() async {
  //   upstatue = await services.loadImageFromCache(image);
  //   //loadImageFromCache(image);
  //   //readFile(image);
  //   update();
  //   print("uploaded? ${upstatue}");
  // }

  void loadImageFromCache(String filename) async {
    print(filename);
    String fn = "/storage/emulated/0/Download/MSalah2022.jpg";
    final directory =
        await getTemporaryDirectory(); // Get the app's cache directory
    final imagePath =
        '${directory.path}/$filename'; // Construct the full path to the image file
    final imageFile =
        File(imagePath); // Load the image file from the cache directory

    if (await imageFile.exists()) {
      print('dsdsd');
      // Check if the file exists
      // Do something with the image file
    } else {
      print('Error: Image file not found');
    }
  }

  void readFile(String filename) async {
    print(filename);
    final file = File(filename);
    final length = await file.length();
    final bytes = await file.open().then((f) => f.read(length));
    print('File contents: $bytes');
  }
}
