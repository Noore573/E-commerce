import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import 'controllers/notification_controller.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({super.key});
  //NotificationController controller = Get.put(NotificationController());
  //controller.get
  //controller.get
  @override
  Widget build(BuildContext context) {
    NotificationController controller = Get.put(NotificationController());
    controller.getnotifcont();

    return GetBuilder<NotificationController>(
      builder: (controllerbs) => controllerbs.getnotifstatues == false
          ? Center(
              child: GFLoader(
              type: GFLoaderType.circle,
              loaderstrokeWidth: 400,
            ))
          : Scaffold(
              appBar: AppBar(
                title: const Text('Notification'),
              ),
              body: ListView.builder(
                itemCount: controller.notiflist.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onLongPress: () {
                      controller.markasreadcontroller(controller.notiflist[index]['id']);
                    },
                    child: Column(
                      children: [
                        GFListTile(
                          avatar: GFAvatar(
                            backgroundImage: AssetImage(
                              "images/hats111.png",
                            ),
                          ),
                          titleText:
                              '${controller.notiflist[index]["data"]["product_name"]}',
                          //subTitleText: "very good",
                          subTitleText: "New Deleviry Request!",

                          //.productreview[index]['comment'],

                          icon: Icon(Icons.local_shipping),
                        ),
                        Divider()
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
