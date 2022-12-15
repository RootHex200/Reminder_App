
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:work_manager/model/notification_model.dart';

class NotificationClass {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings initializationSettingsAndroid =
      const AndroidInitializationSettings("logo");
  void initiallizationPlatform() async {
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,

    );

    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void sendNotification(NotificationModel notificationModel) async {
    // print("Notification Model is call${notificationModel.id} data:${notificationModel.date},TIme:${notificationModel.startTime}");
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails("chanleID", "channelName",
            importance: Importance.max, priority: Priority.high);


    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails);

    var df = DateFormat("yyyy-MM-dd h:mm a");
    var dt =
        df.parse('${notificationModel.date} ${notificationModel.startTime}');
    var latest = DateFormat('yyyy-MM-dd HH:mm').format(dt);

    flutterLocalNotificationsPlugin.schedule(notificationModel.id, notificationModel.title,
        notificationModel.desc, DateTime.parse(latest), notificationDetails);
  }
}
