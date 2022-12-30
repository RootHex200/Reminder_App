import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:work_manager/model/notification_model.dart';
import 'package:work_manager/view/remindertask/remindertask.dart';

class NotificationClass {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings initializationSettingsAndroid =
      const AndroidInitializationSettings('mipmap/ic_launcher');

  void initiallizationPlatform(context) async {

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (details) {
      if (details.payload != null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ReminderTask(payload: details.payload.toString())),
            (route) => false);
      }
    }
        // onDidReceiveBackgroundNotificationResponse: (details) {
        //   if (details.payload != null) {
        //     String data = details.payload ?? "Name";
        //     var result = "$data";
        //     Navigator.pushAndRemoveUntil(
        //         context,
        //         MaterialPageRoute(
        //             builder: (context) =>
        //                 const ReminderTask(payload: result)),
        //         (route) => false);
        //   }
        // },
        );
  }

  void sendNotification(NotificationModel notificationModel) async {
    // print("Notification Model is call${notificationModel.id} data:${notificationModel.date},TIme:${notificationModel.startTime}");
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails("chanleID", "channelName",
            importance: Importance.max, priority: Priority.high);

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    var df = DateFormat("yyyy-MM-dd h:mm a");
    var dt =
        df.parse('${notificationModel.date} ${notificationModel.startTime}');
    var latest = DateFormat('yyyy-MM-dd HH:mm').format(dt);

    // ignore: deprecated_member_use
    flutterLocalNotificationsPlugin.schedule(
        notificationModel.id,
        notificationModel.title,
        notificationModel.desc,
        DateTime.parse(latest),
        notificationDetails,
        payload: "${notificationModel.title} ${notificationModel.desc} ${notificationModel.startTime}");
  }

  // ignore: non_constant_identifier_names
  void CencelNotification(id) async {
    flutterLocalNotificationsPlugin.cancel(id);
  }
}
