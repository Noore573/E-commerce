import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:fatih_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

 // InitializationSettings get initializationSettings => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child: ElevatedButton(
          child: Text('show notification'),
          onPressed: () async {
            showNotification();
          },
        ),
      ),
    );
  }

  showNotification() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

   
    
      



    AndroidNotificationChannel channel = const AndroidNotificationChannel(
      'high channel',
      'Very important notification!!',
      description: 'the first notification',
      importance: Importance.max,
    );

    await flutterLocalNotificationsPlugin.show(
      1,
      'my first notification',
      'a very long message for the user of app',
      NotificationDetails(
        android: AndroidNotificationDetails(channel.id, channel.name,
            channelDescription: channel.description),
      ),
    );
  }
}
      /*ListView(
        children: [
          ElevatedButton(onPressed: (){
            AwesomeNotifications().requestPermissionToSendNotifications();
          }, child:Text("requset permission")),
          SizedBox(height:10),
          ElevatedButton(onPressed: (){
            AwesomeNotifications().createNotification(
                content:NotificationContent(id:1,
                channelKey:"basic key",
                title:"Test title",
                body:"Test body notifications",
                bigPicture:"asset://assets/notifications",
                notificationLayout: NotificationLayout.BigPicture)
            );
          }, child:Text("create")),
          SizedBox(height:10),
          ElevatedButton(onPressed: (){

           /* AwesomeNotifications().createNotification(
                content:NotificationContent(id:1,
                    channelKey:"basic key",
                    title:"Test title",
                    body:"Test body notifications",
                    bigPicture:"asset://assets/notifications",
                    notificationLayout: NotificationLayout.BigPicture,),
                    schedule: NotificationCalendar.fromDate(date: DateTime.now().add(Duration(seconds: 3)))
            );*/

          }, child:Text("schedule")),
          SizedBox(height:10),
        ],
      )*/

  
