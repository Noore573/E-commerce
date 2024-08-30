import 'package:flutter/material.dart';
import 'package:project2/Dress.dart';
import 'package:project2/Home.dart';
import 'package:project2/Settings.dart';
import 'package:project2/SignIn1.dart';
import 'package:project2/SignUp.dart';
import 'package:project2/bindings/profile_binding.dart';
import 'package:project2/bindings/signupBindings.dart';
import 'package:project2/bindings/splash_bindings.dart';
import 'package:project2/cart1.dart';
import 'package:project2/firstscreen.dart';
import 'package:project2/homepage.dart';

//import 'package:project2/httptest.dart';
import 'package:project2/httptest2.dart';
import 'package:project2/imagetest.dart';
import 'package:project2/lory/Homel1.dart';
import 'package:project2/lory/ItemDetail.dart';
import 'package:project2/lory/ProductDetail.dart';
import 'package:project2/lory/Women.dart';
import 'package:project2/lory/items.dart';
import 'package:project2/model/splash.dart';
import 'package:project2/myprofile2.dart';
import 'package:project2/myprofile.dart';
import "package:project2/controllers/SignUp_Controller.dart";
import 'package:project2/Login.dart';
import 'package:project2/color.dart';
import 'package:project2/myprofile3.dart';
import 'package:project2/protest.dart';
import 'package:project2/register2.dart';
import 'package:project2/register1.dart';
import "package:project2/controllers/Login_Controller.dart";
import 'package:project2/bindings/loginBindings.dart';
import 'package:project2/Men.dart';
import 'package:project2/Women.dart';

//packages
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:project2/navbar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:getwidget/getwidget.dart';
import 'package:project2/splash2.dart';
import 'package:project2/test.dart';
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

SharedPreferences? sharedpref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //sharedpref = await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/tt',
      initialBinding: SignUpBinding(),
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
        GetPage(name: "/cart1", page: () => Cart1()),
        GetPage(name: "/women", page: () => Women1()),
        GetPage(name: "/productdetail", page: () => ProductDetail()),
        //new test
        GetPage(name: "/tt", page: () => ProductDetail()),
      ],
      builder: EasyLoading.init(),
    );
  }
}
