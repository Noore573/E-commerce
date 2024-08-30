import 'dart:convert';
import "package:project2/controllers/Login_Controller.dart";
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:getwidget/getwidget.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ServerConfig {
 static const domainNameServer = "http://10.0.2.2:8000";
  //static const domainNameServer = "http://127.0.0.1:8000";
 // static const domainNameServer = "http://192.168.1.9:8000";

  //auth
  static const register = "/api/register/user";
  static const register2 = "/api/register/code";
  static const register3 = "/api/register/email";
  static const forgetpassword = "/api/password/email";
  static const confirmfp = "/api/password/reset";

  static const login = "/api/login";
  static const logout = "/api/logout";
  static const code = "/api/register/email";
  static const editprofile = "/api/user/profile";
  static const pro = "/api/products";
  //images

  //wishlist
  static const getwish = "/api/experts/all";
  static const addtowish = "/api/wishlist";

  static const getproofile = "/api/myProfile";
  static const getupprofile = "/api/getProfile";

  //products
  static const getpro = "/api/products";
  static const getuserpro = "/api/user/products";
  static const profilter = "/api/products/filters/show";
  static const searchpro = "/api/search";
  //favourites
  static const fav = "/api/favorites";
  static const favlist = "/api/favorite";

  //cart
  static const cart = "/api/cart";

  //order
  static const gaorder = "/api/orders/user";
  static const placeorder = "/api/orders/placeOrder";
  //reports
  static const report = "/api/reports";
  //review
  static const review = "/api/products";
  
  //notification
  static const notif = "/api/notifications";

  //photo test
  static const photo = "/api/photos";

  
  

}
