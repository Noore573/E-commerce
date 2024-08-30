import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:project2/Services/cart_services.dart';
import 'package:project2/Services/pros_services.dart';
import 'package:project2/model/product.dart';
import 'package:project2/native_services/secure_storage.dart';

class CartController extends GetxController {
  CartServices services = CartServices();
  String? cookies = "";
  String? token = "";
  String? shipping_address = "";
  String? place_id = "";
  String? city_id = "";
  int? city_idd = 1;
  int? place_idd = 1;

  List<dynamic> cartlist = [];
  String carttp = "";
  bool getcartliststatues = false;
  bool deletecartstatues = false;
  bool placeorderstatues = false;
  Future<List<dynamic>> getcartcontroller() async {
    SecureStorage storage = SecureStorage();
    cookies = await storage.read('cookies');
    token = await storage.read('token');
    print("-------------------------");
    print(token);
    print(cookies);
    print("-------------------------");
    cartlist = await services.getcartlist(cookies!, token!);
    getcartliststatues = true;
    print("car?: $getcartliststatues");
    update();
    return cartlist;
  }

  Future<String> getcarttpcontroller() async {
    SecureStorage storage = SecureStorage();
    cookies = await storage.read('cookies');
    token = await storage.read('token');
    carttp = await services.getcartp(cookies!, token!);
    update();
    return carttp;
  }

  void deletecartbyid(int id) async {
    deletecartstatues = await services.deletecart(id, token!, cookies!);
    update();
    print(deletecartstatues);
  }

  Future<void> placeordercontroller() async {
    print("adding...");
    SecureStorage storage = SecureStorage();
    cookies = await storage.read('cookies');
    token = await storage.read('token');
    city_id == 'Damascus'
        ? city_idd = 1
        : city_id == 'Aleppo'
            ? city_idd = 2
            : city_id == 'Latakia'
                ? city_idd = 3
                : city_id == 'Hama'
                    ? city_idd = 4
                    : city_idd = 1;


    place_id == 'حي المزة'
        ? place_idd = 1
        : place_id == 'حي المهاجرين'
            ? place_idd = 2
            : place_id == 'حي قابون'
                ? place_idd = 3
                : place_id == 'حي جرمانا'
                    ? place_idd = 4
                    : place_id == 'حي الجامعة'
                        ? place_idd = 5
                        : place_id == 'حي الازرق'
                            ? place_idd = 6
                            : place_id == 'حي الشعار'
                                ? place_idd = 7
                                : place_id == 'حي الانصاري'
                                    ? place_idd = 8
                                    : place_id == 'حي الاشرفية'
                                        ? place_idd = 9
                                        : place_id == 'حي المطار'
                                            ? place_idd = 10
                                            : place_id == 'حي الاسد'
                                                ? place_idd = 11
                                                : place_id == 'حي المزارع'
                                                    ? place_idd = 12
                                                    : place_id == 'حي المحطة'
                                                        ? place_idd = 13
                                                        : place_id ==
                                                                'حي الحديقة'
                                                            ? place_idd = 14
                                                            : place_id ==
                                                                    'حي الشهباء'
                                                                ? place_idd = 15
                                                                : place_idd = 1;

    print(shipping_address);
    print(city_idd);
    print(place_idd);

    placeorderstatues = await services.placeorder(
        shipping_address!, place_idd!, city_idd!, token!, cookies!);
    update();
    print(" added?:$placeorderstatues");
  }
}
