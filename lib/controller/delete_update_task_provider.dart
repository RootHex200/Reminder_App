import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:work_manager/database/database.dart';
import 'package:work_manager/service/notification_service.dart';

final delupdProvider =
    StateNotifierProvider.autoDispose<DUNotifier, int>((ref) {
  return DUNotifier();
});

class DUNotifier extends StateNotifier<int> {
  DUNotifier() : super(0);

  deleteTask(taskID) {
    var service = IsarService();
    service.deleteTask(taskID);
    NotificationClass().CencelNotification(taskID);
  }
}
