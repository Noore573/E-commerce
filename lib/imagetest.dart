import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project2/config/userinfo.dart';
import 'package:project2/server.dart';

class ImageFromServer extends StatefulWidget {
  @override
  _ImageFromServerState createState() => _ImageFromServerState();
}

class _ImageFromServerState extends State<ImageFromServer> {
   Uint8List? _imageData;

  @override
  void initState() {
    super.initState();
    _fetchImage();
  }

  Future<void> _fetchImage() async {
    var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.getproofile);
    var token=UserInfo.user_token;
    final response = await http.get(url, headers: {
      "Authorization": "Bearer $token",
      "Content-Type": 'application/json',
      "Accept": "application/json",
    });
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var naame = jsonResponse['data'];
      setState(() {

        _imageData = base64Decode(naame.photo.bodyBytes as String );
      });
    } else {
      throw Exception('Failed to load image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image From Server'),
      ),
      body: Center(
        child: _imageData != null
            ? Image.memory(
                _imageData!,
                fit: BoxFit.cover,
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}