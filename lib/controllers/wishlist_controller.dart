import 'package:get/get.dart';
import 'package:project2/Services/wishlist_services.dart';
import 'package:project2/config/userinfo.dart';
import 'package:project2/native_services/secure_storage.dart';

class WishListController extends GetxController {
  WishListServices services = WishListServices();
  var wishlistlist = [];
  String? cookies = "";
  String? token = "";
  List<dynamic> wishlist = [];
  var message = "";
  bool addtowishloststatues = false;
  bool getwishliststatues = false;
  bool removefromowishloststatues = false;
  @override
  void onInit() async {
    SecureStorage storage = SecureStorage();
    cookies = await storage.read('cookies');
    token = await storage.read('token');
    print(cookies);
    print(token);
    super.onInit();
  }

  void onReady() async {
    // wishlistlist= await services.getwish(UserInfo.user_token);
    super.onReady();
  }

    Future<void> addtowishlistcontroller(int inde) async {
      print(inde);
      addtowishloststatues = await services.addtowishlist(inde, cookies!, token!);
      //message = services.message;
      update();
      print(addtowishloststatues);
    }

  Future<void> removefromwishlistcontroller(int inde) async {
    print(inde);
    addtowishloststatues =
        await services.removefromowishlist(inde, cookies!, token!);
    //message = services.message;
    update();
    print(removefromowishloststatues);
    
  }

  Future<List<dynamic>> getwishlistcontroller() async {
    wishlist = await services.getwishlist(cookies!, token!);
    //message = services.message;
    //print(addtowishloststatues);
    getwishliststatues = true;
    update();
    return wishlist;
  }
}
