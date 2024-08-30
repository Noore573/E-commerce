import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:project2/config/userinfo.dart';
import 'package:project2/model/album.dart';
import 'package:project2/model/myprofile.dart';
import 'package:project2/model/profile.dart';
import 'package:project2/model/user.dart';
import 'package:project2/native_services/secure_storage.dart';

import 'package:project2/server.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class MyProfileServices {
  var message;

  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.getproofile);
  var urledit =
      Uri.parse(ServerConfig.domainNameServer + ServerConfig.editprofile);

  Future<Profile> getprofile(String token) async {
    //print("$token");
    //token = UserInfo.user_token;
    SharedPreferences sp = await SharedPreferences.getInstance();
    // SecureStorage storage = SecureStorage();
    // String? token = await storage.read('token');

    var response = await http.get(url, headers: {
      "Authorization": "Bearer $token",
      "Content-Type": 'application/json',
      "Accept": "application/json",
    });
    print(response.statusCode);
    print("hi $token");
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      //  var profile = jsonResponse;

      // var profile = myprofileFromJson(response.body);
      //return wishlist.wishlist;

      print("succ");
      var naame = jsonResponse['data'];
      print("\n eefe ");
      print(naame);
      int userid = naame['id'];
      SecureStorage storage = SecureStorage();
      await storage.save('userid', userid.toString());
      //sp.setInt("id", jsonResponse['name']);
      //print(sp.getString("id"));
      return Profile.fromJson(naame);
    } else {
      return throw Exception("noo");
    }
  }

  Future<Profile> getUserProfileInfoWithPhoto(String token) async {
    final url = Uri.parse('http://10.0.2.2:8000/api/profile');
    final request = http.MultipartRequest('GET', url);
    print(token);
    request.headers.addAll({'Authorization': 'Bearer $token'});

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final parsedResponse = json.decode(responseBody);
      var naame = parsedResponse['data'];
      print(naame);
      // return {
      //   //'photo': File(parsedResponse['photo']),
      //   // 'name': parsedResponse['name'],
      //   // 'address': parsedResponse['address'],
      //   // 'bio': parsedResponse['bio'],
      //   //'data': parsedResponse['data'],
      //   Profile.fromJson(parsedResponse);
      // };
      return Profile.fromJson(naame);
    } else {
      throw Exception(
          'Failed to get user profile info: ${response.statusCode}');
    }
  }

  Future<bool> editprofile(
     File photoprofile,
      File photo,
      String newname,
      String newphone,
      String newpassword,
      String newpasswordconfirm,
      String newcontact,
      String current_password,
      String newbio,
      String newaddress,
      String cookies,
      String token) async {
    // Create a new multipart request
    var request = http.MultipartRequest('POST', urledit);
    request.headers.addAll({
      "Accept": "application/json",
      'Cookie': '$cookies',
       'Authorization': 'Bearer $token'
    });

    // Add form fields to the request
    request.fields['name'] = newname;
    request.fields['current_password'] = current_password;
    request.fields['new_password'] = newpassword;
    request.fields['new_password_confirmation'] = newpasswordconfirm;
    request.fields['phone'] = newphone;
    request.fields['address'] = newaddress;
    request.fields['bio'] = newbio;
    request.fields['contact'] = newcontact;
    
    
      if (photoprofile != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'photo_profile',
        photoprofile.path,
        //contentType: MediaType('image', 'jpeg'),
      ));
    }
    if (photo != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'photo',
        photo.path,
        //contentType: MediaType('image', 'jpeg'),
      ));
    }

    // Send the request and get the response
    var response = await request.send();

    // Convert the response to a string
    var responseString = await response.stream.bytesToString();

    // Handle the response based on the status code
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 404) {
      return false;
    } else {
      print(response.statusCode);
      print(responseString);
      message = "??";
      return false;
    }
  }
  // Future<bool> editprofile(String newname,String newemail,String newphone,String newpassword,String newpasswordconfirm,String newcontact,String current_password,String newbio,String newaddress  String cookies, String token) async {
  //   //  print(
  //   // "${user.email},${user.name},${user.password},${user.phone},${user.address},${user.bio},${user.photo}");
  //   var response = await http.post(urledit, headers: {
  //     "Accept": "application/json",
  //     'Cookie': '$cookies',
  //     'Authorization': 'Bearer $token'
  //   }, body: {
  //     'name': newname,
  //     'phone': '111',
  //     'password': newpassword,
  //     'current_password':current_password,
  //     'phone': newphone,
  //     'address': newaddress,
  //     'bio': newbio,
  //     'contact': newcontact,
  //     "photo" :user.photo,
  //     'photo_profile':user.photo_profile,
  //   });
  //   print(response.statusCode);
  //   print(response.body);
  //   if (response.statusCode == 200) {
  //     var jsonResponse = jsonDecode(response.body);
  //     message = jsonResponse["success"];
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
}
