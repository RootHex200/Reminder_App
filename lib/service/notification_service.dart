import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:work_manager/model/notification_model.dart';

class NotificationClass {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings initializationSettingsAndroid =
      const AndroidInitializationSettings("logo");

  LinuxInitializationSettings initializationSettingsLinux =
      LinuxInitializationSettings(
    defaultActionName: 'Open notification',
    defaultIcon: AssetsLinuxIcon('icons/app_icon.png'),
  );

  void initiallizationPlatform() async {
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      // iOS: initializationSettingsDarwin,
      // macOS: initializationSettingsDarwin,
      linux: initializationSettingsLinux,
    );

    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void sendNotification(NotificationModel notificationModel) async {
    print("Notification Model is call${notificationModel.id} data:${notificationModel.date},TIme:${notificationModel.startTime}");
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails("chanleID", "channelName",
            importance: Importance.max, priority: Priority.high);
    LinuxNotificationDetails linuxNotificationDetails =
        const LinuxNotificationDetails(
      actions: <LinuxNotificationAction>[
        LinuxNotificationAction(
          key: "id_1",
          label: 'Action 1',
        ),
        LinuxNotificationAction(
          key: "id_2",
          label: 'Action 2',
        ),
      ],
    );

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, linux: linuxNotificationDetails);

    // flutterLocalNotificationsPlugin.show(
    //     notificationModel.id,
    //     notificationModel.title,
    //     notificationModel.desc,
    //     notificationDetails);
    var edit_time = "${notificationModel.date} ${notificationModel.startTime}:00";
    flutterLocalNotificationsPlugin.schedule(1, notificationModel.title,
        notificationModel.desc, DateTime.parse(edit_time), notificationDetails);
  }
}
