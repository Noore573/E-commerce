import 'package:get/get.dart';
import 'package:project2/Services/favourite_Services.dart';
import 'package:project2/Services/wishlist_services.dart';
import 'package:project2/config/userinfo.dart';
import 'package:project2/native_services/secure_storage.dart';

class FavouriteController extends GetxController {
  FavouriteServices services = FavouriteServices();
  var favourites = [];
  String? cookies = "";
  String? token = "";
  List<dynamic> favs = [];
  var message = "";
  RxBool addtofavstatues = false.obs;
  RxBool deletefromfavstatues = false.obs;
  bool getfavsstatues = false;
  bool removefromfavsstatues = false;

  @override
  void onInit() async {
    // SecureStorage storage = SecureStorage();
    // cookies = await storage.read('cookies');
    // token = await storage.read('token');
    update();
    super.onInit();
  }

  void onReady() async {
    // wishlistlist= await services.getwish(UserInfo.user_token);

    super.onReady();
  }

  Future<void> addtofavs(int inde) async {
    print(inde);
     SecureStorage storage = SecureStorage();
    cookies = await storage.read('cookies');
    token = await storage.read('token');
    addtofavstatues.value =
        await services.addtofavourite(inde, cookies!, token!);
   
    //message = services.message;
    update();
    print("fav:$addtofavstatues");
  }

  Future<List<dynamic>> getfavcontroller() async {
    SecureStorage storage = SecureStorage();
    cookies = await storage.read('cookies');
    token = await storage.read('token');
    print(cookies);
    print("-------------------");
    print(token);
    favs = await services.getfavs(cookies!, token!);
    //message = services.message;
    //print(addtowishloststatues);
    getfavsstatues = true;
    update();
    return favs;
  }

  Future<void> deletefromfavscontroller(int inde) async {
    print(inde);
     SecureStorage storage = SecureStorage();
    cookies = await storage.read('cookies');
    token = await storage.read('token');
    addtofavstatues.value =
        await services.deletefromfavs(inde, cookies!, token!);
    //message = services.message;
    update();
    print("fav:$deletefromfavstatues");
  }

  // Future<void> removefromwishlistcontroller(int inde) async {
  //   print(inde);
  //   addtowishloststatues =
  //       await services.removefromowishlist(inde, cookies!, token!);
  //   //message = services.message;
  //   update();
  //   print(removefromowishloststatues);

  // }

  // Future<List<dynamic>> getwishlistcontroller() async {
  //   wishlist = await services.getwishlist(cookies!, token!);
  //   //message = services.message;
  //   //print(addtowishloststatues);
  //   getwishliststatues = true;
  //   update();
  //   return wishlist;
  // }
}
