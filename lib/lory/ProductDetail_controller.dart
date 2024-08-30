import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:project2/Services/pros_services.dart';
import 'package:project2/model/product.dart';
import 'package:project2/native_services/secure_storage.dart';

class ProductDetailController extends GetxController {
  ProServices services = ProServices();
  int? proid = 0;
  String? name = "";
  String? description = "";
  String? price = "";
  String? category = '';
  String? gender = '';
  String? brandName = '';
  int? userId = 0;
  String? material = '';
  String? photo = "";
  late List<dynamic> sizes;
  int? quantity = 0;
  int? inStock = 0;
  String? createdAt = '';
  String? updatedAt = '';
  String? userName = '';
  // String? token = "";
  // String? cookies = "";
  String? cookies = "";
  String? token = "";
////////----------
  String? product_id;
  String? color_id="1";
  String? size="large";
  String? quantity2="1";
  String? itemprice = "";
  List<dynamic> colorname = [];
  List<dynamic> Sizes = [];

  //  String? product_id;
  //   String color_id,
  //   String size,
  //   String quantity
  //RxInt index = 1.obs;
  int? ind = 1;

  bool deleteproductstatues = false;
  bool getuserprostatues = false;
  bool pfstatues = false;
  bool pfffstatues = false;
  bool proprofilestatues = false;
  bool addtocartstatues = false;
  bool reportproductstatues = false;
  bool setreviewstatues = false;
  bool getreviewstatues = false;
  //late List<Map<String,dynamic>> colors;
  late List<dynamic> colors;
  List<dynamic> userpro = [];
  List<dynamic> pf = [];
  List<dynamic> pcf = [];
  List<dynamic> productreview = [];

  var thisproduct;

  @override
  void onInit() async {
    SecureStorage storage = SecureStorage();
    cookies = await storage.read('cookies');
    token = await storage.read('token');

    print("int1");

    super.onInit();
  }

  @override
  void onReady() async {
    print("ready2");
    print(token);
    print(cookies);
    // id = thisproduct.id;
    // name = thisproduct.name;
    // description = thisproduct.description;
    // price = thisproduct.price;
    // category = thisproduct.category;
    // gender = thisproduct.gender;
    // brandName = thisproduct.brandName;
    // userId = thisproduct.userId;
    // material = thisproduct.material;
    // sizes = thisproduct.sizes;
    // quantity = thisproduct.quantity;
    // inStock = thisproduct.inStock;
    // userName = thisproduct.userName;
    // colors = thisproduct.colors;
    // createdAt = thisproduct.createdAt;
    // photo = thisproduct.photo;
    // //print(name);
    // print(thisproduct.sizes);
    // update();
    super.onReady();
  }

  void getprobyid(int id) async {
    print(id);
    thisproduct = await services.getproduct(id);
    proid = thisproduct.id;
    name = thisproduct.name;
    description = thisproduct.description;
    price = thisproduct.price;
    category = thisproduct.category;
    gender = thisproduct.gender;
    brandName = thisproduct.brandName;
    userId = thisproduct.userId;
    material = thisproduct.material;
    sizes = thisproduct.sizes;
    quantity = thisproduct.quantity;
    inStock = thisproduct.inStock;
    userName = thisproduct.userName;
    colors = thisproduct.colors;
    createdAt = thisproduct.createdAt;
    photo = thisproduct.photo;
    print(userId);
    colorname = services.colornames;
    Sizes = services.sizes;
    update();
  }

  void deleteproductbyid(int id) async {
    deleteproductstatues = await services.deleteproduct(id, token!, cookies!);
    update();
    print(deleteproductstatues);
  }

  Future<List<dynamic>> getuserproductcontroller() async {
    // print("-------------------------");
    // print(token);
    // print(cookies);
    // print("-------------------------");
    SecureStorage storage = SecureStorage();
    String? token1 = await storage.read('token');
    String? cookies1 = await storage.read('cookies');

    userpro = await services.getuserproduct(cookies1!, token1!);
    getuserprostatues = true;
    print(getuserprostatues);
    update();
    return userpro;
  }

  Future<List<dynamic>> profiltercontroller() async {
    print("-------------------------");
    print(token);
    print(cookies);
    print("-------------------------");
    pf = await services.productfilter();
    pfstatues = true;
    print(pfstatues);
    update();
    return userpro;
  }

  Future<List<dynamic>> profiltercatcontroller(String cat, String gen) async {
    print("-------------------------");
    print(token);
    print(cookies);
    print("-------------------------");
    pf = await services.productfiltercat(cat, gen);
    pfffstatues = true;
    print(pfstatues);
    update();
    return userpro;
  }
  // Future<List<dynamic>> userproducts(String id) async {
  //   print("-------------------------");
  //   print(token);
  //   print(cookies);
  //   print("-------------------------");
  //   pf = await services.productfiltercat(id);
  //   pfstatues = true;
  //   print(pfstatues);
  //   update();
  //   return userpro;
  // }

  Future<List<dynamic>> proprofile(int userid) async {
    print("-------------------------");
    print(token);
    print(cookies);
    print("-------------------------");
    pf = await services.getprofilepro(userid);
    proprofilestatues = true;
    print(pfstatues);
    update();
    return userpro;
  }

  Future<void> addtocartcontroller(String id) async {
    print("adding...");
    SecureStorage storage = SecureStorage();
    cookies = await storage.read('cookies');
    token = await storage.read('token');
    addtocartstatues = await services.addtocart(
        id, color_id!, size!, quantity2!, token!, cookies!);
    //message = services.message;

    update();
    print(" added?:$addtocartstatues");
  }

  Future<void> reportproductcontroller(String description) async {
    print("adding...");
    SecureStorage storage = SecureStorage();
    cookies = await storage.read('cookies');
    token = await storage.read('token');
    reportproductstatues =
        await services.reportproduct("product", description, token!, cookies!);
    //message = services.message;

    update();
    print(" reported?:$reportproductstatues");
  }

  Future<void> setreviewcontroller(
      String rating, String comment, String id) async {
    print("adding...");
    SecureStorage storage = SecureStorage();
    cookies = await storage.read('cookies');
    token = await storage.read('token');
    setreviewstatues =
        await services.setriview(rating, comment, id, token!, cookies!);
    //message = services.message;

    update();
    print(" reviewed?:$setreviewstatues");
  }

  Future<void> getreviewcontroller(int id) async {
    print("adding...");
    SecureStorage storage = SecureStorage();
    cookies = await storage.read('cookies');
    token = await storage.read('token');
    productreview = await services.getreview(id, token!, cookies!);
    getreviewstatues = true;
    //message = services.message;

    update();
    print(" reviewed?:$setreviewstatues");
  }
  
}
