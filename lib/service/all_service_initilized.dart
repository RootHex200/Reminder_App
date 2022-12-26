import 'package:flutter/material.dart';
import 'package:work_manager/service/deletetamdata.dart';
import 'package:work_manager/service/notification_service.dart';

initlization() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationClass().initiallizationPlatform();
  deleteTmpData();
}
