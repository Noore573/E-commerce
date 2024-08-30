import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:project2/Services/order_services.dart';
import 'package:project2/native_services/secure_storage.dart';
class OrderController extends GetxController{
  OrderServices services = OrderServices();
  String? cookies = "";
  String? token = "";
    List<dynamic> orderslist =[];
  bool getorderliststatues = false;

   Future<List<dynamic>> gteallorderc(int id) async {
    SecureStorage storage = SecureStorage();
    cookies = await storage.read('cookies');
    token = await storage.read('token');
    print("-------------------------");
    print(token);
    print(cookies);
    print("-------------------------");
    orderslist = await services.getallorders(id,cookies!, token!);
    //String dateOnly = orderDate.substring(0, 10);
    getorderliststatues = true;
    print("orders??: $getorderliststatues");
    update();
    return orderslist;
  }
    Future<List<dynamic>> gtealluncheckedorderc(int id) async {
    SecureStorage storage = SecureStorage();
    cookies = await storage.read('cookies');
    token = await storage.read('token');
    print("-------------------------");
    print(token);
    print(cookies);
    print("-------------------------");
    orderslist = await services.getalluncheckedorders(id,cookies!, token!);
    //String dateOnly = orderDate.substring(0, 10);
    getorderliststatues = true;
    print("orders??: $getorderliststatues");
    update();
    return orderslist;
  }
 

}