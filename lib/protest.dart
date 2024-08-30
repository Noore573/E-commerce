import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:project2/native_services/secure_storage.dart';
import 'package:project2/server.dart';

class ProductUploadPage extends StatefulWidget {
  @override
  _ProductUploadPageState createState() => _ProductUploadPageState();
}

class _ProductUploadPageState extends State<ProductUploadPage> {
  final _formKey = GlobalKey<FormState>();

  late String _productName;
  late String _brandName;
  late String _desc;
  late String category;
  late String _gender;
  late String _material;
  late double _productPrice;
  late File _productPhoto;
  late int _productQuantity;
  List<String> _productColors = [];
  List<String> _productSizes = [];

  void _submitForm() async {
    print("o");
      _formKey.currentState!.save();
print("oo");
      // Convert colors map to JSON string
      String colorsJson = json.encode(Map.fromIterable(
        _productColors,
        key: (color) => color,
        value: (_) => true,
      ));

      // Create product data map
      Map<String, dynamic> productData = {
        'name': _productName,
        'price': _productPrice,
        'quantity': _productQuantity,
        'colors': json.decode(colorsJson),
        'sizes': _productSizes,
        'brand_name': _brandName,
        'description': _desc,
        'category': category,
        'gender': _gender,
        'material': _material,
      };

      // Create multipart request
      SecureStorage storage = SecureStorage();
      String? token = await storage.read('token');
      Map<String, String> headers = {"access_token": token!};
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(ServerConfig.domainNameServer + ServerConfig.pro),
      );

      // Add product data fields
      request.fields['name'] = _productName;
      request.fields['brand_name'] = _brandName;
      request.fields['description'] = _desc;
      request.fields['category'] = category;
      request.fields['gender'] = _gender;
      request.fields['material'] = _material;
      request.fields['price'] = _productPrice.toString();
      request.fields['quantity'] = _productQuantity.toString();
      request.fields['colors'] = colorsJson;
      request.fields['sizes'] = json.encode(_productSizes);

      // Add photo file
      var photoFile = await http.MultipartFile.fromPath(
        'photo',
        _productPhoto.path,
      );
      request.headers.addAll(headers);
      request.files.add(photoFile);

      // Send request
      var response = await request.send();

      if (response.statusCode == 200) {
        // Request successful, handle response data
        print("yesss");
        print(await response.stream.bytesToString());
      } else {
        // Request failed, handle error
        print(response.statusCode);
      }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Product Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a product name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _productName = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Product desc'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a product desc';
                  }
                  return null;
                },
                onSaved: (value) {
                  _desc = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Product brand name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a product brand';
                  }
                  return null;
                },
                onSaved: (value) {
                  _brandName = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Product gender'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a product gender';
                  }
                  return null;
                },
                onSaved: (value) {
                  _gender = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Product material'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a product material';
                  }
                  return null;
                },
                onSaved: (value) {
                  _material = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Product category'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a product category';
                  }
                  return null;
                },
                onSaved: (value) {
                  category = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Product Price'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a product price';
                  }
                  return null;
                },
                onSaved: (value) {
                  _productPrice = double.parse(value!);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Product Quantity'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a product quantity';
                  }
                  return null;
                },
                onSaved: (value) {
                  _productQuantity = int.parse(value!);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Product Colors'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please select at least one color';
                  }
                  return null;
                },
                onSaved: (value) {
                  _productColors = value!.split(',');
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Product Sizes'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please select at least one size';
                  }
                  return null;
                },
                onSaved: (value) {
                  _productSizes = value!.split(',');
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Product Photo'),
                validator: (value) {
                  if (_productPhoto == null) {
                    return 'Please select a product photo';
                  }
                  return null;
                },
                onTap: () async {
                  final photo = await ImagePicker().pickImage(
                    source: ImageSource.gallery,
                    maxWidth: 800,
                    maxHeight: 600,
                  );
                  setState(() {
                    _productPhoto = File(photo!.path);
                  });
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                child: Text('Upload Product'),
                onPressed: _submitForm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
