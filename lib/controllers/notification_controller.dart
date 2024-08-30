import 'package:get/get.dart';

import '../Services/notification_services.dart';
import '../native_services/secure_storage.dart';

class NotificationController extends GetxController {
  NotificationServices services = new NotificationServices();
  List<dynamic> notiflist = [];
  bool getnotifstatues = false;
  bool markasreadstatues = false;
  Future<List<dynamic>> getnotifcont() async {
    SecureStorage storage = SecureStorage();
    String? token1 = await storage.read('token');
    String? cookies1 = await storage.read('cookies');

    notiflist = await services.getnotifserve(token1!, cookies1!);
    getnotifstatues = true;
    print(notiflist);
    print(getnotifstatues);
    update();
    return notiflist;
  }
   void markasreadcontroller(String id) async {
      SecureStorage storage = SecureStorage();
    String? token1 = await storage.read('token');
    String? cookies1 = await storage.read('cookies');
    markasreadstatues = await services.markasreadserve(id, token1!, cookies1!);
    update();
    print(markasreadstatues);
  }
}
