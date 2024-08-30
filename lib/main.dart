import 'package:flutter/material.dart';
import 'package:project2/Dress.dart';
import 'package:project2/Home.dart';
import 'package:project2/Settings.dart';
import 'package:project2/SignIn1.dart';
import 'package:project2/SignUp.dart';
import 'package:project2/fav1.dart';
import 'package:project2/bindings/profile_binding.dart';
import 'package:project2/bindings/signupBindings.dart';
import 'package:project2/bindings/splash_bindings.dart';
import 'package:project2/cart1.dart';
import 'package:project2/colortest.dart';
import 'package:project2/firstscreen.dart';
import 'package:project2/homepage.dart';

//import 'package:project2/httptest.dart';
import 'package:project2/lory/Me.dart';
import 'package:project2/httptest2.dart';
import 'package:project2/imagetest.dart';
import 'package:project2/lory/Homel1.dart';
import 'package:project2/lory/ItemDetail.dart';
import 'package:project2/lory/Pants.dart';
import 'package:project2/lory/ProductDetail.dart';
import 'package:project2/lory/Shorts.dart';
import 'package:project2/lory/Women.dart';
import 'package:project2/lory/accessories.dart';
import 'package:project2/lory/bags.dart';
import 'package:project2/lory/hats.dart';
import 'package:project2/lory/items.dart';
import 'package:project2/lory/c.dart';
import 'package:project2/lory/jackets.dart';
import 'package:project2/lory/shoes.dart';
import 'package:project2/lory/sportwears.dart';
import 'package:project2/lory/watches.dart';
import 'package:project2/model/splash.dart';
import 'package:project2/myprofile2.dart';
import 'package:project2/myprofile.dart';
import "package:project2/controllers/SignUp_Controller.dart";
import 'package:project2/Login.dart';
import 'package:project2/color.dart';
import 'package:project2/myprofile3.dart';
import 'package:project2/purshaseproduct.dart';
import 'package:project2/protest.dart';
import 'package:project2/register2.dart';
import 'package:project2/register1.dart';
import "package:project2/controllers/Login_Controller.dart";
import 'package:project2/bindings/loginBindings.dart';
import 'package:project2/Men.dart';
import 'package:project2/Women.dart';
import 'package:project2/notiftest.dart';

//packages
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:project2/navbar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:getwidget/getwidget.dart';
import 'package:project2/splash2.dart';
import 'package:project2/tempHome.dart';
import 'package:project2/test.dart';
import 'package:project2/uploadimagetest.dart';
import 'package:project2/uploadproduct%20test.dart';
import 'package:project2/upprofile.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quds_ui_kit/quds_ui_kit.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//import 'package:permission_handler/permission_handler.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'buybroduct.dart';
import 'config/locale.dart';
import 'controllers/theme_controller.dart';
import 'guesthomepage.dart';
import 'lory/UploadProduct.dart';
import 'notification.dart';
import 'server.dart';

SharedPreferences? sharedpref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //sharedpref = await SharedPreferences.getInstance();
  // final channel = WebSocketChannel.connect(
  //   Uri.parse('ws://127.0.0.1:8000/laravel-websockets')
  // );
  // channel.stream.listen((message) {
  //   print('Received message: $message');
  // });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final themeController = Get.put(ThemeController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: themeController.isDarkMode.value
      //     ? Themes.customDark
      //     : Themes.customLight,
      theme: Themeschanger.customLight,
      initialRoute: '/homeL',
      locale: Get.deviceLocale,
      translations: MyLocal(),
      //initialBinding: SignUpBinding(),
      getPages: [
        // GetPage(name: "/myprofile", page:()=> MyProfile()),
        GetPage(name: "/myprofile2", page: () => Myprofile2()),
        GetPage(name: "/items2", page: () => Items2()),
        GetPage(name: "/itemsdetail", page: () => ItemDetail()),
        GetPage(
            name: "/myprofile3",
            page: () => Myprofile3(),
            binding: ProfileBinding()),
        GetPage(name: "/nav", page: () => NavBar()),
        GetPage(name: "/signin", page: () => SignIn2()),
        GetPage(
            name: "/register2",
            page: () => Register2(),
            binding: SignUpBinding()),
        GetPage(name: "/register1", page: () => Register1()),
        //GetPage(name: "/httptest", page: () => HttpTest()),
        GetPage(name: "/httptest2", page: () => HttpTest2()),
        GetPage(
          name: "/login",
          page: () => Login(),
        ),
        // GetPage(name: "/signup", page: () => SignUp(), ),
        GetPage(
          name: "/home",
          page: () => HomePage(),
        ),
        GetPage(
            name: "/splash",
            page: () => Splash(),
            bindings: [ProfileBinding(), SplashBinding()]),
        GetPage(
            name: "/setting",
            page: () => Settings(),
            bindings: [ProfileBinding(), MyBindings()]),
        GetPage(name: "/upprofile", page: () => UpProfile()),
        GetPage(
            name: "/homeL",
            page: () => Home(),
            bindings: [ProfileBinding(), MyBindings()]),
        //GetPage(name: "/homeL", page: () => Home()),
        GetPage(name: "/first", page: () => First()),
        GetPage(name: "/splash2", page: () => Splash2()),
        GetPage(name: "/test", page: () => Test()),
        GetPage(name: "/test2", page: () => Women()),
        GetPage(name: "/dress", page: () => Dress()),
        GetPage(name: "/shorts", page: () => Shorts()),
        GetPage(name: "/pants", page: () => Pants()),
        GetPage(name: "/hats", page: () => Hats()),
        GetPage(name: "/bags", page: () => Bags()),
        GetPage(name: "/accessories", page: () => Acc()),
        GetPage(name: "/watches", page: () => Watches()),
        GetPage(name: "/shoes", page: () => Shoes()),
        GetPage(name: "/sportwear", page: () => SP()),
        GetPage(name: "/jackets", page: () => Jackets()),
        GetPage(name: "/cart1", page: () => Cart1()),
        GetPage(name: "/women", page: () => Women1()),
        GetPage(name: "/productdetail", page: () => ProductDetail()),
        GetPage(name: "/uploadproduct", page: () => UploadProduct()),
        GetPage(name: "/buyproduct", page: () => BuyProduct()),
        GetPage(name: "/notif", page: () => NotificationList()),
        GetPage(name: "/tt2", page: () => UploadImageScreen()),
        GetPage(name: "/guesthome", page: () => GuestHome()),

        //new test
        GetPage(
            name: "/tt",
            page: () => MyHomePage(
                  title: 'notif',
                )),
      ],
      builder: EasyLoading.init(),
    );
  }
}

class Themeschanger {
  static ThemeData customDark = ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(color: Color.fromARGB(255, 0, 0, 0)));
  static ThemeData customLight = ThemeData.light().copyWith(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      color: Color.fromARGB(255, 255, 230, 0),
    ),
  );
}
