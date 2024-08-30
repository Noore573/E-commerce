import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:project2/model/product.dart';
import 'package:project2/model/user.dart';
import 'package:project2/server.dart';
import 'dart:convert';
import 'dart:io';
import "package:project2/controllers/SignUp_Controller.dart";

class ProServices {
  var urlpro = Uri.parse(ServerConfig.domainNameServer + ServerConfig.pro);
  List<dynamic> colornames = [];
  List<dynamic> sizes = [];
  List<dynamic> colord = [1];
  var message;
  Future<bool> proservice(ProductDet product, String token) async {
    print(product.name);
    var response = await http.post(urlpro, headers: {
      //"Authorization": "Bearer $token",
      "Content-Type": 'application/json',
      "Accept": "application/json",
    }, body: {
      'name': product.name,
      "brand_name": product.brandName,
      'category': product.category,
      'description': product.description,
      'gender': product.gender,
      "material": product.material,
      'photo': product.photo,
      'price': product.price,
      'quantity': product.quantity,
      "sizes": product.sizes,
      // 'photo_profile':user.photo_profile,
      'color_names': product.colors,
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse["success"];
      return true;
    } else if (response.statusCode == 404) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse["message"];
      return false;
    } else {
      message = "??";
      return false;
    }
  }

  //get

  Future<ProductDet> getproduct(int index) async {
    //print(product.name);
    var urlgetpro =
        Uri.parse(ServerConfig.domainNameServer + ServerConfig.pro + '/$index');
    print(urlgetpro);
    var response = await http.get(
      urlgetpro,
      headers: {
        "Content-Type": 'application/json',
        "Accept": "application/json",
      },
    );
    print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var pro = jsonResponse;
      message = jsonResponse["message"];
      colornames = pro["colors"];
      sizes = pro["sizes"];
      //colornames.add(colord[])
      print(message);
      print(jsonResponse);
      List<String> segments = urlgetpro.pathSegments;

      String itemId = segments.last;
      print(segments);
      print(itemId);

      //print(pro[1]);
      return ProductDet.fromJson(pro);
    } else if (response.statusCode == 404) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse["not found"];
      return throw Exception("not found");
    } else {
      message = "??";
      return throw Exception("noo");
    }
  }

  Future<bool> deleteproduct(int index, String token, String cookies) async {
    //print(product.name);
    var urlgetpro =
        Uri.parse(ServerConfig.domainNameServer + ServerConfig.pro + '/$index');
    print(urlgetpro);
    var response = await http.delete(
      urlgetpro,
      headers: {
        "Authorization": "Bearer $token",
        'Cookie': '$cookies',
        "Content-Type": 'application/json',
        "Accept": "application/json",
      },
    );
    print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse["message"];
      print(response.body);
      List<String> segments = urlgetpro.pathSegments;

      String itemId = segments.last;
      print(segments);
      print(itemId);

      //print(pro[1]);
      return true;
    } else if (response.statusCode == 404) {
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      return false;
    } else {
      print("what??");
      return false;
    }
  }

  Future<List<dynamic>> getuserproduct(String cookies, String token) async {
    print('ff ${token} ');
    print('ff $cookies');
    var urlgwl =
        Uri.parse(ServerConfig.domainNameServer + ServerConfig.getuserpro);
    var response = await http.post(urlgwl, headers: {
      "Accept": "application/json",
      //'Cookie':
      //  'laravel_session=EtCXSDup3W9pFRxhU1mBsEX3qCgvCJsE9CwYZluZ; expires=Thu, 18 May 2023 23:03:35 GMT; Max-Age=7200; path=/; httponly; samesite=lax',
      //"Authorization":
      //  "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNThlZWY0Y2JkNTczZDBhNzM2MWJiNDI2MGM2MzIxYzU4OTdlNDk5M2M3NjQ2NTcxZDBkOTY5MmQwYTNmMzQ1ZmY2ZWNkZjM0YzYzYzZmMDAiLCJpYXQiOjE2ODQ0OTUxOTIuNzE0MzgxLCJuYmYiOjE2ODQ0OTUxOTIuNzE0Mzg5LCJleHAiOjE3MTYxMTc1OTEuNzk2MDMsInN1YiI6IjUiLCJzY29wZXMiOltdfQ.LXL922MnYc_-evyhvVMIrjwbB2qCedDR7F8sMOJkxJnhsG7QuNPhncEMH1CIYn8qCbtMllWlkOOBpakq0xcPPOTbOuB36DrG8X3h4Q7gP4fwLF9jv3JaEMeHlsjWttw8tEkkj_Ie1j-cpAeSSKDH7bpN0xecN7v-FJnyzjrDBpkGRyexXsV2ZqRMAEIXM1j-ngPd-Qo8nu_rmqpbrL9ilJHeLxI9BybxboQ157vGc2VXVuYE4XLuvNkuty4aCpk_4G1Uqi9iFV-ckG0nr_kM10VqHDLLpGzlRYCdUysp9b9pmsGGMrK-obiENufAI7qLgs_ivrwwSyIBT2t9k0IUNJpWuU-yf26eTxmxHNeRsqZCueKJ6fqZ8hScfxl9nkuhE2NpoHpHTcQDPmujeMqTIzdxKxFmeAn8isaFex0bjCEg_RVCmmoxYyMqSNxPSyExLpu3-xwJMo4w1IjY5U5YZC3baezn3WiNz_2CKsBmNPl7ov2VfzcIQqEtdlPdMmBYVStKCPoBzB9tSSkmzhxPQcxoIte8ns3e_XM-ftsS17f5_IqnPzPbDDIclO7ycKuqzAf45VFx0RvOqwvfv7Zgl5oB67-xMirMAxhsMDD2nPv2LYvKGhSJqFtG2KArAXBnzXSMihrsJ7yVzZvTkS8BpibR6-LLI6blEMLvyKFYTrU",
      'Cookie': '$cookies',
      "Authorization": "Bearer $token",
    });
    print(response.statusCode);

    //print(response.body);
    //debugPrint(response.body);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      List<dynamic> wl = jsonResponse['products'];

      print(wl);
      return wl;
    } else {
      print(response.statusCode);
      throw new Exception("empty");
    }
  }

  Future<Uint8List> getImageBytes() async {
    var urlgetpro =
        Uri.parse(ServerConfig.domainNameServer + ServerConfig.pro + '/1');
    var response = await http.get(
      urlgetpro,
      headers: {
        "Content-Type": 'application/json',
        "Accept": "application/json",
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var image = jsonResponse['photo'];
      print("fff $image");

      return image.bodyBytes;
    } else {
      throw new Exception("image error");
    }
  }

  Future<List<dynamic>> productfilter() async {
    var urlpf =
        Uri.parse(ServerConfig.domainNameServer + ServerConfig.profilter);
    var response = await http.post(
      urlpf,
      headers: {
        "Accept": "application/json",
      },
    );
    print(response.statusCode);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      List<dynamic> wl = jsonResponse;
      print(wl);
      return wl;
    } else {
      print(response.statusCode);
      //throw new Exception("empty");
      return [];
    }
  }

  Future<List<dynamic>> productfiltercat(String cat, String gender) async {
    var urlpf =
        Uri.parse(ServerConfig.domainNameServer + ServerConfig.profilter);
    var response = await http.post(urlpf, headers: {
      "Accept": "application/json",
    }, body: {
      'category': cat,
      'gender': gender,
    });
    print(response.statusCode);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      List<dynamic> wl = jsonResponse;

      print(wl);
      return wl;
    } else {
      print(response.statusCode);
      //throw new Exception("empty");
      return [];
    }
  }

  Future<List<dynamic>> getprofilepro(int userid) async {
    var urlpf =
        Uri.parse(ServerConfig.domainNameServer + ServerConfig.profilter);
    var response = await http.post(urlpf, headers: {
      "Accept": "application/json",
    }, body: {
      'user_id': '$userid',
    });
    print(response.statusCode);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      List<dynamic> wl = jsonResponse;

      print(wl);
      return wl;
    } else {
      print(response.statusCode);
      //throw new Exception("empty");
      return [];
    }
  }

  Future<bool> addtocart(String product_id, String color_id, String size,
      String quantity, String token, String cookies) async {
    var urlatv = Uri.parse(ServerConfig.domainNameServer + ServerConfig.cart);
    var response = await http.post(urlatv, headers: {
      "Accept": "application/json",
      'Cookie': '$cookies',
      "Authorization": "Bearer $token",
    }, body: {
      'product_id': '$product_id',
      'color_id': '$color_id',
      'size': '$size',
      'quantity': '$quantity',
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> reportproduct(
      String title, String description, String token, String cookies) async {
    var urlatv = Uri.parse(ServerConfig.domainNameServer + ServerConfig.report);
    var response = await http.post(urlatv, headers: {
      "Accept": "application/json",
      'Cookie': '$cookies',
      "Authorization": "Bearer $token",
    }, body: {
      "description": description,
      "title": title
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> setriview(String rating, String comment, String id, String token,
      String cookies) async {
    var urlatv = Uri.parse(
        ServerConfig.domainNameServer + ServerConfig.review + '/${id}/reviews');
    var response = await http.post(urlatv, headers: {
      "Accept": "application/json",
      'Cookie': '$cookies',
      "Authorization": "Bearer $token",
    }, body: {
      "rating": rating,
      "comment": comment
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<dynamic>> getreview(int id, String token, String cookies) async {
    var urlatv = Uri.parse(
        ServerConfig.domainNameServer + ServerConfig.review + '/${id}/reviews');
    var response = await http.get(
      urlatv,
      headers: {
        "Accept": "application/json",
        'Cookie': '$cookies',
        "Authorization": "Bearer $token",
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      List<dynamic> wl = jsonResponse;

      print(wl);
      return wl;
    } else {
      List<dynamic> wl = [];
      return wl;
    }
  }

  Future<bool> changeprice(
      int price, List<int> pros, String token, String cookies) async {
    var urlatv = Uri.parse(ServerConfig.domainNameServer + ServerConfig.report);
    var response = await http.post(urlatv, headers: {
      "Accept": "application/json",
      'Cookie': '$cookies',
      "Authorization": "Bearer $token",
    }, body: {});
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  // Future<bool> uploadProduct(
  //     String? name,
  //     String? description,
  //     String? price,
  //     String? token,
  //     String? cookies,
  //     String? category,
  //     String? gender,
  //     String? brand_name,
  //     String? material,
  //     List<dynamic> sizes,
  //     List<dynamic> colors,
  //     File image,
  //     String qunatiy,

  //     ) async {
  //   var urluploadproduct =
  //       Uri.parse(ServerConfig.domainNameServer + ServerConfig.pro);
  //   final imageBytes = await _getImageBytes(image.path);
  //   final response = await http.post(
  //     urluploadproduct,
  //     headers: {
  //       'Content-Type':'multipart/form-data',
  //       'Content-Type': 'application/json',
  //       'Cookie': '$cookies',
  //       "Authorization": "Bearer $token",
  //     },
  //     body: {
  //       'name': name,
  //       'description': description,
  //       'price': price,
  //       'category': category,
  //       'gender': gender,
  //       'brand_name': brand_name,
  //       'material': material,
  //       'sizes': jsonEncode(sizes),
  //       'colors': jsonEncode(colors),
  //       'image': http.MultipartFile.fromBytes(
  //         'image',
  //         imageBytes,
  //         filename: _getFileName(image.path),
  //       ),
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     print('Product uploaded successfully');
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // Future<List<int>> _getImageBytes(String imagePath) async {
  //   final file = File(imagePath);
  //   return await file.readAsBytes();
  // }

  // String _getFileName(String path) {
  //   final parts = path.split('/');
  //   return parts[parts.length - 1];
  // }

  Future<bool> uploadProduct(
    String? name,
    String? description,
    String? price,
    String? token,
    String? cookies,
    String? category,
    String? gender,
    String? brand_name,
    String? material,
    List<dynamic> sizes,
    List<dynamic> colors,
    String image,
    String qunatiy,
  ) async {
    // Get the directory where the emulator stores its files
    final directory = await getExternalStorageDirectory();
    final emulatorPath = directory!.path;
    final imagePath = '$image';
    final imageFile = File(imagePath);
    var urluploadproduct =
        Uri.parse(ServerConfig.domainNameServer + ServerConfig.pro);
    //final imageBytes = await _getImageBytes(image.path);
// final imageStream = http.ByteStream(image.openRead());
//   final imageSize = await image.length();

    // Create a new multipart request
    final request = http.MultipartRequest('POST', urluploadproduct);

    // Set headers
    request.headers['Content-Type'] = 'multipart/form-data';
    request.headers['Content-Type'] = 'application/json';
    request.headers['Cookie'] = cookies!;
    request.headers['Authorization'] = 'Bearer $token';

    // Add fields

    request.fields['name'] = name!;
    request.fields['description'] = description!;
    request.fields['price'] = price!;
    request.fields['category'] = category!;
    request.fields['gender'] = gender!;
    request.fields['brand_name'] = brand_name!;
    request.fields['material'] = material!;
    request.fields['sizes'] = jsonEncode(sizes);
    request.fields['colors'] = jsonEncode(colors);
    request.fields['quantity'] = qunatiy;

    // Add image file
    // final multipartFile = http.MultipartFile.fromBytes(
    //   'image',
    //   imageBytes,
    //   filename: _getFileName(image.path),
    // );
    // //request.files.add(multipartFile);
    //   final multipartFile = http.MultipartFile(
    //   'image',
    //   imageStream,
    //   imageSize,
    //   filename: image.path.split('/').last,
    // );
    // request.files.add(multipartFile);
    var imagesend = await http.MultipartFile.fromPath('image', imageFile.path);
    request.files.add(imagesend);
    print(imageFile.path);

    // Send the request
    request.followRedirects = false;
    var response = await request.send();
    //final responseString = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      print('Product uploaded successfully');
      return true;
    } else if (response.statusCode == 302) {
      var location = response.headers['location'];
      var redirectRequest = http.Request('POST', Uri.parse(location!));
      redirectRequest.followRedirects = true;
      response = await redirectRequest.send();
      print(response.stream);
      print(response.statusCode);
      return true;
    } else {
      print(response.stream);
      print(response.statusCode);
      //print('Image upload failed with status code ${response.statusCode}.');
      //print('Error message: $responseString');

      return false;
    }
  }

  Future<List<int>> _getImageBytes(String imagePath) async {
    final file = File(imagePath);
    return await file.readAsBytes();
  }

  String _getFileName(String path) {
    final parts = path.split('/');
    return parts[parts.length - 1];
  }

  //new test
  Future<bool> newuploadproduct(
    File photo1,
    String name,
    String description,
    String price,
    String token,
    String cookie,
    String category,
    String gender,
    String brandName,
    String material,
    List<dynamic> colorsss,
    List<dynamic> sizessss,
    int quantity,
  ) async {
    print(quantity);
    print(material);
    print(sizessss);
    print(colorsss);
    List<String> colors2 = ["1","2","3"];
    var urluploadproductttt =
        Uri.parse(ServerConfig.domainNameServer + ServerConfig.pro);
    var request = http.MultipartRequest('POST', urluploadproductttt);
    // request.headers['Authorization'] = 'Bearer $token';
    // request.headers['Cookie'] = cookie;
    request.headers.addAll({
      "Accept": "application/json",
      'Cookie': '$cookie',
      "Authorization": "Bearer $token",
    });
    request.files.add(await http.MultipartFile.fromPath('photo', photo1.path));
    request.fields['name'] = name;
    request.fields['description'] = description;
    request.fields['price'] = price.toString();
    request.fields['category'] = category;
    request.fields['gender'] = gender;
    request.fields['brand_name'] = brandName;
    request.fields['material'] = material;
    request.fields['quantity'] = quantity.toString();
    // final body = jsonEncode({'colors': colors});
    // final body2 = jsonEncode({'sizes': sizes});
    //request.fields['colors[]'] = colors
    //request.fields['colors'] = json.encode(colors2);
    for (var i = 0; i < colorsss.length; i++) {
      request.fields['colors[$i]'] = colorsss[i];
    }
    for (var i = 0; i < sizessss.length; i++) {
      request.fields['sizes[$i]'] = sizessss[i];
    }
    // request.fields['colors'] = body;
    //request.fields['sizes[]'] = "large";
    // request.fields['sizes[]'] = sizes.join(',');
    // request.fields['sizes[]'] = sizes.join(',');
    var response = await request.send();
    var responseString = await response.stream.bytesToString();
    if (response.statusCode == 201) {
      print("Product uploaded");
      return true;
    } else {
      print(responseString);
      print(urluploadproductttt);
      print("Error uploading photo: ${response.statusCode}");
      return false;
    }
  }
}
