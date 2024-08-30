import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:project2/model/user.dart';
import 'package:project2/server.dart';
import 'dart:convert';
import 'dart:io';
import "package:project2/controllers/SignUp_Controller.dart";

import '../native_services/secure_storage.dart';

class RegisterServices {
  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.register2);
  var url2 = Uri.parse(ServerConfig.domainNameServer + ServerConfig.code);
  var url3 = Uri.parse(ServerConfig.domainNameServer + ServerConfig.register);
  String? token = "";
  String? cookie = '';
  //var url3 = Uri.parse(ServerConfig.domainNameServer + ServerConfig.r);
  var message;
  SecureStorage storage = SecureStorage();
  // Future<bool> register2(User user, String cookies) async {
  //   print(
  //       "${user.email},${user.name},${user.password},${user.phone},${user.address},${user.bio},${user.photo}");
  //   var response = await http.post(url3, headers: {
  //     "Accept": "application/json",
  //     'Cookie': '$cookies',
  //   }, body: {
  //     'name': user.name,
  //     "email": user.email,
  //     'password': user.password,
  //     'phone': user.phone,
  //     'address': user.address,
  //     "password_confirmation": user.cpass,
  //     //'verification_code': user.confirmcode,
  //     'bio': user.bio,
  //     'contact': user.bio,
  //     "place_id": user.place_id.toString(),
  //     "city_id": user.city_id.toString(),
  //     "permission_id": user.permission_id.toString(),

  //     //"photo" :user.photo,
  //     // 'photo_profile':user.photo_profile,
  //     //'cofirmcode':user.confirmcode,
  //   });
  //   print(response.statusCode);
  //   print(response.body);
  //   if (response.statusCode == 200) {
  //     var jsonResponse = jsonDecode(response.body);
  //     message = jsonResponse["success"];
  //     token = jsonResponse['access_token'];
  //      SecureStorage storage = SecureStorage();
  //       await storage.save('token', token!);

  //     return true;
  //   } else if (response.statusCode == 404) {
  //     var jsonResponse = jsonDecode(response.body);
  //     message = jsonResponse["message"];
  //     return false;
  //   } else {
  //     message = "??";
  //     return false;
  //   }
  // }

  Future<bool> register2(User user, String cookies) async {
  // Create a new multipart request
  var request = http.MultipartRequest('POST', url3);
  request.headers.addAll({
    "Accept": "application/json",
    'Cookie': '$cookies',
  });
  
  // Add form fields to the request
  request.fields['name'] = user.name!;
  request.fields['email'] = user.email!;
  request.fields['password'] = user.password!;
  request.fields['phone'] = user.phone!;
  request.fields['address'] = user.address!;
  request.fields['password_confirmation'] = user.cpass!;
  request.fields['bio'] = user.bio!;
  request.fields['contact'] = user.contacts!;
  request.fields['place_id'] = user.place_id.toString();
  request.fields['city_id'] = user.city_id.toString();
  request.fields['permission_id'] = user.permission_id.toString();

  // Add the photo file to the request
  if (user.photo != null) {
    request.files.add(await http.MultipartFile.fromPath(
      'photo',
      user.photo!.path,
      //contentType: MediaType('image', 'jpeg'),
    ));
  }

  // Send the request and get the response
  var response = await request.send();

  // Convert the response to a string
  var responseString = await response.stream.bytesToString();

  // Handle the response based on the status code
  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(responseString);
    message = jsonResponse["success"];
    token = jsonResponse['access_token'];
    SecureStorage storage = SecureStorage();
    await storage.save('token', token!);

    return true;
  } else if (response.statusCode == 404) {
    var jsonResponse = jsonDecode(responseString);
    message = jsonResponse["message"];
    return false;
  } else {
    message = "??";
    return false;
  }
}
  //image test
// Future<void> sendImageFile(File imageFile) async {
//   // Create a multipart request
//   final request = http.MultipartRequest('POST', Uri.parse('https://example.com/upload'));

//   // Add the image file to the request
//   final imagePart = http.MultipartFile('image', imageFile.readAsBytes().asStream(), imageFile.lengthSync(),
//       filename: imageFile.path.split('/').last);
//   request.files.add(imagePart);

//   // Send the request
//   final response = await request.send();

//   // Check the response status code
//   if (response.statusCode == 200) {
//     // Request was successful
//     print('Image uploaded successfully');
//   } else {
//     // Request failed
//     print('Error uploading image: ${response.reasonPhrase}');
//   }
// }

  Future<bool> sc(User user) async {
    var response = await http.post(url2, headers: {
      "Accept": "application/json",
    }, body: {
      'email': user.email,
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse["success"];
      //cookie = jsonResponse['Cookie'];
      final headers = response.headers;
      headers.forEach((name, value) {
        print('$name: $value');
      });
      cookie = response.headers['set-cookie'];

      await storage.save('cookies', cookie!);
      print(cookie);
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

  Future<bool> cc(User user) async {
    print(user.email);
    print(user.confirmcode);
    var response = await http.post(url, headers: {
      "Accept": "application/json",
    }, body: {
      'email': user.email,
      'verification_code': user.confirmcode,
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse["success"];
      return true;
    } else if (response.statusCode == 404) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse["message kkk"];
      return false;
    } else {
      message = "??";
      return false;
    }
  }

  //test multipart
  Future<void> registerUserWithPhoto(User user) async {
    final url =
        Uri.parse("http://10.0.2.2:8000/api/register/send-confirmation-code");
    final request = http.MultipartRequest('POST', url);
    final photoStream = http.ByteStream(user.photo!.openRead());
    final photoLength = await user.photo!.length();

    request.fields['name'] = user.name!;
    request.fields['address'] = user.address!;
    request.fields['bio'] = user.bio!;
    request.fields['email'] = user.email!;
    request.fields['phone'] = user.phone!;
    request.fields['password'] = user.password!;
    request.fields['password_confirmation'] = user.cpass!;
    request.fields['contact'] = user.bio!;

    request.files.add(http.MultipartFile(
      'photo',
      photoStream,
      photoLength,
      filename: user.photo!.path.split('/').last,
    ));

    final response = await request.send();

    if (response.statusCode == 200) {
      print('User registered successfully!');
    } else {
      print('Error registering user: ${response.statusCode}');
    }
  }
}
