import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:project2/config/userinfo.dart';
import 'package:project2/model/album.dart';
import 'package:project2/model/myprofile.dart';
import 'package:project2/model/profile.dart';
import 'package:project2/model/upprofile.dart';
import 'package:project2/model/user.dart';
import 'package:project2/native_services/secure_storage.dart';

import 'package:project2/server.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UpProfileServices {
  var message;

  Future<UpProfile> getupprofile(
      int index, String token, String cookies) async {
    var url = Uri.parse(
        ServerConfig.domainNameServer + ServerConfig.getupprofile + '/$index');
    //print("$token");
    //token = UserInfo.user_token;
    // SecureStorage storage = SecureStorage();
    // String? token = await storage.read('token');

    var response = await http.get(url, headers: {
      // "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZTQ0ZDA4YWE4ZmRjZGQ2NGM4NDMyYjUyZWFhMmFhZDI5NmVjZjRiYWRiYTI5YTNmYTNiZDVjNjg4MGQ5ZjQxNTA2NTBjZTQ5OTNkYzlmMzMiLCJpYXQiOjE2ODQ0NDQ4NzMuMTIwMjg2LCJuYmYiOjE2ODQ0NDQ4NzMuMTIwMzAyLCJleHAiOjE3MTYwNjcyNzIuODc2NTcxLCJzdWIiOiI1Iiwic2NvcGVzIjpbXX0.iCSI5BnlnWysh1v9U3WZYzBIuhRp9rl9mthGudRwV-9Jgj218WyfjCkdVtdgB_1nr-0vVfogazL1-t-yLaOGe4sIbAylCw4s0SqS0qTPSCT1tbQVGI-IFv7HrQtOuCvczoIvv43pQ-ugZ1yfnrGgv9z7w0wKzdNhAm_DOulvZ4XsyIry245JOwqu3re0K28pksIrfX0u8QnmlzIs_mxTKyKps75Uuv7m7oLt2ZmEpN9G77XnTktEdFR0_KE6zeNdrv3bMyqcfB_-DecTyssd78bGnlUBNyeLSRjSKv6ru0CNtufAFTYSpEiyHyrB2lWPJVQx1eWOD-z4SSluir3ucJIJHb6av7cTm6ZFYLbvFK6_0PFrqKYTtdYzZgY_vFPRIGJSvo77OfIL0n0JKEXaghDXNg3CmIEshCZ-Pd65xhUoJIscJBxNVEa-FCRu4HcL9k8LLS_MpgGQxWft_j6p8yOcrdvn0p30e41ChMAxTjEInyHuJA7w6U9WFUrUsLQ68YB2oonZJG4jEMAOwji-JHPLAzHOJ5tMzcoZv7o4ZFdkUQ9OSdKrgnqZ3QXeWRw2sGoMtOCxEAYRN3Q7SQwgtrcDkaAS9xpxW23mcJWKXGn261SWwwSI1dDrFGNgyCuiRdzdu0k14YlXIbwIQiATbVlLDPY3fNblzFSN08vejns",
      //'Cookie': 'laravel_session=c2rSwU6PeNmFEXnRgEQYHe8z0ZnNALN1oet5Zlpn',
      "Authorization": "Bearer $token",
      'Cookie': '$cookies',
      "Content-Type": 'application/json',
      "Accept": "application/json",
    });
    print(response.statusCode);
    print("hi $token");
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      print("succ");
      var naame = jsonResponse['data'];
      print("\n eefe ");
      print(naame);

      return UpProfile.fromJson(naame);
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
      //return 
    }
  }

  Future<bool> reportuser(
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
}
